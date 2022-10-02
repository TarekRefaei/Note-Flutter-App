import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../bloc/notes/notes_bloc.dart';
import '../../models/note_model.dart';
import '../widgets/widgets.dart';

class NotesHomeScreen extends StatelessWidget {
  const NotesHomeScreen({Key? key}) : super(key: key);

  static const String routeName = '/';

  static Route route() {
    return MaterialPageRoute(
      builder: (context) => const NotesHomeScreen(),
      settings: const RouteSettings(
        name: routeName,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    List<Note>? notesUptodate;
    return Scaffold(
      appBar: NotesAppBar(
        icons: [
          IconButton(
            onPressed: () {
              Navigator.pushNamed(
                context,
                '/add_user',
              );
            },
            icon: const Icon(Icons.person_add),
          ),
          IconButton(
            onPressed: () {
              Navigator.pushNamed(
                context,
                '/options',
              );
            },
            icon: const Icon(Icons.settings),
          ),
          IconButton(
            onPressed: () {
              showDialog(
                context: context,
                builder: (ctx) => AlertDialog(
                  title: const Text(
                    "Confirm Deleting",
                  ),
                  content: const Text(
                    "Do you really want to remove All notes in Database?",
                  ),
                  actions: <Widget>[
                    TextButton(
                      onPressed: () {
                        context.read<NotesBloc>().add(DeleteAllNotesEvent());
                        Navigator.pop(ctx);
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(
                            content: Text('All Notes Deleted Successfully'),
                          ),
                        );
                      },
                      child: Container(
                        color: Colors.red,
                        padding: const EdgeInsets.all(14),
                        child: Text(
                          "Yes",
                          style: Theme.of(context).textTheme.headline5,
                        ),
                      ),
                    ),
                    TextButton(
                      onPressed: () {
                        Navigator.of(ctx).pop();
                      },
                      child: Container(
                        color: Colors.grey,
                        padding: const EdgeInsets.all(14),
                        child: Text(
                          "No",
                          style: Theme.of(context).textTheme.headline5,
                        ),
                      ),
                    ),
                  ],
                ),
              );
            },
            icon: const Icon(Icons.clear_all),
          ),
        ],
        title: 'Notes',
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(12.0),
            child: Row(
              children: [
                BlocBuilder<NotesBloc, NotesState>(
                  builder: (context, state) {
                    if (state is NotesLoading) {
                      return IconButton(
                        onPressed: () {},
                        icon: const Icon(Icons.filter_list),
                      );
                    }
                    if (state is NotesLoadedState) {
                      return IconButton(
                        onPressed: () {
                          Navigator.pushNamed(
                            context,
                            '/filter_note',
                            arguments: state.notes,
                          );
                        },
                        icon: const Icon(Icons.filter_list),
                      );
                    }
                    if (state is CreateNoteState) {
                      return IconButton(
                        onPressed: () {
                          Navigator.pushNamed(
                            context,
                            '/filter_note',
                            arguments: state.notes,
                          );
                        },
                        icon: const Icon(Icons.filter_list),
                      );
                    }
                    if (state is DeleteNoteState) {
                      return IconButton(
                        onPressed: () {
                          Navigator.pushNamed(
                            context,
                            '/filter_note',
                            arguments: state.notes,
                          );
                        },
                        icon: const Icon(Icons.filter_list),
                      );
                    }
                    if (state is UpdateNoteState) {
                      return IconButton(
                        onPressed: () {
                          Navigator.pushNamed(
                            context,
                            '/filter_note',
                            arguments: state.notes,
                          );
                        },
                        icon: const Icon(Icons.filter_list),
                      );
                    }
                    if (state is AllNotesDeletedState) {
                      return IconButton(
                        onPressed: () {},
                        icon: const Icon(Icons.filter_list),
                      );
                    } else {
                      return Text(state.toString());
                    }
                  },
                ),
                BlocBuilder<NotesBloc, NotesState>(
                  builder: (context, state) {
                    if (state is NotesLoading) {
                      return IconButton(
                        onPressed: () {},
                        icon: const Icon(Icons.search),
                      );
                    }
                    if (state is NotesLoadedState) {
                      return IconButton(
                        onPressed: () {
                          Navigator.pushNamed(
                            context,
                            '/search_note',
                            arguments: state.notes,
                          );
                        },
                        icon: const Icon(Icons.search),
                      );
                    }
                    if (state is CreateNoteState) {
                      return IconButton(
                        onPressed: () {
                          Navigator.pushNamed(
                            context,
                            '/search_note',
                            arguments: state.notes,
                          );
                        },
                        icon: const Icon(Icons.search),
                      );
                    }
                    if (state is DeleteNoteState) {
                      return IconButton(
                        onPressed: () {
                          Navigator.pushNamed(
                            context,
                            '/search_note',
                            arguments: state.notes,
                          );
                        },
                        icon: const Icon(Icons.search),
                      );
                    }
                    if (state is UpdateNoteState) {
                      return IconButton(
                        onPressed: () {
                          Navigator.pushNamed(
                            context,
                            '/search_note',
                            arguments: state.notes,
                          );
                        },
                        icon: const Icon(Icons.search),
                      );
                    }
                    if (state is AllNotesDeletedState) {
                      return IconButton(
                        onPressed: () {},
                        icon: const Icon(Icons.search),
                      );
                    } else {
                      return Text(state.toString());
                    }
                  },
                ),
                const Expanded(child: SizedBox()),
                // IconButton(
                //   onPressed: () {
                //     print(notesUptodate);
                //   },
                //   icon: const Icon(Icons.refresh),
                // ),
              ],
            ),
          ),
          Expanded(
            child: BlocBuilder<NotesBloc, NotesState>(
              builder: (context, state) {
                if (state is NotesLoading) {
                  return const Center(
                    child: CircularProgressIndicator(),
                  );
                }
                if (state is NotesLoadedState) {
                  notesUptodate = state.notes;
                  return ListView.builder(
                      scrollDirection: Axis.vertical,
                      shrinkWrap: true,
                      itemCount: state.notes.length,
                      itemBuilder: (context, index) {
                        return NoteCard(
                          notes: state.notes[index],
                        );
                      });
                }
                if (state is CreateNoteState) {
                  notesUptodate = state.notes;
                  return ListView.builder(
                      scrollDirection: Axis.vertical,
                      shrinkWrap: true,
                      itemCount: state.notes.length,
                      itemBuilder: (context, index) {
                        return NoteCard(
                          notes: state.notes[index],
                        );
                      });
                }
                if (state is UpdateNoteState) {
                  notesUptodate = state.notes;
                  return ListView.builder(
                      scrollDirection: Axis.vertical,
                      shrinkWrap: true,
                      itemCount: state.notes.length,
                      itemBuilder: (context, index) {
                        return NoteCard(
                          notes: state.notes[index],
                        );
                      });
                }
                if (state is DeleteNoteState) {
                  notesUptodate = state.notes;
                  return ListView.builder(
                      scrollDirection: Axis.vertical,
                      shrinkWrap: true,
                      itemCount: state.notes.length,
                      itemBuilder: (context, index) {
                        return NoteCard(
                          notes: state.notes[index],
                        );
                      });
                }
                if (state is AllNotesDeletedState) {
                  return Center(
                    child: Text(
                      'There is no Notes Stored in your phone\n'
                          'Enter New One',
                      style: Theme.of(context).textTheme.headline4?.copyWith(
                            color: Theme.of(context).primaryColor,
                          ),
                      textAlign: TextAlign.center,
                    ),
                  );
                } else {
                  return Text(state.toString());
                }
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(12.0),
            child: Align(
              alignment: Alignment.bottomRight,
              child: FloatingActionButton(
                onPressed: () {
                  Navigator.pushNamed(
                    context,
                    '/edit_note',
                    arguments: const Note(
                      text: '',
                      noteId: '',
                      userId: '',
                    ),
                  );
                },
                backgroundColor: Theme.of(context).primaryColor,
                child: const Icon(Icons.add),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
