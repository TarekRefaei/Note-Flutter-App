part of 'notes_bloc.dart';
abstract class NotesEvent extends Equatable {
  const NotesEvent({this.notes});

  final List<Note>? notes;

  @override
  List<Object?> get props => [notes];
}

class GetAllNotesEvent extends NotesEvent {
  const GetAllNotesEvent();

  @override
  List<Object> get props => [];
}


class CreateNoteEvent extends NotesEvent {
  const CreateNoteEvent(this.note);

  final Note note;

  @override
  List<Object> get props => [note];
}

class DeleteNoteEvent extends NotesEvent {
  const DeleteNoteEvent(this.id);

  final int id;

  @override
  List<Object> get props => [id];
}

class UpdateNoteEvent extends NotesEvent {
  const UpdateNoteEvent(this.note);

  final Note note;

  @override
  List<Object> get props => [note];
}

class DeleteAllNotesEvent extends NotesEvent {}

class CloseDBEvent extends NotesEvent {}
