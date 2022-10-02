part of 'search_bloc.dart';

abstract class SearchState extends Equatable {
  const SearchState();
}

class SearchInitial extends SearchState {
  @override
  List<Object> get props => [];

  const SearchInitial();
}

class SearchLoadingListState extends SearchState {
  @override
  List<Object> get props => [];

  const SearchLoadingListState();
}

class SearchLoadedListState extends SearchState {
  const SearchLoadedListState(this.notes, this.searchedText);

  final List<Note> notes;
  final String searchedText;

  @override
  List<Object> get props => [notes,searchedText];
}

class SearchErrorState extends SearchState {
  const SearchErrorState(this.message);

  final String message;

  @override
  List<Object> get props => [message];
}
