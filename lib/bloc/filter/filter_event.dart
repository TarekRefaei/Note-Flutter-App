part of 'filter_bloc.dart';

abstract class FilterEvent extends Equatable {
  const FilterEvent();
}

class FilterGetAllNotesForFilterEvent extends FilterEvent {
  const FilterGetAllNotesForFilterEvent();

  @override
  List<Object> get props => [];
}

class FilterGetNotesWithTextEvent extends FilterEvent {
  const FilterGetNotesWithTextEvent(this.text, this.notesList);

  final String text;
  final List<Note> notesList;

  @override
  List<Object> get props => [notesList, text];
}