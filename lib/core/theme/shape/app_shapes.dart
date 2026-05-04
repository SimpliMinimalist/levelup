import 'package:flutter/material.dart';

class AppShapes {
  AppShapes._();

  static const double r4 = 4.0;
  static const double r8 = 8.0;
  static const double r12 = 12.0;
  static const double r16 = 16.0;
  static const double r24 = 24.0;
  static const double rCircle = 999.0;
  static const RoundedRectangleBorder small = RoundedRectangleBorder(
    borderRadius: BorderRadius.all(Radius.circular(r8)),
  );

  static const RoundedRectangleBorder medium = RoundedRectangleBorder(
    borderRadius: BorderRadius.all(Radius.circular(r12)),
  );

  static const RoundedRectangleBorder large = RoundedRectangleBorder(
    borderRadius: BorderRadius.all(Radius.circular(r24)),
  );
  
  static const RoundedRectangleBorder button = RoundedRectangleBorder(
    borderRadius: BorderRadius.all(Radius.circular(r12)),
  );
}