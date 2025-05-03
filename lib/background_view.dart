import 'package:flutter/material.dart';
import 'package:slider_app/number_view.dart';
import 'package:slider_app/rounded_view.dart';
import 'package:provider/provider.dart';
import 'package:slider_app/viewmodel.dart';


class BackgroundView extends StatelessWidget {
  const BackgroundView({super.key});

  @override
  Widget build(BuildContext context) {
    var appState = context.watch<Viewmodel>();
    return Padding(
      padding: const EdgeInsets.all(15.0),
      child: Column(
        children: [
          Row(
            children: [
              RoundedView(icon: Icons.refresh),
              Spacer(),
              RoundedView(icon: Icons.list),
            ],
          ),
          Spacer(),
          Row(
            children: [
              NumberView(text: "SCORE", value: 0),
              Spacer(),
              NumberView(text: "TARGET", value: 0),
            ],
          ),
        ],
      ),
    );
  }
}
