import 'dart:convert';

import 'package:catalog_app/models/products.dart';
import 'package:catalog_app/utils/myroutes.dart';
import 'package:catalog_app/widgets/hadder_widget.dart';
import 'package:catalog_app/widgets/home_widgets/catalog_list_widget.dart';
import 'package:catalog_app/widgets/myThems.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:velocity_x/velocity_x.dart';

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
    await Future.delayed(const Duration(seconds: 3));
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
      // backgroundColor: myAllThems.backColor,
      backgroundColor: myAllThems.backWhiteColor,
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.blueAccent,
        onPressed: () => Navigator.pushNamed(context, MyAppRoutes.cart),
        child: const Icon(CupertinoIcons.cart),
      ),
      body: SafeArea(
        child: Container(
          padding: Vx.m12,
          // color: Colors.amber,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Harder(),
              if (Products.items.isEmpty)
                const Center(
                  child: CircularProgressIndicator(),
                ).expand()
              else
                const CatalogList().expand(),
            ],
          ),
        ),
      ),
    );
  }
}
