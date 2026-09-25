import 'package:bookly_app/features/home/presentation/views/widgets/book_custom_app_bar.dart';
import 'package:flutter/material.dart';

class BookDetailsViewBody extends StatelessWidget {
  const new({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15),
      child: Column(children: [BookCustomAppBar(), SizedBox(height: 33)]),
    );
  }
}
