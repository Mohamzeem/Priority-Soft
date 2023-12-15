import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:priority_soft/Core/Widgets/custom_appbar.dart';
import 'package:priority_soft/Core/Widgets/custom_text.dart';

class OrderView extends StatelessWidget {
  const OrderView({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      appBar: CustomAppBar(
        suffix: SizedBox.shrink(),
        title: 'Order Summary',
      ),
      body: SafeArea(child: OrderBody()),
    );
  }
}

class OrderBody extends StatelessWidget {
  const OrderBody({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CustomText(
          text: 'Information',
          fontSize: 18,
          fontWeight: FontWeight.w700,
        )
      ],
    );
  }
}
