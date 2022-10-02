part of 'filter_bloc.dart';

abstract class FilterState extends Equatable {
  const FilterState();
}

class FilterInitial extends FilterState {
  @override
  List<Object> get props => [];

  const FilterInitial();
}

class FilterLoadingListState extends FilterState {
  @override
  List<Object> get props => [];

  const FilterLoadingListState();
}

class FilterLoadedListState extends FilterState {
  const FilterLoadedListState(this.notes, this.searchedText);

  final List<Note> notes;
  final String searchedText;

  @override
  List<Object> get props => [notes,searchedText];
}

class FilterErrorState extends FilterState {
  const FilterErrorState(this.message);

  final String message;

  @override
  List<Object> get props => [message];
}
