import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../models/note_model.dart';
import '../../repository/notes_repository.dart';

part 'filter_event.dart';

part 'filter_state.dart';

class FilterBloc extends Bloc<FilterEvent, FilterState> {
  FilterBloc() : super(const FilterInitial()) {
    on<FilterGetAllNotesForFilterEvent>((event, emit) async {
      final NotesRepository _notesRepository = NotesRepository();
      emit(const FilterLoadingListState());
      try {
        List<Note> notes = await _notesRepository.getAllNotes();
        emit(FilterLoadedListState(notes, ''));
      } catch (message) {
        emit(
          FilterErrorState(
            message.toString(),
          ),
        );
      }
    });

    on<FilterGetNotesWithTextEvent>((event, emit) {
      List<Note> notesList = event.notesList;
      List<Note> filteredList = [];

      filteredList = notesList
          .toSet()
          .where(
            (note) => note.userId != '',
          )
          .where(
            (note) => note.userId!.contains(event.text),
          )
          .toList();

      if (event.text != '') {
        if(filteredList != []){
          emit(
            FilterLoadedListState(filteredList, event.text),
          );
        }else {
          emit(
            const FilterErrorState('No Result')
          );
        }
      } else {
        emit(
            const FilterErrorState('No Result')
        );
      }
    });
  }
}
