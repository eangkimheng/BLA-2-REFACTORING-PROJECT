import 'package:flutter/material.dart';
import 'package:blabla/model/ride_pref/ride_pref.dart';
import 'package:blabla/ui/screens/home/view_model/home_model.dart';
import 'package:blabla/ui/screens/home/widgets/home_history_tile.dart';
import 'package:blabla/ui/screens/rides_selection/rides_selection_screen.dart';
import 'package:blabla/ui/screens/rides_selection/widgets/ride_preference_modal.dart';
import 'package:blabla/ui/theme/theme.dart';
import 'package:blabla/utils/animations_util.dart';

class HomeContent extends StatelessWidget {
  final HomeViewModel homeViewModel;

  const HomeContent({super.key, required this.homeViewModel});

  /// Handles ride preference selection and navigates safely
  void _onRidePrefSelected(
      BuildContext context, RidePreference selectedPreference) async {
    // Update the current preference in the view model
    homeViewModel.selectPreference(selectedPreference);

    // Navigate to rides selection screen using a custom animation
    await Navigator.of(context)
        .push(AnimationUtils.createBottomToTopRoute(const RidesSelectionScreen()));
  }

  @override
  Widget build(BuildContext context) {
    final history = homeViewModel.history;

    return Scaffold(
      body: Stack(
        children: [
          _buildBackground(),
          _buildForeground(context, history),
        ],
      ),
    );
  }

  Widget _buildBackground() {
    return SizedBox(
      width: double.infinity,
      height: 300,
      child: Image.asset(
        'assets/images/blabla_home.png',
        fit: BoxFit.cover,
      ),
    );
  }

  Widget _buildForeground(BuildContext context, List<RidePreference> history) {
    return Padding(
      padding: const EdgeInsets.all(BlaSpacings.m),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(height: 40),
          Text(
            "Where do you go?",
            style: BlaTextStyles.heading.copyWith(color: Colors.white),
          ),
          const SizedBox(height: 20),

          // Search Ride Button
          ElevatedButton(
            onPressed: () async {
              final pref = await Navigator.of(context).push<RidePreference>(
                MaterialPageRoute(
                  builder: (_) => RidePreferenceModal(
                      initialPreference: homeViewModel.selectedPreference),
                ),
              );

              if (pref != null) {
                _onRidePrefSelected(context, pref);
              }
            },
            child: const Text("Search Ride"),
          ),

          const SizedBox(height: 20),
          Text("History", style: BlaTextStyles.title),

          // History List
          Expanded(
            child: ListView.builder(
              itemCount: history.length,
              itemBuilder: (ctx, index) {
                final pref = history[index];
                return HomeHistoryTile(
                  ridePref: pref,
                  onPressed: () => _onRidePrefSelected(context, pref),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}