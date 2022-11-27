import 'package:life_cycle/data/user_data.dart';

class Calculate {
  UserData userData;
  Calculate({required this.userData});

  double calc() {
    double result;
    result = 90 + userData.gymDay - userData.cigarettes;
    result = result + (userData.heightSize / userData.weight);
    if (userData.selectedGender == "WOMAN") {
      return result + 3;
    } else {
      return result;
    }
  }
}
