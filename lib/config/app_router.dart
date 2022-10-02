import 'package:flutter/material.dart';
import 'package:notes/ui/screens/filter_note.dart';
import 'package:notes/ui/screens/search_note.dart';
import '../models/note_model.dart';
import '../ui/screens/pages.dart';

class AppRouter {
  static Route onGeneratedRoute(RouteSettings settings) {
    switch (settings.name) {
      case '/':
        return NotesHomeScreen.route();
      case '/add_user':
        return AddUserScreen.route();
      case '/options':
        return OptionsScreen.route();
      case '/edit_note':
        return EditNoteScreen.route(note: settings.arguments as Note);
      case '/search_note':
        return SearchNoteScreen.route(
          originalNotes: settings.arguments as List<Note>,
        );
      case '/filter_note':
        return FilterNoteScreen.route(
          originalNotes: settings.arguments as List<Note>,
        );
    }
    return _errorRoute();
  }

  static Route _errorRoute() {
    return MaterialPageRoute(
      builder: (context) => Scaffold(
        appBar: AppBar(
          title: const Text("Error"),
        ),
      ),
      settings: const RouteSettings(name: '/error'),
    );
  }
}
