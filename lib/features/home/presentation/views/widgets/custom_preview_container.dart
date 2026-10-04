import 'package:bookly_app/core/utils/app_styles.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CustomPreviewContainer extends StatelessWidget {
  const new({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width * (300 / 375),
      height: MediaQuery.of(context).size.height * (48 / 812),
      child: Row(
        children: [
          Material(
            color: Colors.white,
            borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(15),
              bottomLeft: Radius.circular(15),
            ),
            child: InkWell(
              onTap: () {},
              borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(15),
                bottomLeft: Radius.circular(15),
              ),
              // ignore: deprecated_member_use
              splashColor: Colors.black.withOpacity(0.1),
              child: SizedBox(
                width: MediaQuery.of(context).size.width * (300 / 375) / 2,
                height: MediaQuery.of(context).size.height * (48 / 812),
                child: Center(
                  child: Text(
                    "Free",
                    style: GoogleFonts.inter(
                      fontSize: 18,
                      fontWeight: FontWeight.w600,
                      color: Colors.black,
                    ),
                  ),
                ),
              ),
            ),
          ),
          Material(
            color: const Color(0xffEF8262),
            borderRadius: const BorderRadius.only(
              topRight: Radius.circular(15),
              bottomRight: Radius.circular(15),
            ),
            child: InkWell(
              onTap: () {},
              borderRadius: const BorderRadius.only(
                topRight: Radius.circular(15),
                bottomRight: Radius.circular(15),
              ),
              // ignore: deprecated_member_use
              splashColor: Colors.white.withOpacity(0.2),
              child: SizedBox(
                width: MediaQuery.of(context).size.width * (300 / 375) / 2,
                height: MediaQuery.of(context).size.height * (48 / 812),
                child: Center(
                  child: Text(
                    "Free preview",
                    style: Styles.textStyle16.copyWith(
                      fontWeight: FontWeight.w600,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
