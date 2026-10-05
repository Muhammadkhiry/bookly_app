import 'package:bookly_app/core/utils/app_styles.dart';
import 'package:bookly_app/features/home/data/models/book_details_model/book_model.dart';
import 'package:bookly_app/features/home/presentation/views/widgets/book_custom_app_bar.dart';
import 'package:bookly_app/features/home/presentation/views/widgets/book_rating.dart';
import 'package:bookly_app/features/home/presentation/views/widgets/custom_list_view_item.dart';
import 'package:bookly_app/features/home/presentation/views/widgets/custom_preview_container.dart';
import 'package:bookly_app/features/home/presentation/views/widgets/similar_list_view.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class BookDetailsViewBody extends StatelessWidget {
  const BookDetailsViewBody({super.key, required this._bookModel});
  final BookModel _bookModel;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15),
      child: ListView(
        children: [
          BookCustomAppBar(bookModel: _bookModel),
          const SizedBox(height: 33),
          SizedBox(
            height: 243,
            child: FittedBox(
              fit: BoxFit.scaleDown,
              child: CustomListViewItem(imageURL: _bookModel.image ?? " "),
            ),
          ),
          const SizedBox(height: 46),
          Text(
            _bookModel.title ?? " ",
            style: GoogleFonts.inter(fontWeight: FontWeight.w500, fontSize: 30),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 5),
          Text(
            (_bookModel.authors != null && _bookModel.authors!.isNotEmpty)
                ? _bookModel.authors![0].name ?? ""
                : "",
            style: GoogleFonts.inter(
              fontWeight: FontWeight.w400,
              fontSize: 18,
              color: Colors.grey,
            ),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 9),
          BookRating(bookModel: _bookModel),
          const SizedBox(height: 33),
          const CustomPreviewContainer(),
          const SizedBox(height: 45),
          Align(
            alignment: Alignment.centerLeft,
            child: Text(
              "You can also like",
              style: Styles.textStyle16.copyWith(fontWeight: FontWeight.w600),
            ),
          ),
          const SizedBox(height: 15),
          const SimilarListView(),
          const SizedBox(height: 20),
        ],
      ),
    );
  }
}
