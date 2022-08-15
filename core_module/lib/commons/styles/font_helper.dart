import 'package:flutter/material.dart';

import '../commons.dart';

class FontHelper {
  static const bolder = FontWeight.w900;
  static const bold = FontWeight.w700;
  static const regular = FontWeight.w400;
  static const light = FontWeight.w300;
  static const lighter = FontWeight.w100;

  static h1Bolder({
    color,
    double letterSpacing = 0.0,
  }) =>
      TextStyle(
        fontSize: 96,
        fontWeight: bolder,
        letterSpacing: letterSpacing,
        color: color ?? Palette.black,
      );

  static h1Bold({
    color,
    double letterSpacing = 0.0,
  }) =>
      TextStyle(
        fontSize: 96,
        fontWeight: bold,
        letterSpacing: letterSpacing,
        color: color ?? Palette.black,
      );

  static h1Regular({
    color,
    double letterSpacing = 0.0,
  }) =>
      TextStyle(
        fontSize: 96,
        fontWeight: regular,
        letterSpacing: letterSpacing,
        color: color ?? Palette.black,
      );

  static h1Thin({
    color,
    double letterSpacing = 0.0,
  }) =>
      TextStyle(
        fontSize: 96,
        fontWeight: light,
        letterSpacing: letterSpacing,
        color: color ?? Palette.black,
      );

  static h2Bolder({
    color,
    double letterSpacing = -1,
  }) =>
      TextStyle(
        fontSize: 64,
        fontWeight: bolder,
        letterSpacing: letterSpacing,
        color: color ?? Palette.black,
      );

  static h2Bold({
    color,
    double letterSpacing = -1,
  }) =>
      TextStyle(
        fontSize: 64,
        fontWeight: bold,
        letterSpacing: letterSpacing,
        color: color ?? Palette.black,
      );

  static h2Regular({
    color,
    double letterSpacing = -1,
  }) =>
      TextStyle(
        fontSize: 64,
        fontWeight: regular,
        letterSpacing: letterSpacing,
        color: color ?? Palette.black,
      );

  static h2Thin({
    color,
    double letterSpacing = -1,
  }) =>
      TextStyle(
        fontSize: 64,
        fontWeight: light,
        letterSpacing: letterSpacing,
        color: color ?? Palette.black,
      );

  static h3Bolder({
    color,
    double letterSpacing = -1,
  }) =>
      TextStyle(
        fontSize: 48,
        fontWeight: bolder,
        letterSpacing: letterSpacing,
        color: color ?? Palette.black,
      );

  static h3Bold({
    color,
    double letterSpacing = -1,
  }) =>
      TextStyle(
        fontSize: 48,
        fontWeight: bold,
        letterSpacing: letterSpacing,
        color: color ?? Palette.black,
      );

  static h3Regular({
    color,
    double letterSpacing = -1,
  }) =>
      TextStyle(
        fontSize: 48,
        fontWeight: regular,
        letterSpacing: letterSpacing,
        color: color ?? Palette.black,
      );

  static h3Thin({
    color,
    double letterSpacing = -1,
  }) =>
      TextStyle(
        fontSize: 48,
        fontWeight: light,
        letterSpacing: letterSpacing,
        color: color ?? Palette.black,
      );

  static h4Bolder({
    color,
    double letterSpacing = -0.5,
  }) =>
      TextStyle(
        fontSize: 32,
        fontWeight: bolder,
        letterSpacing: letterSpacing,
        color: color ?? Palette.black,
      );

  static h4Bold({
    color,
    double letterSpacing = -0.5,
  }) =>
      TextStyle(
        fontSize: 32,
        fontWeight: bold,
        letterSpacing: letterSpacing,
        color: color ?? Palette.black,
      );

  static h4Regular({
    color,
    double letterSpacing = -0.5,
  }) =>
      TextStyle(
        fontSize: 32,
        fontWeight: regular,
        letterSpacing: letterSpacing,
        color: color ?? Palette.black,
      );

  static h4Thin({
    color,
    double letterSpacing = -0.5,
  }) =>
      TextStyle(
        fontSize: 32,
        fontWeight: light,
        letterSpacing: letterSpacing,
        color: color ?? Palette.black,
      );

  static h5Bolder({
    color,
    double letterSpacing = -0.25,
  }) =>
      TextStyle(
        fontSize: 24,
        fontWeight: bolder,
        letterSpacing: letterSpacing,
        color: color ?? Palette.black,
      );

  static h5Bold({
    color,
    double letterSpacing = -0.25,
  }) =>
      TextStyle(
        fontSize: 24,
        fontWeight: bold,
        letterSpacing: letterSpacing,
        color: color ?? Palette.black,
      );

  static h5Regular({
    color,
    double letterSpacing = 0.25,
  }) =>
      TextStyle(
        fontSize: 24,
        fontWeight: regular,
        letterSpacing: letterSpacing,
        color: color ?? Palette.black,
      );

  static h5Thin({
    color,
    double letterSpacing = -0.25,
  }) =>
      TextStyle(
        fontSize: 24,
        fontWeight: light,
        letterSpacing: letterSpacing,
        color: color ?? Palette.black,
      );

  static h6Bolder({
    color,
    double letterSpacing = 0.0,
  }) =>
      TextStyle(
        fontSize: 16,
        fontWeight: bolder,
        letterSpacing: letterSpacing,
        color: color ?? Palette.black,
      );

  static h6Bold({
    color,
    double letterSpacing = 0.0,
  }) =>
      TextStyle(
        fontSize: 16,
        fontWeight: bold,
        letterSpacing: letterSpacing,
        color: color ?? Palette.black,
      );

  static h6Regular({
    color,
    double letterSpacing = -0.0,
  }) =>
      TextStyle(
        fontSize: 16,
        fontWeight: regular,
        letterSpacing: letterSpacing,
        color: color ?? Palette.black,
      );

  static h6Thin({
    color,
    double letterSpacing = 0.0,
  }) =>
      TextStyle(
        fontSize: 16,
        fontWeight: bolder,
        letterSpacing: letterSpacing,
        color: color ?? Palette.black,
      );

  static h7Bold({
    color,
    double letterSpacing = 0.2,
  }) =>
      TextStyle(
        fontSize: 14,
        fontWeight: bold,
        letterSpacing: letterSpacing,
        color: color ?? Palette.black,
      );

  static h7Regular({
    color,
    double letterSpacing = 0.25,
  }) =>
      TextStyle(
        fontSize: 14,
        fontWeight: regular,
        letterSpacing: letterSpacing,
        color: color ?? Palette.black,
      );

  static h7Thin({
    color,
    double letterSpacing = 0.2,
  }) =>
      TextStyle(
        fontSize: 14,
        fontWeight: light,
        letterSpacing: letterSpacing,
        color: color ?? Palette.black,
      );

  static h8Bolder({
    color,
    double letterSpacing = 0.3,
  }) =>
      TextStyle(
        fontSize: 12,
        fontWeight: bolder,
        letterSpacing: letterSpacing,
        color: color ?? Palette.black,
      );

  static h8Bold({
    color,
    double letterSpacing = 0.3,
  }) =>
      TextStyle(
        fontSize: 12,
        fontWeight: bold,
        letterSpacing: letterSpacing,
        color: color ?? Palette.black,
      );

  static h8Regular({
    color,
    double letterSpacing = 0.3,
  }) =>
      TextStyle(
        fontSize: 12,
        fontWeight: regular,
        letterSpacing: letterSpacing,
        color: color ?? Palette.black,
      );

  static h8Thin({
    color,
    double letterSpacing = 0.3,
  }) =>
      TextStyle(
        fontSize: 12,
        fontWeight: light,
        letterSpacing: letterSpacing,
        color: color ?? Palette.black,
      );

  static h9Bolder({
    color,
    double letterSpacing = 0.3,
  }) =>
      TextStyle(
        fontSize: 10,
        fontWeight: bolder,
        letterSpacing: letterSpacing,
        color: color ?? Palette.black,
      );

  static h9Bold({
    color,
    double letterSpacing = 0.3,
  }) =>
      TextStyle(
        fontSize: 10,
        fontWeight: bold,
        letterSpacing: letterSpacing,
        color: color ?? Palette.black,
      );

  static h9Regular({
    color,
    double letterSpacing = 0.3,
  }) =>
      TextStyle(
        fontSize: 10,
        fontWeight: regular,
        letterSpacing: letterSpacing,
        color: color ?? Palette.black,
      );

  static h9Thin({
    color,
    double letterSpacing = 0.3,
  }) =>
      TextStyle(
        fontSize: 10,
        fontWeight: light,
        letterSpacing: letterSpacing,
        color: color ?? Palette.black,
      );

  static custom({
    color,
    double fontSize = 8,
    double latterSpacing = 0.3,
    double? height,
    FontWeight? fontWeight = regular,
    TextDecoration? decoration,
  }) =>
      TextStyle(
        fontSize: fontSize,
        fontWeight: fontWeight,
        letterSpacing: latterSpacing,
        height: height,
        color: color ?? Palette.black,
        decoration: decoration,
      );
}
