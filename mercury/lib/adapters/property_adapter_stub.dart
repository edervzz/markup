import 'package:mercury/domain/entities/_entities.dart';
import 'package:mercury/domain/repository/property_repository.dart';

class PropertyAdapterStub implements PropertyRepository {
  @override
  Future<List<Property>> read(String key) {
    List<Property> properties = List.empty(growable: true);
    properties.add(
      Property(
          id: 1,
          type: "buy",
          rooms: 1,
          bathrooms: 3,
          levels: 2,
          mt2: 400,
          propertyName: "Alamo",
          location: "Insurgentes Sur",
          price: 2000001,
          imageUrl: "assets/images/background.jpg",
          isFavorite: true),
    );

    return Future.sync(() => properties);
  }

  @override
  Future<List<Property>> readAll() {
    List<Property> properties = List.empty(growable: true);
    properties.add(
      Property(
          id: 1,
          type: "buy",
          rooms: 1,
          mt2: 400,
          bathrooms: 3,
          levels: 2,
          location: "Insurgentes Sur",
          propertyName: "Alamo",
          price: 2000001,
          imageUrl:
              "https://images1.forrent.com/i2/YznUbu6Uswkod01DqFTaN_Ciz0GH4UFeuzZErcl544E/117/image.jpg",
          isFavorite: true),
    );
    properties.add(
      Property(
          id: 1,
          type: "rent",
          rooms: 2,
          bathrooms: 1,
          levels: 1,
          mt2: 84,
          propertyName: "Av 16 de Septiembre",
          location: "Bonfil",
          price: 8003,
          imageUrl:
              "https://cf.bstatic.com/xdata/images/hotel/max1024x768/330993383.jpg?k=931a8b3286d533d1bb984218304d85029f464ab79e0bb25083e25d6fe1d8b340&o=&hp=1",
          isFavorite: false),
    );

    return Future.sync(() => properties);
  }
}
