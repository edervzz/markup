class Property {
  final int id;
  final PriceFor priceFor;
  final PropKind kind;
  final int rooms;
  final int bathrooms;
  final int levels;
  final double mt2;
  final String propertyName;
  final String location;
  final double price;
  final String imageUrl;
  bool isFavorite;

  Property({
    required this.id,
    required this.priceFor,
    required this.kind,
    required this.rooms,
    required this.bathrooms,
    required this.levels,
    required this.mt2,
    required this.propertyName,
    required this.location,
    required this.price,
    required this.imageUrl,
    required this.isFavorite,
  });
}

enum PropKind {
  project,
  office,
  estate,
  preOwned,
}

enum PriceFor {
  forRent,
  forBuy,
}
