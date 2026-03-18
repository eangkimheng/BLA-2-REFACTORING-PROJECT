import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'widgets/home_content.dart';
import 'view_model/home_model.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // Get the view model from Provider
    final homeViewModel = context.watch<HomeViewModel>();

    return HomeContent(homeViewModel: homeViewModel);
  }
}