import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:notes/config/theme.dart';
import 'package:notes/ui/widgets/widgets.dart';
import '../../bloc/search/search_bloc.dart';
import '../../models/note_model.dart';
import '../widgets/search_card.dart';

class SearchNoteScreen extends StatelessWidget {
  const SearchNoteScreen({Key? key, required this.searchedNote})
      : super(key: key);
  final List<Note> searchedNote;

  static const String routeName = '/search_note';

  static Route route({required List<Note> originalNotes}) {
    return MaterialPageRoute(
      builder: (context) => SearchNoteScreen(
        searchedNote: originalNotes,
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
        title: 'Search',
      ),
      body: Column(
        children: [
          Container(
            padding: const EdgeInsets.all(6),
            width: double.infinity,
            height: 70,
            color: appTheme().primaryColorLight,
            child: Center(
              child: BlocBuilder<SearchBloc, SearchState>(
                builder: (context, state) {
                  if (state is SearchLoadedListState) {
                    return CustomTextField(
                      maxLine: 1,
                      initialValue: state.searchedText,
                      onChange: (String text) {
                        context.read<SearchBloc>().add(
                              SearchGetNotesWithTextEvent(
                                text,
                                searchedNote,
                              ),
                            );
                      },
                      hintText: 'Enter Keyword',
                      title: 'Search',
                      icons: Icons.search,
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
            child: BlocBuilder<SearchBloc, SearchState>(
              builder: (context, state) {
                if (state is SearchInitial || state is SearchLoadingListState) {
                  return const Center(
                    child: CircularProgressIndicator(),
                  );
                }
                if (state is SearchLoadedListState) {
                  return ListView.builder(
                    itemCount: state.notes.length,
                    itemBuilder: (context, index) {
                      return SearchCard(
                        notes: state.notes[index],
                      );
                    },
                  );
                }
                if (state is SearchErrorState) {
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
