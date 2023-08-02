class Item {
  final num id;
  final String title;
  final num price;
  final String description;
  final String thumbnail;
  final double discountPercentage;

  Item(
      {required this.id,
      required this.title,
      required this.price,
      required this.description,
      required this.thumbnail,
      required this.discountPercentage});

  factory Item.fromMap(Map<String, dynamic> map) {
    return Item(
      id: map["id"],
      title: map["title"],
      price: map["price"],
      description: map["description"],
      thumbnail: map["thumbnail"],
      discountPercentage: map["discountPercentage"],
    );
  }
}

class Products {
  static List<Item> items = [];
}
