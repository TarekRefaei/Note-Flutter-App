import 'package:flutter/material.dart';
import 'package:notes/config/theme.dart';
import '../../models/note_model.dart';

class SearchCard extends StatelessWidget {
  final Note notes;

  const SearchCard({
    Key? key,
    required this.notes,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: appTheme().backgroundColor,
      child: Container(
        margin: const EdgeInsets.all(8),
        decoration: BoxDecoration(
          color: appTheme().primaryColorLight,
          borderRadius: BorderRadius.circular(6),
        ),
        child: InkWell(
          onTap: () {
            Navigator.popAndPushNamed(
              context,
              '/edit_note',
              arguments: notes,
            );
          },
          child: ListTile(
            title: Text(
              notes.text!,
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
            ),
          ),
        ),
      ),
    );
  }
}
