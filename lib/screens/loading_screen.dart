import 'package:fap_grp7/constants.dart';
import 'package:flutter/material.dart';
import 'package:fap_grp7/screens/home/home_screen.dart';
import 'package:lottie/lottie.dart';

class LoadingScreen extends StatefulWidget {
  @override
  _LoadingScreenState createState() => _LoadingScreenState();
}

class _LoadingScreenState extends State<LoadingScreen>
    with TickerProviderStateMixin {
  late AnimationController _lottieAnimation;
  var expanded = false; //boolean for '808' if expanded or not
  final textDuration = Duration(seconds: 1);

  @override
  void initState() {
    _lottieAnimation = AnimationController(
      vsync: this,
      duration: Duration(seconds: 3),
    );

    Future.delayed(Duration(seconds: 1)) //delay duration before going to future action
        .then((value) => setState(() => expanded = true))
        .then((value) => Duration(seconds: 1))
        .then(
          (value) => Future.delayed(Duration(seconds: 2)).then(
            (value) => Navigator.of(context)
            .pushAndRemoveUntil(MaterialPageRoute(builder: (context) => HomeScreen()), (route) => false),
        //navigate to route of homepage and remove previous routes until route becomes true

      ),
    );
    super.initState();

  }


  @override
  Widget build(BuildContext context) {
    return Material(
      child: Container(
        color: kPrimaryColor,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            AnimatedDefaultTextStyle(
              duration: textDuration,
              curve: Curves.fastOutSlowIn,
              style: TextStyle(
                fontSize: !expanded ? 90 : 50,
                fontFamily: 'MajorMonoDisplay',
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
              child: Text(
                "Flix",
              ),
            ),

            //animates an empty container on top of the remaining title "DRUMS"
            AnimatedCrossFade(
              firstCurve: Curves.fastOutSlowIn,
              //change
              crossFadeState: !expanded
                  ? CrossFadeState.showFirst
                  : CrossFadeState.showSecond,
              duration: textDuration,
              firstChild: Container(),
              secondChild: _introRemainder(), //Drums text gets animated
              alignment: Alignment.centerLeft,
              sizeCurve: Curves.easeInOut,
            ),
          ],
        ),
      ),
    );
  }

  Widget _introRemainder() {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Text(
          "Hub",
          style: TextStyle(
            color: Colors.white,
            fontSize: 50,
            fontFamily: 'MajorMonoDisplay',
            fontWeight: FontWeight.w600,
          ),
        ),
        LottieBuilder.asset(
          'assets/1961-movie-loading.json',
          onLoaded: (composition) {
            _lottieAnimation.duration = composition.duration;
          },
          frameRate: FrameRate.max,
          repeat: false,
          animate: false,
          height: 80,
          width: 80,
          controller: _lottieAnimation,
        )
      ],
    );
  }
}
