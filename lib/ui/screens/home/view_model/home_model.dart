import 'package:flutter/material.dart';
import '../../../states/ride_preferences_state.dart';
import '../../../../model/ride_pref/ride_pref.dart';

class HomeViewModel extends ChangeNotifier {
  final RidePreferenceState ridePreferenceState;

  HomeViewModel({required this.ridePreferenceState}) {
    ridePreferenceState.addListener(_onStateChanged);
    ridePreferenceState.loadHistory();
  }

  RidePreference? get selectedPreference =>
      ridePreferenceState.selectedPreference;

  List<RidePreference> get history =>
      ridePreferenceState.history;

  void selectPreference(RidePreference pref) {
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