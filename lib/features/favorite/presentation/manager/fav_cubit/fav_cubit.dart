import 'package:bloc/bloc.dart';
import 'package:bookly_app/features/favorite/presentation/manager/fav_cubit/fav_state.dart';
import 'package:bookly_app/features/home/data/repos/home_repo.dart';


class FavCubit extends Cubit<FavState> {
  final HomeRepo homeRepo;
  FavCubit(this.homeRepo) : super(FavInitial());

  void getFavorites() async{
    var books =await homeRepo.fetchFavBooks();
    books.fold(
      (failure) {
        emit(FavFailure(failure.errMessage));
      },
      (books) {
        emit(FavSuccess(books));
      },
    );
  }
}
