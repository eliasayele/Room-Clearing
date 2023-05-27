import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:room_clearing/utils/constants.dart';

TextStyle get ktsTitleText => GoogleFonts.openSans(
  fontSize: 26,
  height: 1.4,
  fontWeight: FontWeight.w800,
);

TextStyle get ktsBodyRegular => GoogleFonts.openSans(
  fontSize: 16,
  color: kBlack,
  fontWeight: FontWeight.w400,
);

TextStyle get ktsBodyLarge => GoogleFonts.openSans(
  fontSize: 20,
);

TextStyle get ktsBodyExtraLarge => GoogleFonts.openSans(
  fontSize: 22,
  color: kBlack,
  fontWeight: FontWeight.w600,
);