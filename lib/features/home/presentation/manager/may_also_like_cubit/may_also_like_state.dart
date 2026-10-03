part of 'may_also_like_cubit.dart';

sealed class MayAlsoLikeState extends Equatable {
  const MayAlsoLikeState();

  @override
  List<Object> get props => [];
}

final class MayAlsoLikeInitial extends MayAlsoLikeState {}

final class MayAlsoLikeSucceeded extends MayAlsoLikeState {
  final List<BookModel> books;

  const new({required this.books});
}

final class MayAlsoLikeFailure extends MayAlsoLikeState {
  final String errMessgae;

  const new({required this.errMessgae});
}
