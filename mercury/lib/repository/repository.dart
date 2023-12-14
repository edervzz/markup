import 'package:mercury/repository/property_repository.dart';

abstract class Repository {
  PropertyRepository property;

  Repository(this.property);
}
