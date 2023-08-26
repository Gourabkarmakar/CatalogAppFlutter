import 'package:catalog_app/core/store.dart';
import 'package:catalog_app/models/products.dart';
import 'package:velocity_x/velocity_x.dart';

class Cart {
  // Create singleTone object
  // static final cart = Cart._internal();
  // Cart._internal();
  // factory Cart() => cart;

  late Products _catalog;

  // Collection of id store For cart
  final List<int> _itemIds = [];

  // Get all Items
  Products get catalog => _catalog;

  // Set new catalog
  set catalog(Products new_catalog) {
    assert(new_catalog != null);
    _catalog = new_catalog;
  }

  // get all items in the cart
  List<Item> get items => _itemIds.map((id) => _catalog.getbyId(id)).toList();

  // Add an item
  void add(Item item) {
    _itemIds.add(item.id.toInt());
  }

  // Remove an item
  void remove(Item item) {
    _itemIds.remove(item.id);
  }

  // get Total Price
  num get totalPrice =>
      items.fold(0, (total, current) => total + current.price);
}

class AddMutation extends VxMutation<MyStore> {
  final Item item;

  AddMutation(this.item);
  @override
  perform() {
    // TODO: implement perform
    store!.cart._itemIds.add(item.id.toInt());
  }
}

class RemoveMutation extends VxMutation<MyStore> {
  final Item item;

  RemoveMutation(this.item);
  @override
  perform() {
    // TODO: implement perform
    store!.cart._itemIds.remove(item.id);
  }
}
