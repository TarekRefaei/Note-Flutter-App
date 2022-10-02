part of 'search_bloc.dart';

abstract class SearchEvent extends Equatable {
  const SearchEvent();

  @override
  List<Object> get props => [];
}

class SearchGetAllNotesForSearchEvent extends SearchEvent {
  const SearchGetAllNotesForSearchEvent();

  @override
  List<Object> get props => [];
}

class SearchGetNotesWithTextEvent extends SearchEvent {
  const SearchGetNotesWithTextEvent(this.text, this.notesList);

  final String text;
  final List<Note> notesList;

  @override
  List<Object> get props => [notesList, text];
}
