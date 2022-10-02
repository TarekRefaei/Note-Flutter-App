part of 'notes_bloc.dart';

abstract class NotesState extends Equatable {
  const NotesState();

  @override
  List<Object> get props => [];
}

class NotesInitial extends NotesState {
  const NotesInitial();

  @override
  List<Object> get props => [];
}

class NotesLoading extends NotesState {
  const NotesLoading();

  @override
  List<Object> get props => [];
}

class NotesLoadedState extends NotesState {
  const NotesLoadedState(this.notes);

  final List<Note> notes;

  @override
  List<Object> get props => [notes];
}

class AllNotesDeletedState extends NotesState {
  const AllNotesDeletedState();

  @override
  List<Object> get props => [];
}

class CreateNoteState extends NotesState {
  const CreateNoteState(this.notes);

  final List<Note> notes;

  @override
  List<Object> get props => [notes];
}

class DeleteNoteState extends NotesState {
  const DeleteNoteState(this.notes);

  final List<Note> notes;

  @override
  List<Object> get props => [notes];
}

class UpdateNoteState extends NotesState {
  const UpdateNoteState(this.notes);

  final List<Note> notes;

  @override
  List<Object> get props => [notes];
}

class NotesErrorState extends NotesState {
  const NotesErrorState(this.message);

  final String message;

  @override
  List<Object> get props => [message];
}
