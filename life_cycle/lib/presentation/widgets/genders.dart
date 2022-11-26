import 'package:flutter/material.dart';
import 'package:life_cycle/presentation/constants/text_Styles.dart';

class Genders extends StatelessWidget {
  final String genderText;
  final IconData genderIcon;
  const Genders({
    Key? key,
    required this.genderText,
    required this.genderIcon,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(
          genderIcon,
          size: 50,
          color: Colors.black54,
        ),
        const SizedBox(
          height: 10,
        ),
        Text(
          genderText,
          style:kTextStyle,
        ),
      ],
    );
  }
}
