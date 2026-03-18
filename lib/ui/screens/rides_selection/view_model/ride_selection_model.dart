import 'package:flutter/material.dart';

import '../../../states/ride_preferences_state.dart';
import '../../../../data/repositories/ride/rides_repository.dart';
import '../../../../model/ride/ride.dart';
import '../../../../model/ride_pref/ride_pref.dart';

class RideSelectionViewModel extends ChangeNotifier {
  final RidePreferenceState ridePreferenceState;
  final RidesRepository ridesRepository;

  RideSelectionViewModel({
    required this.ridePreferenceState,
    required this.ridesRepository,
  }) {
    ridePreferenceState.addListener(_onStateChanged);
  }

  RidePreference get selectedPreference =>
      ridePreferenceState.selectedPreference!;

  List<Ride> get rides =>
      ridesRepository.getRidesFor(selectedPreference);

  void updatePreference(RidePreference pref) {
    ridePreferenceState.choosePreference(pref);
  }

  void _onStateChanged() {
    notifyListeners();
  }

  @override
  void dispose() {
    ridePreferenceState.removeListener(_onStateChanged);
    super.dispose();
  }
}