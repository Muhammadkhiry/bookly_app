part of 'featured_books_cubit.dart';

sealed class FeaturedBooksState extends Equatable {
  const FeaturedBooksState();

  @override
  List<Object> get props => [];
}

final class FeaturedBooksInitial extends FeaturedBooksState {}

final class FeaturedBooksSucceeded extends FeaturedBooksState {
  final List<BookModel> books;

  const FeaturedBooksSucceeded({required this.books});
}

final class FeaturedBooksFailure extends FeaturedBooksState {
  final String errMessgae;

  const FeaturedBooksFailure({required this.errMessgae});
}
