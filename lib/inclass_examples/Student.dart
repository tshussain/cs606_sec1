//
//
//
// import 'package:flutter/cupertino.dart';
//
// class Student {
//   @protected
//   int studentId;
//   Map<int,double> _grades; // Map of course number to grade
//
//   @protected
//   double rScore;
//
//   Student();
//
//   int get studentId => studentId;
//
//   addGrade(int classNum, double grade) {
//     Map<int, double> newEntry = {classNum : grade};
//     _grades.addAll(newEntry);
//   }
//
//   getGrade(int courseNum) {
//     return _grades[courseNum];
//   }
//
//   double get rScore => rScore;
//
//   set rScore(double value) {
//     rScore = value;
//   }
// }
//
//
//
// class SummerStudent extends Student {
//   Plan remedialPlan;
//
//   print() {
//     print("rscore" + rScore.toString());
//   }
//
// }