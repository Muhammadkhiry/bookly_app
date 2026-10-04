import 'package:bookly_app/features/home/data/models/book_details_model/book_model.dart';
import 'package:equatable/equatable.dart';

abstract class FavState extends Equatable {
  const FavState();

  @override
  List<Object?> get props => [];
}

class FavInitial extends FavState {}

class FavLoading extends FavState {}

class FavSuccess extends FavState {
  final List<BookModel> books;

  const FavSuccess(this.books);

  @override
  List<Object?> get props => [books];
}

class FavFailure extends FavState {
  final String errMessage;

  const FavFailure(this.errMessage);

  @override
  List<Object?> get props => [errMessage];
}