import 'package:flutter/material.dart';

class FavViewBody extends StatelessWidget {
  const new({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          child: ListView.builder(
            itemCount: 3,
            itemBuilder: (BuildContext context, int index) {
              return Text("data");
            },
          ),
        ),
      ],
    );
  }
}
