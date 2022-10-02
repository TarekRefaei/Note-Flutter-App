import 'package:flutter/material.dart';
import '../../config/theme.dart';
import '../../models/note_model.dart';

class NoteCard extends StatelessWidget {
  final Note notes;

  const NoteCard({
    Key? key,
    required this.notes,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(8),
      decoration: BoxDecoration(
        color: appTheme().primaryColorLight,
        borderRadius: BorderRadius.circular(6),
      ),
      child: ListTile(
        title: Text(
          notes.text!,
          maxLines: 2,
          overflow: TextOverflow.ellipsis,
          style: const TextStyle(color: Colors.white),
        ),
        trailing: IconButton(
          onPressed: () {
            Navigator.pushNamed(
              context,
              '/edit_note',
              arguments: notes,
            );
          },
          icon: const Icon(
            Icons.mode,
            color: Colors.white,
          ),
        ),
      ),
    );
  }
}
