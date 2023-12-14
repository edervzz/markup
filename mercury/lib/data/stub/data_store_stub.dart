import 'package:mercury/data/stub/property_adapter_stub.dart';
import 'package:mercury/domain/repository/property_repository.dart';
import 'package:mercury/domain/repository/repository.dart';

class DataStoreStub implements Repository {
  @override
  PropertyRepository property;

  DataStoreStub() : property = PropertyAdapterStub();
}
