import 'package:flutter/material.dart';
import 'package:priority_soft/Features/Discover/presentation/view/widgets/discover_body.dart';
import 'package:priority_soft/Features/Discover/presentation/view/widgets/filter_button.dart';

class DivsoverView extends StatelessWidget {
  const DivsoverView({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      //^ filter button
      floatingActionButton: FilterButton(),
      //^ screen body
      body: DiscoverBody(),
    );
  }
}
