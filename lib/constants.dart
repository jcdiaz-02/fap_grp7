import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

// Colos that use in our app
const kPrimaryColor = Color(0xFF0F044C);
const kBackgroundColor=  Color(0xFFEEEEEE);
const kTextColor = Color(0xFF12153D);
const kTextLightColor = Color(0xFF9A9BB2);
const kFillStarColor = Color(0xFFFCC419);

const kDefaultPadding = 20.0;
const kTabHeight= 60.0;
const kTabIconSize= 20.0;

const kCornerRadius = BorderRadius.only(
    topLeft: Radius.circular(20),
    bottomLeft: Radius.circular(20),
    bottomRight: Radius.circular(60));

const kDefaultShadow = BoxShadow(
  offset: Offset(0, 4),
  blurRadius: 4,
  color: Colors.black26,
);


const kTabStyle = TextStyle(
  fontSize: 15,
  fontWeight: FontWeight.bold
); // Tab Bar

const kTabUnselectedStyle = TextStyle(
  fontSize: 12,
  color: Color(0xFF787A91),
);

const kMovieCardTitleStyle = TextStyle(
fontSize: 18,
fontWeight: FontWeight.bold,
);

const kMovieCardYearStyle = TextStyle(
    fontSize: 16,
    color: Color(0xFF787A91)
);

const kMovieCardPlotStyle = TextStyle(
    fontSize: 13,
);

const kMovieCardReleaseStateStyle= TextStyle(
    fontSize: 13,
    color: Color(0xFF787A91)
);

const kMovieCardGenreStyle= TextStyle(
fontSize: 12,);