import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:notes/config/theme.dart';
import 'package:notes/ui/widgets/widgets.dart';
import '../../bloc/filter/filter_bloc.dart';
import '../../models/note_model.dart';
import '../widgets/search_card.dart';

class FilterNoteScreen extends StatelessWidget {
  const FilterNoteScreen({Key? key, required this.filteredNote})
      : super(key: key);
  final List<Note> filteredNote;
  static const String routeName = '/filter_note';

  static Route route({required List<Note> originalNotes}) {
    return MaterialPageRoute(
      builder: (context) => FilterNoteScreen(
        filteredNote: originalNotes,
      ),
      settings: const RouteSettings(
        name: routeName,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: NotesAppBar(
        title: 'Filters',
      ),
      body: Column(
        children: [
          Container(
            padding: const EdgeInsets.all(6),
            width: double.infinity,
            height: 70,
            color: appTheme().primaryColorLight,
            child: Center(
              child: BlocBuilder<FilterBloc, FilterState>(
                builder: (context, state) {
                  if (state is FilterLoadedListState) {
                    return SizedBox(
                      width: double.infinity,
                      height: 150,
                      child: DropdownButtonFormField<String>(
                        iconEnabledColor: Colors.black,
                        iconSize: 30,
                        decoration: buildInputDecoration(
                          Icons.filter_list,
                          'Filters',
                          'Filters',
                        ),
                        hint: const Text('Filters'),
                        items: filteredNote
                            .toSet()
                            .where((note) => note.userId != '')
                            .map(
                              (note) => DropdownMenuItem(
                                value: note.userId.toString(),
                                child: Text(
                                  note.userId.toString(),
                                  style: Theme.of(context).textTheme.headline5,
                                ),
                              ),
                            )
                            .toList(),
                        onChanged: (value) {
                          context.read<FilterBloc>().add(
                                FilterGetNotesWithTextEvent(
                                  value.toString(),
                                  filteredNote,
                                ),
                              );
                        },
                      ),
                      // child: DropdownButtonFormField<String>(
                      //   value: 'state.searchedText',
                      //   iconEnabledColor: Colors.black,
                      //   iconSize: 30,
                      //   decoration: buildInputDecoration(
                      //     Icons.interests,
                      //     'UserId',
                      //     'UserId',
                      //   ),
                      //   hint: const Text('UserId'),
                      //   items: filteredNote
                      //       .toSet()
                      //       .where(
                      //         (note) => note.userId != null,
                      //       )
                      //       .map(
                      //         (item) => DropdownMenuItem(
                      //           value: item.userId!.toString(),
                      //           child: Text(
                      //             item.userId!.toString(),
                      //             style: Theme.of(context).textTheme.headline5,
                      //           ),
                      //         ),
                      //       )
                      //       .toList(),
                      //   onChanged: (text) {
                      //     context.read<FilterBloc>().add(
                      //           FilterGetNotesWithTextEvent(
                      //             text!,
                      //             filteredNote,
                      //           ),
                      //         );
                      //   },
                      // ),
                    );
                  } else {
                    return Center(
                      child: Text(state.toString()),
                    );
                  }
                },
              ),
            ),
          ),
          Expanded(
            child: BlocBuilder<FilterBloc, FilterState>(
              builder: (context, state) {
                if (state is FilterInitial || state is FilterLoadingListState) {
                  return const Center(
                    child: CircularProgressIndicator(),
                  );
                }
                if (state is FilterLoadedListState) {
                  return ListView.builder(
                    itemCount: state.notes.length,
                    itemBuilder: (context, index) {
                      return SearchCard(
                        notes: state.notes[index],
                      );
                    },
                  );
                }
                if (state is FilterErrorState) {
                  return Center(
                    child: Text(state.message),
                  );
                } else {
                  return Center(
                    child: Text(state.toString()),
                  );
                }
              },
            ),
          ),
        ],
      ),
    );
  }
}
