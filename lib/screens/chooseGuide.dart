import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:guide_me/NavigationPages/AccountPage.dart';
import 'package:guide_me/NavigationPages/GuidesPage.dart';
import 'package:guide_me/NavigationPages/HomePage.dart';
import 'package:guide_me/NavigationPages/LocationPage.dart';
import 'package:guide_me/widgets/PlayerWidget.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class ChooseGuide extends StatefulWidget {
  const ChooseGuide({super.key});

  @override
  State<ChooseGuide> createState() => _ChooseGuideState();
}

class _ChooseGuideState extends State<ChooseGuide> {
  late AudioPlayer player = AudioPlayer();
  int _selectedIndex = 0;
  final PageController _pageController = PageController();
  static const List<Widget> _widgetOptions = <Widget>[
    HomePageNavigation(),
    LocationPage(),
    AsistansPage(),
    AccountPage(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });

    _pageController.jumpToPage(index);
  }

  @override
  void initState() {
    super.initState();

    // Create the audio player.
    player = AudioPlayer();

    // Set the release mode to keep the source after playback has completed.
    player.setReleaseMode(ReleaseMode.stop);

    // Start the player as soon as the app is displayed.
  }

  @override
  void dispose() {
    // Release all sources and dispose the player.
    player.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: false,
          toolbarHeight: 80,
          actions: [
            Container(
              width: 100.w,
              height: 15.h,
              decoration: BoxDecoration(
                color: Color.fromARGB(200, 30, 129, 176),
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(20),
                  bottomRight: Radius.circular(20),
                ),
              ),
              child: Padding(
                  padding: const EdgeInsets.only(right: 8),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Container(
                          width: 70,
                          child: IconButton(
                            icon: Icon(
                              Icons.arrow_back,
                              color: Colors.white,
                              size: 25.sp,
                            ),
                            onPressed: () => {Navigator.pop(context)},
                          )),
                      Image.asset(
                        'assets/logo/mainlogo.png',
                        width: 20.w,
                        height: 10.h,
                      ),
                      Container(
                        width: 50,
                        height: 50,
                        child: CircleAvatar(
                          radius: 50,
                          backgroundImage:
                              AssetImage('assets/logo/profile.png'),
                        ),
                      )
                    ],
                  )),
            )
          ],
        ),
        body: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  "Lütfen Rehber Seçiniz",
                  style: GoogleFonts.inter(
                      fontSize: 25, fontWeight: FontWeight.w200),
                ),
              ),
              PlayerWidget(
                  img: "assets/profile/caner.png",
                  name: "Caner",
                  audio: "audio/caner.mp3"),
              PlayerWidget(
                  img: "assets/profile/sila.png",
                  name: "Sıla",
                  audio: "audio/sila.mp3"),
              PlayerWidget(
                  img: "assets/profile/yusuf.png",
                  name: "Yusuf",
                  audio: "audio/yusuf.mp3"),
              PlayerWidget(
                  img: "assets/profile/ismet.png",
                  name: "İsmet",
                  audio: "audio/ismet.mp3"),
            ],
          ),
        ));
  }
}
