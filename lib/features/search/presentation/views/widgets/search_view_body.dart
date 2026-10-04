import 'package:bookly_app/core/utils/app_styles.dart';
import 'package:bookly_app/features/search/presentation/views/widgets/search_results_list_view.dart';
import 'package:bookly_app/features/search/presentation/views/widgets/search_text_field.dart';
import 'package:flutter/material.dart';

class SearchViewBody extends StatelessWidget {
  const new({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 15),
      child: CustomScrollView(
        slivers: [
          SliverToBoxAdapter(
            child: Column(
              children: [
                SearchTextField(),
                SizedBox(height: 16),
                Row(
                  spacing: 7,
                  children: [
                    Text(
                      "Search Result",
                      style: Styles.textStyle20.copyWith(
                        fontWeight: FontWeight.w900,
                        color: Color(0xffE7DEFC),
                      ),
                    ),
                    Text(
                      "• 24 books found",
                      style: Styles.textStyle14.copyWith(
                        fontWeight: FontWeight.w900,
                        fontSize: 12,
                        color: Color(0xffA48B85),
                      ),
                    ),
                    Padding(padding: EdgeInsets.only(top: 16)),
                  ],
                ),
                SizedBox(height: 16),
                SearchResultsListView(),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
