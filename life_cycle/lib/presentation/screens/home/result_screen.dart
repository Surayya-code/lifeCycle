import 'package:flutter/material.dart';
import 'package:life_cycle/presentation/constants/text_styles.dart';

import '../../../data/user_data.dart';
import '../../../data/calculate.dart';

class ResultScreen extends StatelessWidget {
  final UserData userData;

  const ResultScreen( {super.key, required this.userData,});
  

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Result Page"),
      ),
      body: Column(crossAxisAlignment: CrossAxisAlignment.stretch, children: [
        Expanded(
          flex: 8,
          child: Center(
              child: Text(
            Calculate(userData: userData).calc().round().toString(),
            style: kTextStyle,
          )),
        ),
        Expanded(
          flex: 1,
          child: TextButton(
              style: TextButton.styleFrom(backgroundColor: Colors.white),
              onPressed: () {
                Navigator.pop(context);
              },
              child: Text(
                "Go Back",
                style: kTextStyle,
              )),
        )
      ]),
    );
  }
}