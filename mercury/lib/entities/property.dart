class Property {
  final int id;
  final String type;
  final int rooms;
  final int bathrooms;
  final int levels;
  final double mt2;
  final String propertyName;
  final String location;
  final double price;
  final bool isFavorite;

  Property({
    required this.id,
    String type = "buy",
    required this.rooms,
    required this.bathrooms,
    required this.levels,
    required this.mt2,
    required this.propertyName,
    required this.location,
    required this.price,
    required this.isFavorite,
  }) : type = type.toUpperCase();
}
