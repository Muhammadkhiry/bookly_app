import 'package:bookly_app/features/home/data/models/book_details_model/book_model.dart';
import 'package:bookly_app/features/home/presentation/views/widgets/best_seller_item.dart';
import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';

class FavViewBody extends StatelessWidget {
  const FavViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder<Box<BookModel>>(
      valueListenable: Hive.box<BookModel>('favBox').listenable(),
      builder: (context, box, _) {
        List<BookModel> books = box.values.toList();

        if (books.isEmpty) {
          return const Center(
            child: Text(
              'No favorite books yet',
              style: TextStyle(color: Colors.white, fontSize: 18),
            ),
          );
        }

        return ListView.builder(
          padding: const EdgeInsets.only(top: 16, bottom: 100),
          itemCount: books.length,
          itemBuilder: (context, index) {
            final book = books[index];

            return Dismissible(
              key: Key(book.id?.toString() ?? index.toString()),
              direction: DismissDirection.endToStart,

              background: Container(
                alignment: Alignment.centerRight,
                padding: const EdgeInsets.only(right: 25),
                margin: const EdgeInsets.symmetric(horizontal: 30, vertical: 8),
                decoration: BoxDecoration(
                  color: Colors.redAccent.shade700,
                  borderRadius: BorderRadius.circular(12),
                ),
                child: const Icon(
                  Icons.delete_forever,
                  color: Colors.white,
                  size: 28,
                ),
              ),

              onDismissed: (direction) {
                box.deleteAt(index);

                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    content: Text(
                      '${book.title ?? 'Book'} removed from favorites',
                    ),
                    duration: const Duration(seconds: 2),
                  ),
                );
              },

              child: Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 30,
                  vertical: 8,
                ),
                child: BestSellerItem(bookModel: book),
              ),
            );
          },
        );
      },
    );
  }
}
