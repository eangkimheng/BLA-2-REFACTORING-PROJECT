import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../data/repositories/ride/rides_repository.dart';
import '../../states/ride_preferences_state.dart';
import 'view_model/ride_selection_model.dart';
import 'widgets/ride_selection_content.dart';

class RidesSelectionScreen extends StatelessWidget {
  const RidesSelectionScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => RideSelectionViewModel(
        ridePreferenceState: context.read<RidePreferenceState>(),
        ridesRepository: context.read<RidesRepository>(),
      ),
      child: const RideSelectionContent(),
    );
  }
}