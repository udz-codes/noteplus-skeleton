import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

const kPrimaryColor = Color(0xFF191a1c);
const kPrimaryAccentColor = Color(0xFF262626);
const kSecondaryColor = Color(0xFF00d692);
const kSecondaryAccentColor = Color(0xFFb8ffe8);


const kHeadingStyle = TextStyle(
  color: kSecondaryColor,
  fontWeight: FontWeight.w300,
  fontSize: 28,
  letterSpacing: 2
);

const kTextFieldDecoration = InputDecoration(
  filled: true,
  fillColor: kSecondaryAccentColor,
  contentPadding: EdgeInsets.symmetric(vertical: 10.0, horizontal: 20.0),
  border: OutlineInputBorder(
    borderRadius: BorderRadius.all(Radius.circular(32.0)),
  ),
  enabledBorder: OutlineInputBorder(
    borderSide: BorderSide(color: kSecondaryAccentColor, width: 0.0),
    borderRadius: BorderRadius.all(Radius.circular(32.0)),
  ),
  focusedBorder: OutlineInputBorder(
    borderSide: BorderSide(color: kSecondaryAccentColor, width: 0.0),
    borderRadius: BorderRadius.all(Radius.circular(32.0)),
  ),
  hintStyle: TextStyle(
    color: kPrimaryColor,
    fontWeight: FontWeight.w300
  ),
);

const kBodyFieldDecoration = InputDecoration(
  contentPadding: EdgeInsets.all(15),
  filled: true,
  fillColor: kSecondaryAccentColor,
  enabledBorder: OutlineInputBorder(
    borderSide: BorderSide(color: kPrimaryColor, width: 0.0),
    borderRadius: BorderRadius.all(Radius.circular(0.0)),
  ),
  focusedBorder: OutlineInputBorder(
    borderSide: BorderSide(color: kPrimaryColor, width: 0.0),
    borderRadius: BorderRadius.all(Radius.circular(0.0)),
  ),
);