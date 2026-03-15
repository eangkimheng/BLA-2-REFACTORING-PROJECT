import '../../../data/dummy_data.dart';
import '../../../model/ride/locations.dart';
import 'locations_repository.dart';

class LocationsRepositoryMock implements LocationsRepository {

  @override
  List<Location> getavailableLocations() {
    return fakeLocations;
  }

}