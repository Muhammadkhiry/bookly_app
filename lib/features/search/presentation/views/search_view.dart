import 'package:bookly_app/core/utils/app_styles.dart';
import 'package:bookly_app/features/search/presentation/views/widgets/search_view_body.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class SearchView extends StatelessWidget {
  const new({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(70),
        child: SafeArea(
          child: Row(
            children: [
              SvgPicture.asset("assets/images/Overlay.svg"),
              SizedBox(width: 15),
              Text(
                "Explore search",
                style: Styles.textStyle30.copyWith(
                  fontWeight: FontWeight.w900,
                  color: Color(0xffE7DEFC),
                ),
              ),
            ],
          ),
        ),
      ),
      body: SearchViewBody(),
    );
  }
}
