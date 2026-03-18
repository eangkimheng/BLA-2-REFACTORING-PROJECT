import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../../model/ride/ride.dart';
import '../../../../model/ride_pref/ride_pref.dart';
import '../../../theme/theme.dart';
import '../view_model/ride_selection_model.dart';
import 'package:blabla/ui/screens/rides_selection/widgets/ride_preference_modal.dart';
import '../widgets/rides_selection_header.dart';
import 'rides_selection_tile.dart';

class RideSelectionContent extends StatelessWidget {
  const RideSelectionContent({super.key});

  void _onPreferencePressed(
      BuildContext context, RideSelectionViewModel vm) async {
    RidePreference? newPref = await Navigator.of(context).push(
      MaterialPageRoute(
        builder: (_) => RidePreferenceModal(
          initialPreference: vm.selectedPreference,
        ),
      ),
    );

    if (newPref != null) {
      vm.updatePreference(newPref);
    }
  }

  @override
  Widget build(BuildContext context) {
    final vm = context.watch<RideSelectionViewModel>();

    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(BlaSpacings.m),
        child: Column(
          children: [
            RideSelectionHeader(
              ridePreference: vm.selectedPreference,
              onBackPressed: () => Navigator.pop(context),
              onFilterPressed: () {}, 
              onPreferencePressed: () =>
                  _onPreferencePressed(context, vm),
            ),

            const SizedBox(height: 20),

            Expanded(
              child: vm.rides.isEmpty
                  ? const Center(child: Text("No rides found"))
                  : ListView.builder(
                      itemCount: vm.rides.length,
                      itemBuilder: (context, index) {
                        Ride ride = vm.rides[index];

                        return RideSelectionTile(
                          ride: ride,
                          onPressed: () {
                            // later
                          },
                        );
                      },
                    ),
            ),
          ],
        ),
      ),
    );
  }
}