import '../../../data/dummy_data.dart';
import '../../../model/ride/ride.dart';
import '../../../model/ride_pref/ride_pref.dart';
import 'rides_repository.dart';

class RidesRepositoryMock implements RidesRepository {

  @override
  List<Ride> getRidesFor(RidePreference ridePre) {

    return fakeRides.where((ride) =>
      ride.departureLocation == ridePre.departure &&
      ride.arrivalLocation == ridePre.arrival &&
      ride.availableSeats >= ridePre.requestedSeats
    ).toList();

  }

}