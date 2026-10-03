part of 'similar_books_cubit.dart';

sealed class SimilarBooksState extends Equatable {
  const SimilarBooksState();

  @override
  List<Object> get props => [];
}

final class SimilarBooksInitial extends SimilarBooksState {}

final class SimilarBooksSucceeded extends SimilarBooksState {
  final List<BookModel> books;

  const new({required this.books});
}

final class SimilarBooksFailure extends SimilarBooksState {
  final String errMessage;
  const new({required this.errMessage});
}
