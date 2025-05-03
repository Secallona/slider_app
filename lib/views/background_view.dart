import 'package:flutter/material.dart';
import 'package:slider_app/views/marks_view.dart';
import 'package:slider_app/views/number_view.dart';
import 'package:slider_app/views/rounded_view.dart';
import 'package:provider/provider.dart';
import 'package:slider_app/viewmodel/viewmodel.dart';


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
              TextButton(onPressed:(){appState.restartGame();}, child: RoundedView(icon: Icons.refresh)),
              Spacer(),
              TextButton(onPressed:(){
                Navigator.push(context, MaterialPageRoute(builder: (context) => const MarksView()));
              }, child: RoundedView(icon: Icons.info)),
            ],
          ),
          Spacer(),
          Row(
            children: [
              NumberView(text: "SCORE", value: appState.score),
              Spacer(),
              NumberView(text: "ROUNDS", value: appState.rounds),
            ],
          ),
        ],
      ),
    );
  }
}
