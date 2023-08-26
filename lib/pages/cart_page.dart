import 'dart:io';
import 'package:catalog_app/core/store.dart';
import 'package:catalog_app/models/cartModel.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';

class CartPage extends StatelessWidget {
  const CartPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        title: "Cart".text.xl2.bold.make(),
      ),
      body: Padding(
        padding: EdgeInsets.zero,
        child: Column(
          children: [
            // const Placeholder().p4().expand(),
            const _CartItems().expand(),
            const CartTail(),
          ],
        ),
      ),
    );
  }
}

class _CartItems extends StatelessWidget {
  const _CartItems({super.key});

  // final _listOfcarts = Cart();
  @override
  Widget build(BuildContext context) {
    final Cart _listOfcarts = (VxState.store as MyStore).cart;
    VxState.watch(context, on: [RemoveMutation]);
    return _listOfcarts.items.isEmpty
        ? "Empty cart add some Item".text.xl3.make().centered()
        : ListView.builder(
            itemCount: _listOfcarts.items.length,
            itemBuilder: (context, index) => ListTile(
              leading: const Icon(
                Icons.done,
                color: Colors.green,
              ),
              trailing: IconButton(
                color: Colors.redAccent,
                onPressed: () {
                  // _listOfcarts.remove(_listOfcarts.items[index]);
                  RemoveMutation(_listOfcarts.items[index]);
                },
                icon: const Icon(Icons.remove_circle_outline),
              ),
              title: _listOfcarts.items[index].title.text.make(),
            ),
          );
  }
}

class CartTail extends StatelessWidget {
  // final cartItems = Cart();
  const CartTail({super.key});

  @override
  Widget build(BuildContext context) {
    final Cart cartItems = (VxState.store as MyStore).cart;
    return Container(
      padding: const EdgeInsets.all(16.0),
      child: SizedBox(
        height: 50,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            "₹ ${cartItems.totalPrice}"
                .text
                .xl2
                .textStyle(context.captionStyle)
                .bold
                .make()
                .p4(),
            ElevatedButton(
              onPressed: () {
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    content: "Buying Not Supported Yet".text.xl.make(),
                  ),
                );
              },
              style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all(Colors.black54),
                shape: MaterialStateProperty.all(const StadiumBorder()),
              ),
              // child: "Pay Now".text.xl.bold.make().py8(),
              child: const Icon(Icons.payment).wh10(context).w20(context),
            ),
          ],
        ),
      ),
    );
  }
}
