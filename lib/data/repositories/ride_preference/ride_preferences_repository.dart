import '../../../model/ride_pref/ride_pref.dart';

abstract class RidePreferenceRepository {
  List<RidePreference> getAllRidePreferences();
  
  void addRidePreference(RidePreference ridepref);
}