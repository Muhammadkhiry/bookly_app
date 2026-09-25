import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class BookCustomAppBar extends StatelessWidget {
  const new({super.key});

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
          onPressed: () {},
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
