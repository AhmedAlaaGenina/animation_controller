import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> with SingleTickerProviderStateMixin {
  AnimationController animationController;

  @override
  void initState() {
    animationController =
        AnimationController(vsync: this, duration: Duration(seconds: 1));
    animationController.repeat();
    super.initState();
  }

  @override
  void dispose() {
    animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.black,
        body: Center(
          child: GestureDetector(
            //tap hold to stop
            onTapDown: (tapDetails) {
              animationController.stop();
            },
            onTapUp: (tapDetails) {
              animationController.repeat();
            },
            //tap to stop tap to start
            // onTap: () {
            //   if (animationController.isAnimating) {
            //     animationController.stop();
            //   } else {
            //     animationController.repeat();
            //   }
            // },
            child: RotationTransition(
              alignment: Alignment.center,
              turns: animationController,
              child: Image.asset('assets/ramdanKareem.png'),
            ),
          ),
        ),
      ),
    );
  }
}
