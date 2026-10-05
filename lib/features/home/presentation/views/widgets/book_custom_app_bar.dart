import 'package:bookly_app/features/favorite/presentation/manager/fav_cubit/fav_cubit.dart';
import 'package:bookly_app/features/home/data/models/book_details_model/book_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:hive_flutter/adapters.dart';

class BookCustomAppBar extends StatelessWidget {
  const BookCustomAppBar({super.key, required this.bookModel});

  final BookModel bookModel;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        IconButton(
          padding: EdgeInsets.zero,
          onPressed: () => GoRouter.of(context).pop(),
          icon: const Icon(Icons.close, size: 32, color: Colors.white),
        ),
        IconButton(
          padding: EdgeInsets.zero,
          onPressed: () {
            var box = Hive.box<BookModel>("favBox");

            bool isExist = box.values.any((item) => item.id == bookModel.id);

            if (!isExist) {
              box.add(bookModel);

              BlocProvider.of<FavCubit>(context).fetchFavBooks();

              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(content: Text('Added to Favorites!')),
              );
            } else {
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(content: Text('Already in Favorites!')),
              );
            }
          },
          icon: const Icon(
            Icons.shopping_cart_outlined,
            size: 25,
            color: Colors.white,
          ),
        ),
      ],
    );
  }
}
