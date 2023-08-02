import 'package:catalog_app/models/products.dart';
import 'package:flutter/material.dart';

class ItemWidget extends StatelessWidget {
  final Item item;

  const ItemWidget({super.key, required this.item});

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: const StadiumBorder(),
      margin: const EdgeInsets.all(8.0),
      child: ListTile(
        leading: Image.network(item.thumbnail),
        title: Text(item.title),
        subtitle: Text(item.description),
        trailing: Text(item.price.toString()),
      ),
    );
  }
}
