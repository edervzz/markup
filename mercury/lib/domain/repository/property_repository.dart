import 'package:mercury/shared/_shared.dart';
import 'package:mercury/domain/entities/_entities.dart';

abstract class PropertyRepository implements ReadRepository<Property, String> {
  Future<List<Property>?> readFavorites();
}
