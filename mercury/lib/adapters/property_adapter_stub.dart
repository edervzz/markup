// import 'package:mercury/entities/property.dart';
// import 'package:mercury/ports/_ports.dart';

// class PropertyAdapterStub implements PropertyPort {
//   @override
//   Future<List<Property>> read(String key) {
//     List<Property> properties = List.empty(growable: true);
//     properties.add(
//       Property(
//           id: 1,
//           type: "buy",
//           rooms: 1,
//           bathrooms: 3,
//           levels: 2,
//           mt2: 400,
//           propertyName: "Alamo",
//           location: "Insurgentes Sur",
//           price: 2000001,
//           imageUrl: "",
//           isFavorite: true),
//     );

//     return Future.sync(() => properties);
//   }

//   @override
//   Future<List<Property>> readAll() {
//     List<Property> properties = List.empty(growable: true);
//     properties.add(
//       Property(
//           id: 1,
//           type: "buy",
//           rooms: 1,
//           mt2: 400,
//           bathrooms: 3,
//           levels: 2,
//           location: "Insurgentes Sur",
//           propertyName: "Alamo",
//           price: 2000001,
//           imageUrl: "",
//           isFavorite: true),
//     );
//     properties.add(
//       Property(
//           id: 1,
//           type: "rent",
//           rooms: 2,
//           bathrooms: 1,
//           levels: 1,
//           mt2: 84,
//           propertyName: "Av 16 de Septiembre",
//           location: "Bonfil",
//           price: 8003,
//           imageUrl: "",
//           isFavorite: false),
//     );

//     return Future.sync(() => properties);
//   }
// }
