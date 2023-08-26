import 'package:catalog_app/core/store.dart';
import 'package:catalog_app/models/products.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';

import '../models/cartModel.dart';

class AddToCart extends StatelessWidget {
  final Item catalog;
  AddToCart({
    super.key,
    required this.catalog,
  });

  // final _cart = Cart();

  @override
  Widget build(BuildContext context) {
    final Cart _cart = (VxState.store as MyStore).cart;
    bool isInCart = _cart.items.contains(catalog) ? true : false;

    VxState.watch(
      context,
      on: [AddMutation, RemoveMutation],
    );

    return ElevatedButton(
      onPressed: () {
        if (!isInCart) {
          AddMutation(catalog);
        }
      },
      style: ButtonStyle(
        backgroundColor: MaterialStateProperty.all(Colors.black54),
        shape: MaterialStateProperty.all(const StadiumBorder()),
      ),
      child: isInCart
          ? const Icon(Icons.done)
          : const Icon(CupertinoIcons.cart_badge_plus),
    );
  }
}
