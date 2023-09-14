class MarketBrandData {
  int id;
  String name;
  String image;
  List<MarketItemData> items;

  MarketBrandData({
    required this.id,
    required this.name,
    required this.image,
    required this.items,
  });
}

class MarketItemData {
  int id;
  String name;
  String image;
  double price;
  double oldPrice;
  String description;
  List<String> avilableSizes;
  bool newItem;
  bool favourite;
  double rate;
  int reviews;
  List<MarketItemData> otherItems;

  MarketItemData({
    required this.id,
    required this.name,
    required this.image,
    required this.price,
    required this.oldPrice,
    required this.avilableSizes,
    required this.description,
    required this.newItem,
    required this.favourite,
    required this.rate,
    required this.reviews,
    required this.otherItems,
  });
}
