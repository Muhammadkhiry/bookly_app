import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class SearchTextField extends StatelessWidget {
  const new({super.key});

  @override
  Widget build(BuildContext context) {
    return TextField(
      decoration: InputDecoration(
        filled: true,
        fillColor: Color(0xff1D182E),
        hintText: "Search for books, authors, or genres",
        hintStyle: TextStyle(fontSize: 14),
        border: InputBorder.none,
        contentPadding: EdgeInsets.symmetric(vertical: 25),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(17),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(17),
        ),
        prefixIcon: IconButton(
          onPressed: () {},
          icon: FaIcon(
            FontAwesomeIcons.magnifyingGlass,
            size: 25,
            color: Color(0xffA48B85),
          ),
        ),
        suffixIcon: Padding(
          padding: const EdgeInsets.only(right: 14.0),
          child: SvgPicture.asset("assets/images/Button - Filter options.svg"),
        ),
      ),
    );
  }
}
