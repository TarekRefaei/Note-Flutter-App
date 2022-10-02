import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../bloc/notes/notes_bloc.dart';
import '../../models/note_model.dart';
import '../widgets/app_bar.dart';
import '../widgets/custom_text_field.dart';

class EditNoteScreen extends StatelessWidget {
  const EditNoteScreen({Key? key, required this.note}) : super(key: key);
  final Note note;

  static const String routeName = '/edit_note';

  static Route route({required Note note}) {
    return MaterialPageRoute(
      builder: (context) => EditNoteScreen(
        note: note,
      ),
      settings: const RouteSettings(
        name: routeName,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    List<String> items = ['0', '1', '2'];
    String? updatedNote = note.text;
    String? updatedUserId;
    return BlocBuilder<NotesBloc, NotesState>(
      builder: (context, state) {
        return Scaffold(
          appBar: NotesAppBar(
            icons: [
              IconButton(
                onPressed: () {
                  if (note.text == '') {
                    context.read<NotesBloc>().add(
                          CreateNoteEvent(
                            Note(
                              text: updatedNote ??= 'Empty Note',
                              placeDateTime: DateTime.now(),
                              noteId: '',
                              userId: updatedUserId ??= '',
                            ),
                          ),
                        );
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(
                        content: Text('Note has been Added Successfully'),
                      ),
                    );
                  } else {
                    context.read<NotesBloc>().add(
                          UpdateNoteEvent(
                            note.copyWith(
                              placeDateTime: DateTime.now(),
                              text: updatedNote ?? 'Empty Note',
                              userId: updatedUserId,
                            ),
                          ),
                        );
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(
                        content: Text('Note has been Updated Successfully'),
                      ),
                    );
                  }
                  Navigator.pop(context);
                },
                icon: const Icon(
                  Icons.save,
                ),
              ),
              IconButton(
                onPressed: () {
                  if (note.text == '') {
                    Navigator.of(context);
                  } else {
                    showDialog(
                      context: context,
                      builder: (ctx) => AlertDialog(
                        title: const Text(
                          "Confirm Deleting",
                        ),
                        content: const Text(
                          "Do you really want to remove this note?",
                        ),
                        actions: <Widget>[
                          TextButton(
                            onPressed: () {
                              context.read<NotesBloc>().add(
                                    DeleteNoteEvent(
                                      note.id!,
                                    ),
                                  );
                              Navigator.popAndPushNamed(context, '/');
                              ScaffoldMessenger.of(context).showSnackBar(
                                const SnackBar(
                                  content: Text('Notes Deleted Successfully'),
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
                  }
                },
                icon: note.text == ''
                    ? const Icon(Icons.cancel_outlined)
                    : const Icon(
                        Icons.delete,
                      ),
              ),
            ],
            title: 'Edit Note',
          ),
          body: Padding(
            padding: const EdgeInsets.all(12.0),
            child: Column(
              children: [
                Container(
                  padding: const EdgeInsets.all(20),
                  color: Theme.of(context).primaryColorLight,
                  child: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(bottom: 5.0),
                        child: CustomTextField(
                          maxLine: 8,
                          initialValue: note.text,
                          onChange: (value) {
                            updatedNote = value;
                          },
                          hintText: 'Enter Your Note',
                          title: 'Notes',
                          icons: Icons.edit,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(bottom: 5.0),
                        child: Center(
                          child: SizedBox(
                            width: double.infinity,
                            child: DropdownButtonFormField<String>(
                              iconEnabledColor: Colors.black,
                              iconSize: 30,
                              decoration: buildInputDecoration(
                                Icons.person,
                                'hintText',
                                'User',
                              ),
                              hint: const Text('Assign to user'),
                              items: items
                                  .map(
                                    (item) => DropdownMenuItem(
                                      value: item,
                                      child: Text(
                                        item,
                                        style: Theme.of(context)
                                            .textTheme
                                            .headline5,
                                      ),
                                    ),
                                  )
                                  .toList(),
                              onChanged: (value) {
                                updatedUserId = value;
                              },
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
