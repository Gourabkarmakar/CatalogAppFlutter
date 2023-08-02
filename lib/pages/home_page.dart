import 'dart:convert';

import 'package:catalog_app/models/products.dart';
import 'package:catalog_app/widgets/item_widget.dart';
import 'package:catalog_app/widgets/myDrawer.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  void initState() {
    super.initState();
    loadData();
  }

  loadData() async {
    await Future.delayed(const Duration(seconds: 1));
    final listItems = await rootBundle.loadString("assets/files/products.json");
    final decode = jsonDecode(listItems);
    var finalData = decode["products"];
    Products.items =
        List.from(finalData).map<Item>((item) => Item.fromMap(item)).toList();
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text("Galary"),
        ),
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: (Products.items.isEmpty)
              ? const Center(
                  child: CircularProgressIndicator(),
                )
              : ListView.builder(
                  itemCount: Products.items.length,
                  itemBuilder: (context, index) {
                    return ItemWidget(item: Products.items[index]);
                  },
                ),
        ),
        drawer: const myDrawer());
  }
}
