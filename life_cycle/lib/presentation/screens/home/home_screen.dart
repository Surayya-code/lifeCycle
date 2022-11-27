import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../../../data/user_data.dart';
import '../../constants/text_Styles.dart';
import '../../widgets/container.dart';
import '../../widgets/genders.dart';
import 'result_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({
    super.key,
  });

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  String selectedGender="WOMAN";
  double cigarettes = 15.0;
  double gymDay = 1;
  int heightSize = 170;
  int weight = 60;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'LIFE CYCLE',
          style: TextStyle(color: Colors.white),
        ),
        centerTitle: true,
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(
            child: Row(
              children: [
                Expanded(
                  child: MyContainer(
                    child: outlinedButtonRow('HEIGHT',),
                  ),
                ),
                 Expanded(
                  child: MyContainer(
                     child: outlinedButtonRow('WEIGHT',),
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: MyContainer(
              child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "How many times a week do you exercise?",
                      textAlign: TextAlign.center,
                      style: kTextStyle,
                    ),
                    Text(
                      '${gymDay.round()}',
                      style: kNumStyle,
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
                    Text(
                      "How many cigarettes do you smoke a day?",
                      textAlign: TextAlign.center,
                      style: kTextStyle,
                    ),
                    Text(
                      '${cigarettes.round()}',
                      style: kNumStyle,
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
          ButtonTheme(
            height: 50,
            child: TextButton(
              style:  TextButton.styleFrom(backgroundColor: Colors.white),
            onPressed: (){
              Navigator.push(context, 
              MaterialPageRoute(builder:(context)=>
                ResultScreen(
                 userData: UserData(
                 cigarettes: cigarettes,
                 gymDay: gymDay, 
                 heightSize: hashCode,
                 weight: weight, selectedGender:selectedGender,),
               ),
                ),
                 );

            }, 
            child: Text("CALCULATE",
            style: kTextStyle,)),
          )
        ],
      ),
    );
  }

  Row outlinedButtonRow(String label) {
    
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        RotatedBox(
            quarterTurns: -1,
            child: Text(
             label,
              style: kTextStyle,
            )),
        const SizedBox(
          width: 10,
        ),
        RotatedBox(
            quarterTurns: -1,
            child: Text(
              label=='HEIGHT'? heightSize.toString() : weight.toString(),
              style: kNumStyle)),
        const SizedBox(
          width: 10,
        ),
        Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ButtonTheme(
              minWidth: 36,
              child: OutlinedButton(
                style: OutlinedButton.styleFrom(foregroundColor: Colors.teal),
                onPressed: () {
                  setState(() {
                    label=='HEIGHT'? heightSize++ : weight++;
                  });
                  print("ust button kliklendi");
                },
                child: const Icon(
                  FontAwesomeIcons.plus,
                  size: 20,
                ),
              ),
            ),
            ButtonTheme(
              minWidth: 36,
              child: OutlinedButton(
                style: OutlinedButton.styleFrom(foregroundColor: Colors.teal,),
                onPressed: () {
                  setState(() {
                     label=='HEIGHT'? heightSize-- : weight--;
                  });
                  print("alt button kliklendi");
                },
                child: const Icon(
                  FontAwesomeIcons.minus,
                  size: 20,
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
