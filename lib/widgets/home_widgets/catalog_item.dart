import 'package:catalog_app/models/cartModel.dart';
import 'package:catalog_app/models/products.dart';
import 'package:catalog_app/widgets/home_widgets/cataLogImage.dart';
import 'package:catalog_app/widgets/myThems.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';

import '../addToCart.dart';

class CatalogItem extends StatelessWidget {
  final Item catalog;
  const CatalogItem({super.key, required this.catalog});

  @override
  Widget build(BuildContext context) {
    return VxBox(
      child: Row(
        children: [
          Hero(
              tag: Key(catalog.id.toString()),
              child: CatalogImage(image: catalog.thumbnail)),
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                catalog.title.length > 20
                    ? catalog.title
                        .replaceRange(20, catalog.title.length, "...")
                        .text
                        .medium
                        .bold
                        .make()
                    : catalog.title.text.medium.bold.make(),
                Text(
                  catalog.description,
                  overflow: TextOverflow.ellipsis,
                  style: const TextStyle(fontSize: 10),
                ),
                ButtonBar(
                  alignment: MainAxisAlignment.spaceBetween,
                  buttonPadding: EdgeInsets.zero,
                  children: [
                    "₹ ${catalog.price}".text.bold.make(),
                    AddToCart(catalog: catalog),
                  ],
                ).pOnly(right: 8.0),
              ],
            ),
          ),
        ],
      ),
    ).white.rounded.square(100).make().py8();
  }
}
