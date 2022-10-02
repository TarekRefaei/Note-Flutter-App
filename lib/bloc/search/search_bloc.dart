import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../models/note_model.dart';
import '../../repository/notes_repository.dart';

part 'search_event.dart';

part 'search_state.dart';

class SearchBloc extends Bloc<SearchEvent, SearchState> {
  final NotesRepository _notesRepository = NotesRepository();

  SearchBloc() : super(const SearchInitial()) {
    on<SearchGetAllNotesForSearchEvent>((event, emit) async {
      emit(const SearchLoadingListState());
      try {
        List<Note> notes = await _notesRepository.getAllNotes();
        emit(SearchLoadedListState(notes,''));
      } catch (message) {
        emit(
          SearchErrorState(
            message.toString(),
          ),
        );
      }
    });

    on<SearchGetNotesWithTextEvent>((event, emit) {
      List<Note> notesList = event.notesList;
      List<Note> filteredList = [];
      filteredList = notesList
          .where(
            (note) => note.text!.toLowerCase().contains(
                  event.text.toLowerCase(),
                ),
          )
          .toList();
      if (event.text != '') {
        emit(
          SearchLoadedListState(
            filteredList,
            event.text
          ),
        );
      } else {
        emit(
          SearchLoadedListState(
            notesList,
            event.text
          ),
        );
      }
    });
  }
}
