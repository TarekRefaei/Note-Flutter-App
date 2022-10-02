import 'package:flutter/material.dart';

class NotesAppBar extends StatelessWidget with PreferredSizeWidget {

  final String title;
  final List<Widget>? icons;


  NotesAppBar({
    Key? key, required this.title, this.icons,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      elevation: 0,
      backgroundColor: Theme.of(context).primaryColor,
      title: Text(
        title,
        style: Theme.of(context).textTheme.headline2?.copyWith(
          color: Colors.white,
        ),
      ),
      actions: icons
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(60);
}