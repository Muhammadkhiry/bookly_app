part of 'best_books_cubit.dart';

sealed class BestBooksState extends Equatable {
  const BestBooksState();

  @override
  List<Object> get props => [];
}

final class BestBooksInitial extends BestBooksState {}

final class BestBooksSucceeded extends BestBooksState {
  final List<BookModel> books;

  const BestBooksSucceeded({required this.books});
}

final class BestBooksFailure extends BestBooksState {
  final String errMessgae;

  const BestBooksFailure({required this.errMessgae});
}
