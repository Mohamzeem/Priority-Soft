import 'package:flutter/material.dart';
import 'package:priority_soft/Core/Widgets/custom_text.dart';

class ProductDetailsView extends StatelessWidget {
  const ProductDetailsView({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: SafeArea(
          child: Column(
        children: [
          CustomText(text: 'ProductDetailsView'),
        ],
      )),
    );
  }
}
