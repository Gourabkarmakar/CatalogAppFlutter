import 'package:catalog_app/models/products.dart';
import 'package:catalog_app/utils/myroutes.dart';
import 'package:catalog_app/widgets/addToCart.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';

class ProductView extends StatelessWidget {
  final Item product;
  const ProductView({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
      ),
      bottomNavigationBar: ButtonBar(
        alignment: MainAxisAlignment.spaceBetween,
        buttonPadding: EdgeInsets.zero,
        children: [
          "₹ ${product.price}".text.xl2.bold.make(),
          AddToCart(catalog: product).wh(100, 40),
          // ElevatedButton(
          //   onPressed: () {},
          //   style: ButtonStyle(
          //     backgroundColor: MaterialStateProperty.all(Colors.black54),
          //     shape: MaterialStateProperty.all(
          //       const StadiumBorder(),
          //     ),
          //   ),
          //   child: const Icon(CupertinoIcons.cart_badge_plus),
          //   // child: "Add To Cart ".text.make(),
          // ),
        ],
      ).p16().backgroundColor(Colors.white),
      body: SafeArea(
        child: Column(
          children: [
            Hero(
              tag: Key(product.id.toString()),
              child: Image.network(product.thumbnail).h32(context),
            ).p16(),
            Expanded(
              child: VxArc(
                height: 30.0,
                arcType: VxArcType.convey,
                edge: VxEdge.top,
                child: Container(
                  width: context.screenWidth,
                  color: Colors.white,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      product.title.text.xl2.bold.make(),
                      product.description.text
                          .textStyle(context.captionStyle)
                          .make(),
                      // product.title.text.make()
                    ],
                  ).py32().px16(),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
