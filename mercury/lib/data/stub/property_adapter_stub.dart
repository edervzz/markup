import 'package:mercury/data/shared_pref_keys.dart';
import 'package:mercury/domain/entities/_entities.dart';
import 'package:mercury/domain/repository/property_repository.dart';
import 'package:shared_preferences/shared_preferences.dart';

class PropertyAdapterStub implements PropertyRepository {
  final List<Property> store;

  PropertyAdapterStub()
      : store = <Property>[
          Property(
              id: 1,
              kind: PropKind.project,
              priceFor: PriceFor.forBuy,
              rooms: 3,
              mt2: 400,
              bathrooms: 3,
              levels: 2,
              location: "Insurgentes Sur",
              propertyName: "Alamo",
              price: 2000001,
              imageUrl:
                  "https://cf.bstatic.com/xdata/images/hotel/max1024x768/330993383.jpg?k=931a8b3286d533d1bb984218304d85029f464ab79e0bb25083e25d6fe1d8b340&o=&hp=1",
              isFavorite: false),
          Property(
              id: 2,
              kind: PropKind.preOwned,
              priceFor: PriceFor.forRent,
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
          Property(
              id: 3,
              kind: PropKind.office,
              priceFor: PriceFor.forRent,
              rooms: 2,
              bathrooms: 1,
              levels: 1,
              mt2: 70,
              propertyName: "Reforma 222",
              location: "Roma Norte",
              price: 7004,
              imageUrl:
                  "https://cf.bstatic.com/xdata/images/hotel/max1024x768/330993383.jpg?k=931a8b3286d533d1bb984218304d85029f464ab79e0bb25083e25d6fe1d8b340&o=&hp=1",
              isFavorite: false),
          Property(
              id: 4,
              kind: PropKind.estate,
              priceFor: PriceFor.forBuy,
              rooms: 2,
              bathrooms: 1,
              levels: 1,
              mt2: 70,
              propertyName: "Tabasco 34",
              location: "Roma Sur",
              price: 7004,
              imageUrl:
                  "https://cf.bstatic.com/xdata/images/hotel/max1024x768/330993383.jpg?k=931a8b3286d533d1bb984218304d85029f464ab79e0bb25083e25d6fe1d8b340&o=&hp=1",
              isFavorite: false)
        ];

  @override
  Future<List<Property>?> read(String key) async {
    return null;
  }

  @override
  Future<List<Property>?> readAll() {
    return Future.sync(() => store);
  }

  @override
  Future<List<Property>?> readFavorites() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    final favs = prefs.getStringList(favoriteProperties);
    if (favs == null || favs.isEmpty == true) {
      return null;
    }
    var favoriteProps =
        store.where((element) => favs.contains(element.id.toString())).toList();

    return favoriteProps;
  }
}
