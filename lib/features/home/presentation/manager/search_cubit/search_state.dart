import 'package:bookly_app/features/home/data/models/book_details_model/book_model.dart';
import 'package:equatable/equatable.dart';

abstract class SearchState extends Equatable {
  const SearchState();

  @override
  List<Object?> get props => [];
}

class SearchInitial extends SearchState {}

class SearchLoading extends SearchState {}

class SearchSuccess extends SearchState {
  final List<BookModel> books;

  const SearchSuccess({required this.books});

  @override
  List<Object?> get props => [books];
}

class SearchFailure extends SearchState {
  final String errMessage;

  const SearchFailure({required this.errMessage});

  @override
  List<Object?> get props => [errMessage];
}