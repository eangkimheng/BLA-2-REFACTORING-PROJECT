import 'package:flutter/material.dart';
import '../../model/ride_pref/ride_pref.dart';
import '../../data/repositories/ride_preference/ride_preferences_repository.dart';

class RidePreferenceState extends ChangeNotifier {

  final RidePreferenceRepository ridePreferenceRepository;

  RidePreference? _selectedPreference;
  final int _seatLimit = 8;

  List<RidePreference> _preferenceHistory = [];

  RidePreferenceState({required this.ridePreferenceRepository});

  int get maxSeats => _seatLimit;

  RidePreference? get selectedPreference => _selectedPreference;

  List<RidePreference> get history => _preferenceHistory;

  void loadHistory() {
    _preferenceHistory = ridePreferenceRepository.getAllRidePreferences();
    notifyListeners();
  }

  void choosePreference(RidePreference preference) {

    if (_selectedPreference != preference) {
      _selectedPreference = preference;
      ridePreferenceRepository.addRidePreference(preference);
    }

    notifyListeners();
  }
}