import 'package:catalog_app/models/cartModel.dart';
import 'package:catalog_app/models/products.dart';
import 'package:velocity_x/velocity_x.dart';

class MyStore extends VxStore {
  late Products products;
  late Cart cart;

  MyStore() {
    products = Products();
    cart = Cart();
    cart.catalog = products;
  }
}
