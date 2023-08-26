import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';

class Harder extends StatelessWidget {
  const Harder({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        "Galary".text.xl4.bold.make(),
        "The List Images".text.xl.make(),
      ],
    ).p2();
  }
}
