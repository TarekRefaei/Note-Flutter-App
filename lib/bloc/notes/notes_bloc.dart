import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import '../../models/note_model.dart';
import '../../repository/notes_repository.dart';

part 'notes_event.dart';
part 'notes_state.dart';

class NotesBloc extends Bloc<NotesEvent, NotesState> {
  final NotesRepository _notesRepository = NotesRepository();

  NotesBloc() : super(const NotesInitial()) {
    on<GetAllNotesEvent>(
      (event, emit) async {
        emit(const NotesLoading());
        try {
          List<Note> notes = await _notesRepository.getAllNotes();
          emit(NotesLoadedState(notes));
        } catch (message) {
          emit(
            NotesErrorState(
              message.toString(),
            ),
          );
        }
      },
    );

    // on<InsertAllNotes>((event, emit) async {
    //   emit(const NotesLoading());
    //   _notesRepository.deleteAllNotes();
    //   emit(const AllNotesDeletedState());
    // });


    on<DeleteAllNotesEvent>((event, emit) {
      emit(const NotesLoading());
      _notesRepository.deleteAllNotes();
      emit(const AllNotesDeletedState());
    });

    on<CreateNoteEvent>((event, emit) async {
      emit(const NotesLoading());
      await _notesRepository.createNote(event.note);
      List<Note> notes = await _notesRepository.getAllNotes();
      emit(CreateNoteState(notes));
    });

    on<DeleteNoteEvent>((event, emit) async {
      emit(const NotesLoading());
      await _notesRepository.deleteNoteById(event.id);
      List<Note> notes = await _notesRepository.getAllNotes();
      emit(DeleteNoteState(notes));
    });

    on<UpdateNoteEvent>((event, emit) async {
      emit(const NotesLoading());
      await _notesRepository.updateNoteById(event.note);
      List<Note> notes = await _notesRepository.getAllNotes();
      emit(UpdateNoteState(notes));
    });

    on<CloseDBEvent>((event, emit) async {
      await _notesRepository.closeDB();
    });
  }
}
