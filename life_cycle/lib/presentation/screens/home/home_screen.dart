import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../../widgets/container.dart';
import '../../widgets/genders.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({
    super.key,
  });

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  String? selectedGender;
  double cigarettes = 15.0;
  double gymDay = 1;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.teal.shade300,
      appBar: AppBar(
        title: const Text(
          'LIFE CYCLE',
          style: TextStyle(color: Colors.black54),
        ),
        centerTitle: true,
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(
            child: Row(
              children: const [
                Expanded(
                  child: MyContainer(),
                ),
                Expanded(
                  child: MyContainer(),
                ),
              ],
            ),
          ),
          Expanded(
            child: MyContainer(
              child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text(
                      "How many times a week do you exercise?",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      '${gymDay.round()}',
                      style: const TextStyle(
                        color: Colors.teal,
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Slider.adaptive(
                      value: gymDay,
                      divisions: 7,
                      onChanged: (double newValue) {
                        setState(() {
                          gymDay = newValue;
                        });
                      },
                      min: 0,
                      max: 7,
                    ),
                  ]),
            ),
          ),
          Expanded(
            child: MyContainer(
              child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text(
                      "How many cigarettes do you smoke a day?",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      '${cigarettes.round()}',
                      style: const TextStyle(
                        color: Colors.teal,
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Slider.adaptive(
                      value: cigarettes,
                      onChanged: (double newValue) {
                        setState(() {
                          cigarettes = newValue;
                        });
                      },
                      min: 0,
                      max: 30,
                    ),
                  ]),
            ),
          ),
          Expanded(
            child: Row(
              children: [
                Expanded(
                  child: MyContainer(
                    onPress: () {
                      setState(() {
                        selectedGender = "Woman";
                      });
                      print("woman");
                    },
                    color: selectedGender == "Woman"
                        ? Colors.blueGrey.shade400
                        : Colors.white,
                    child: const Genders(
                      genderIcon: FontAwesomeIcons.venus,
                      genderText: 'Woman',
                    ),
                  ),
                ),
                Expanded(
                  child: MyContainer(
                    onPress: () {
                      setState(() {
                        selectedGender = "Man";
                      });
                    },
                    color: selectedGender == "Man"
                        ? Colors.blueGrey.shade400
                        : Colors.white,
                    child: const Genders(
                        genderText: "Man", genderIcon: FontAwesomeIcons.mars),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
