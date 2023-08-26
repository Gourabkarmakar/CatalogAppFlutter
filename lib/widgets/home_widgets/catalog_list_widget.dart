import 'package:catalog_app/pages/product_view_page.dart';
import 'package:flutter/material.dart';

import '../../models/products.dart';
import 'catalog_item.dart';

class CatalogList extends StatelessWidget {
  const CatalogList({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      shrinkWrap: true,
      itemCount: Products.items.length,
      itemBuilder: (context, index) {
        final Item catalog = Products.items[index];
        return InkWell(
          onTap: () => Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => ProductView(product: catalog),
              )),
          child: CatalogItem(catalog: catalog),
        );
      },
    );
  }
}
