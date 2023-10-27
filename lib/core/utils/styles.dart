import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

abstract class StylesManager {
  static const titleMedium = TextStyle(
    fontSize: 18,
    fontWeight: FontWeight.w900,
  );
  static final titleMediumWithCustomColor = TextStyle(
    fontSize: 23,
    color: Colors.amber[200],
    fontWeight: FontWeight.w600,
  );
  static const textStyle18 = TextStyle(
    fontSize: 18,
    fontWeight: FontWeight.w600,
  );
  static const textStyle20 = TextStyle(
    fontSize: 20,
    fontWeight: FontWeight.w600,
  );
  static final textStyle30 = TextStyle(
    fontSize: 30,
    fontWeight: FontWeight.w900,
    fontFamily: GoogleFonts.aclonica.toString(),
    letterSpacing: 1.2,
  );
  static const textStyle14 = TextStyle(
    fontSize: 14,
    fontWeight: FontWeight.normal,
  );

  static const textStyle16 = TextStyle(
    fontSize: 16,
    fontWeight: FontWeight.w500,
  );
}

