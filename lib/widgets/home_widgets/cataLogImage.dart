import 'package:catalog_app/widgets/myThems.dart';
import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';

class CatalogImage extends StatelessWidget {
  final String image;

  const CatalogImage({super.key, required this.image});

  @override
  Widget build(BuildContext context) {
    return Image.network(image)
        .box
        .roundedSM
        .p8
        .color(myAllThems.backColor)
        .make()
        .p8()
        .w32(context);
  }
}
