import 'package:nested/nested.dart';
import 'package:provider/provider.dart';

import 'main_common.dart';
import 'data/repositories/location/locations_repository.dart';
import 'data/repositories/location/locations_repository_mock.dart';
import 'data/repositories/ride_preference/ride_preferences_repository.dart';
import 'data/repositories/ride_preference/ride_preferences_repository_mock.dart';
import 'data/repositories/ride/rides_repository.dart';
import 'data/repositories/ride/rides_repository_mock.dart';

List<SingleChildWidget> get devProviders => [

  Provider<LocationsRepository>(
    create: (context) => LocationsRepositoryMock(),
  ),

  Provider<RidePreferenceRepository>(
    create: (context) => RidePreferencesRepositoryMock(),
  ),

  Provider<RidesRepository>(
    create: (context) => RidesRepositoryMock(),
  ),

];

void main() {
  mainCommon(devProviders);
}
