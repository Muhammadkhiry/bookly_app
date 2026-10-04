import 'package:bookly_app/features/home/data/models/book_details_model/book_model.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:hive_flutter/adapters.dart';

class BookCustomAppBar extends StatelessWidget {
  const new({super.key, required this._bookModel});
  final BookModel _bookModel;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        IconButton(
          padding: EdgeInsets.zero,
          onPressed: () => GoRouter.of(context).pop(),
          icon: Icon(Icons.close, size: 32, weight: 50, color: Colors.white),
        ),
        IconButton(
          padding: EdgeInsets.zero,
          onPressed: () {
            var box = Hive.box<BookModel>("favBox");
            box.add(_bookModel);
          },
          icon: Icon(
            Icons.shopping_cart_outlined,
            size: 25,
            weight: 50,
            color: Colors.white,
          ),
        ),
      ],
    );
  }
}
