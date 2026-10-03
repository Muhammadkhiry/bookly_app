import 'package:bloc/bloc.dart';
import 'package:bookly_app/features/home/data/models/book_details_model/book_model.dart';
import 'package:bookly_app/features/home/data/repos/book_details_repo.dart';
import 'package:equatable/equatable.dart';

part 'may_also_like_state.dart';

class MayAlsoLikeCubit extends Cubit<MayAlsoLikeState> {
  MayAlsoLikeCubit({required this.bookDetailsRepo})
    : super(MayAlsoLikeInitial());

  final BookDetailsRepo bookDetailsRepo;

  Future fetchFeaturedBooks() async {
    emit(MayAlsoLikeInitial());
    var result = await bookDetailsRepo.fetchMayLikedBooks();

    result.fold(
      (failure) {
        emit(MayAlsoLikeFailure(errMessgae: failure.errMessage));
      },
      (books) {
        emit(MayAlsoLikeSucceeded(books: books));
      },
    );
  }
}
