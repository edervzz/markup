import 'package:mercury/domain/repository/property_repository.dart';

abstract class Repository {
  PropertyRepository property;

  Repository(this.property);
}
