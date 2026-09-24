import 'package:bookly_app/core/utils/assets.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class CustomAppBar extends StatelessWidget {
  const new({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Image.asset(AssetsData.logo, width: 75, height: 16),
        IconButton(
          onPressed: () {},
          icon: FaIcon(
            FontAwesomeIcons.magnifyingGlass,
            size: 25,
            color: Colors.white,
          ),
        ),
      ],
    );
  }
}
