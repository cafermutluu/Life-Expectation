import 'package:yasam_beklentisi/constants/user_data.dart';
import 'dart:math';

class Calculation {
  final UserData userData;

  Calculation(this.userData);


  List calculate() {

    double result;
    double totalLostofYears;
    double bmi;
    double currentHeightasCM;
    double totalYearsSmoking;
    double totalSmokedCigarettesForYear;
    double totalSmokedCigarettes;


    currentHeightasCM = userData.currentHeight / 100;
    bmi = userData.currentWeight / pow(2, currentHeightasCM);
    bmi <= 18.0
        ? result = bmi * 3
        : bmi >= 24.0
            ? result = bmi * 2
            : result = bmi * 3.5;

    totalSmokedCigarettesForYear = userData.smokedWeed * 365;
    totalYearsSmoking = userData.currentAge - userData.startedSmokingAge;
    totalSmokedCigarettes = totalSmokedCigarettesForYear * totalYearsSmoking;

    totalLostofYears = totalSmokedCigarettes / 47781;
    result = result - totalLostofYears;

    userData.currentGender == "Female" ? result = result + 3 : result = result;

    return [
      result, totalLostofYears
    ];
  }

  /*calculationOfLostYears(){
    double totalLostofYears;
    double totalYearsSmoking;
    double totalSmokedCigarettesForYear;
    double totalSmokedCigarettes;

    totalSmokedCigarettesForYear = userData.smokedWeed * 365;
    totalYearsSmoking = userData.currentAge - userData.startedSmokingAge;
    totalSmokedCigarettes = totalSmokedCigarettesForYear * totalYearsSmoking;

    totalLostofYears = totalSmokedCigarettes / 47781;

    return totalLostofYears;
  }*/
}
