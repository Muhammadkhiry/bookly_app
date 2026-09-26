import 'package:bookly_app/core/utils/app_styles.dart';
import 'package:bookly_app/features/home/presentation/views/widgets/book_custom_app_bar.dart';
import 'package:bookly_app/features/home/presentation/views/widgets/book_rating.dart';
import 'package:bookly_app/features/home/presentation/views/widgets/custom_list_view_item.dart';
import 'package:bookly_app/features/home/presentation/views/widgets/custom_preview_container.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class BookDetailsViewBody extends StatelessWidget {
  const new({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          BookCustomAppBar(),
          SizedBox(height: 33),
          CustomListViewItem(),
          SizedBox(height: 46),
          Text(
            "The Jungle Book",
            style: GoogleFonts.inter(fontWeight: FontWeight.w500, fontSize: 30),
          ),
          SizedBox(height: 5),
          Text(
            "Rudyard Kipling",
            style: GoogleFonts.inter(
              fontWeight: FontWeight.w400,
              fontSize: 18,
              color: Colors.grey,
            ),
          ),
          SizedBox(height: 9),
          BookRating(),
          SizedBox(height: 33),
          CustomPreviewContainer(),
          SizedBox(height: 45),
          Align(
            alignment: Alignment.centerLeft,
            child: Text(
              "You can also like",
              style: Styles.textStyle16.copyWith(fontWeight: FontWeight.w600),
            ),
          ),
          SizedBox(height: 15),
          Expanded(
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: 10,
              itemBuilder: (context, index) => SizedBox(
                height: MediaQuery.of(context).size.height * 0.1379,
                width: MediaQuery.of(context).size.width * 0.27,
                child: CustomListViewItem(),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
