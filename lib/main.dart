import 'package:flutter/material.dart';
import 'package:guide_me/screens/Homepage.dart';
import 'package:guide_me/widgets/PlayerWidget.dart';
import 'package:guide_me/screens/PlacesDetail.dart';
import 'package:guide_me/screens/chooseGuide.dart';
import 'package:guide_me/screens/loginScreen.dart';
import 'package:guide_me/screens/promotion.dart';
import 'package:guide_me/screens/promotion1.dart';
import 'package:guide_me/screens/promotion2.dart';
import 'package:guide_me/screens/signUpScreen.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ResponsiveSizer(builder: (context, orientation, deviceType) {
      return MaterialApp(
        title: 'Guide Me',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: Promotion(),
        debugShowCheckedModeBanner: false,
      );
    });
  }
}
