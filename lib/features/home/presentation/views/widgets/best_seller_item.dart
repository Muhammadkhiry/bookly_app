import 'package:bookly_app/core/utils/app_router.dart';
import 'package:bookly_app/core/utils/app_styles.dart';
import 'package:bookly_app/core/utils/assets.dart';
import 'package:bookly_app/features/home/data/models/book_details_model/book_model.dart';
import 'package:bookly_app/features/home/presentation/views/widgets/book_rating.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class BestSellerItem extends StatelessWidget {
  const new({super.key, required this._bookModel});
  final BookModel _bookModel;
  static late BookModel detailsModel;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 15.0),
      child: Material(
        color: Color(0xff1D182E),
        borderRadius: BorderRadius.circular(15),
        child: InkWell(
          borderRadius: BorderRadius.circular(15),
          // ignore: deprecated_member_use
          splashColor: Colors.white.withOpacity(0.08),
          // ignore: deprecated_member_use
          highlightColor: Colors.white.withOpacity(0.04),
          onTap: () {
            detailsModel = _bookModel;
            FocusManager.instance.primaryFocus?.unfocus();
            GoRouter.of(context).push(AppRouter.kBookDetails);
          },
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.15,
                  child: AspectRatio(
                    aspectRatio: 2.5 / 4,
                    child: ClipRRect(
                      borderRadius: BorderRadiusGeometry.circular(15),
                      child: CachedNetworkImage(
                        fit: BoxFit.fill,
                        errorWidget: (context, url, error) => Icon(Icons.error),
                        imageUrl: _bookModel.image ?? "",
                      ),
                    ),
                  ),
                ),
                const SizedBox(width: 30),

                Expanded(
                  child: Column(
                    spacing: 2,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                        width: MediaQuery.of(context).size.width * 0.5,
                        child: Text(
                          _bookModel.title!,
                          style: Styles.textStyle20.copyWith(
                            fontFamily: AssetsData.kGTSectraFine,
                          ),
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                      const SizedBox(height: 3),
                      Text(
                        _bookModel.authors![0].name!,
                        style: Styles.textStyle14,
                      ),
                      const SizedBox(height: 12),
                      Row(
                        children: [
                          Text(
                            "Free",
                            style: Styles.textStyle20.copyWith(
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          const Spacer(),
                          Expanded(child: BookRating(bookModel: _bookModel)),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
