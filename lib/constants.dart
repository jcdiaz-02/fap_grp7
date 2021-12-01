import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'screens/info_page/info_page_screen.dart';
import 'screens/search_page/search_page_screen.dart';

const kImageURL = 'https://image.tmdb.org/t/p/';
const kImageUnavailable =
    'https://upload.wikimedia.org/wikipedia/commons/f/fc/No_picture_available.png';
// Colors that use in our app
const kPrimaryColor = Color(0xFF0F044C);
const kSecondaryColor = Color(0xFF141E61);
const kBackgroundColor = Color(0xFFEEEEEE);
const kSubColor = Color(0xFF787A91);
const kSubColor2 = Color(0xFF535463);

const kTextColor = Color(0xFF12153D);
const kTextLightColor = Color(0xFF9A9BB2);
const kFillStarColor = Color(0xFFFCC419);

const kAppBarTitle = Text('flixHub');

const kDefaultPadding = 20.0;
const kTabHeight = 60.0;
const kHomeTabHeight = 40.0;
const kTabIconSize = 20.0;

const kCornerRadius = BorderRadius.only(
    topLeft: Radius.circular(20),
    bottomLeft: Radius.circular(20),
    bottomRight: Radius.circular(60));

const kDefaultShadow = BoxShadow(
  offset: Offset(0, 4),
  blurRadius: 4,
  color: Colors.black26,
);

const kTabStyle =
    TextStyle(fontSize: 15, fontWeight: FontWeight.bold); // Tab Bar

const kTabUnselectedStyle = TextStyle(
  fontSize: 12,
  color: Color(0xFF787A91),
);

const kHomeTabStyle = TextStyle(
  fontSize: 25,
  fontWeight: FontWeight.bold,
);

const kHomeUnselectedTabStyle = TextStyle(fontWeight: FontWeight.normal);

const kMovieCardTitleStyle = TextStyle(
  fontSize: 18,
  fontWeight: FontWeight.bold,
);

const kMovieCardYearStyle = TextStyle(fontSize: 16, color: Color(0xFF787A91));

const kMovieCardPlotStyle = TextStyle(
  fontSize: 13,
);

const kMovieCardReleaseStateStyle =
    TextStyle(fontSize: 13, color: Color(0xFF787A91));

const kMovieCardGenreStyle = TextStyle(
  fontSize: 14,
);

const kCardImageBorderRadius = Radius.circular(15);

void kGoToInfoScreen(BuildContext context, int id, int type) {
  Navigator.of(context).push(MaterialPageRoute(
    builder: (context) => InfoPageScreen(id: id, type: type),
  ));
}

void kGoToSearchScreen(
  BuildContext context,
) {
  Navigator.of(context).push(MaterialPageRoute(
    builder: (context) => SearchPageScreen(),
  ));
}

const kMovieInfoBackDropBorderRadius = BorderRadius.only(
    bottomLeft: Radius.elliptical(250, 80),
    bottomRight: Radius.elliptical(250, 80));

const kTextFieldInputDecoration = InputDecoration(
  contentPadding: EdgeInsets.all(5.0),
  filled: true,
  fillColor: Colors.white,
  prefixIcon: Icon(
    Icons.search,
    color: kSubColor2,
    size: 16,
  ),
  hintText: 'Search',
  hintStyle: TextStyle(
    color: Colors.grey,
  ),
  border: OutlineInputBorder(
    borderRadius: BorderRadius.all(
      Radius.circular(10.0),
    ),
  ),
);
