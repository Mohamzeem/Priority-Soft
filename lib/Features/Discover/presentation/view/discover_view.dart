// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:priority_soft/Features/Discover/presentation/view/widgets/discover_body.dart';
import 'package:priority_soft/Features/Discover/presentation/view/widgets/filter_button.dart';

class DivsoverView extends StatelessWidget {
  const DivsoverView({Key? key}) : super(key: key);

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
