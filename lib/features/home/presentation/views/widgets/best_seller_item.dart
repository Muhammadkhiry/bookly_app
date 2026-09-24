import 'package:bookly_app/core/utils/app_colors.dart';
import 'package:bookly_app/core/utils/app_styles.dart';
import 'package:bookly_app/core/utils/assets.dart';
import 'package:flutter/material.dart';

class BestSellerItem extends StatelessWidget {
  const new({super.key}); // تصحيح اسم الـ Constructor

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.15,
            child: AspectRatio(
              aspectRatio: 2.5 / 4,
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8),
                  image: const DecorationImage(
                    fit: BoxFit.fill,
                    image: AssetImage(AssetsData.testImage),
                  ),
                ),
              ),
            ),
          ),
          const SizedBox(width: 30),

          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  width: MediaQuery.of(context).size.width * 0.5,
                  child: const Text(
                    "The Jungle Book",
                    style: Styles.textStyle20,
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
                const SizedBox(height: 3),
                const Text("Rudyard Kipling", style: Styles.textStyle14),
                const SizedBox(height: 12),
                Row(
                  children: [
                    const Text("19.99 €", style: Styles.textStyle20),
                    const Spacer(),
                    const BookRating(),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class BookRating extends StatelessWidget {
  const BookRating({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: const [
        Icon(Icons.star, size: 16, color: AppColors.kStarColor),
        SizedBox(width: 6.3),
        Text("4.8", style: Styles.textStyle16),
        SizedBox(width: 5),
        Opacity(opacity: 0.5, child: Text("(2390)", style: Styles.textStyle14)),
      ],
    );
  }
}
