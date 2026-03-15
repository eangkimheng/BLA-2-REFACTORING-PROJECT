import '../../../model/ride_pref/ride_pref.dart';
import 'ride_preferences_repository.dart';

class RidePreferencesRepositoryMock extends RidePreferenceRepository {

  final List<RidePreference> _history = [];

  @override
  List<RidePreference> getAllRidePreferences() {
    return _history;
  }

  @override
  void addRidePreference(RidePreference pref) {
    _history.add(pref);
  }

}