import 'package:bookly_app/core/utils/app_colors.dart';
import 'package:bookly_app/core/utils/app_styles.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class BookRating extends StatelessWidget {
  const BookRating({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      spacing: 3,
      children: [
        FaIcon(
          FontAwesomeIcons.solidStar,
          size: 16,
          color: AppColors.kStarColor,
        ),
        SizedBox(width: 6.3),
        Text(
          "4.8",
          style: Styles.textStyle16.copyWith(fontWeight: FontWeight.bold),
        ),
        SizedBox(width: 5),
        Opacity(opacity: 0.5, child: Text("(2390)", style: Styles.textStyle14)),
      ],
    );
  }
}
