import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:guide_me/NavigationPages/AccountPage.dart';
import 'package:guide_me/NavigationPages/GuidesPage.dart';
import 'package:guide_me/NavigationPages/HomePage.dart';
import 'package:guide_me/NavigationPages/LocationPage.dart';

import 'package:responsive_sizer/responsive_sizer.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
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
                      Container(width: 70, child: Text("")),
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
        body: PageView(
          children: <Widget>[
            HomePageNavigation(),
            LocationPage(),
            AsistansPage(),
            AccountPage(),
          ],
          controller: _pageController,
          onPageChanged: (index) {
            setState(() {
              _selectedIndex = index;
            });
          },
        ),
        bottomNavigationBar: Container(
          color: Colors.white,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
            child: GNav(
              onTabChange: _onItemTapped,
              color: Colors.grey[600],
              backgroundColor: Colors.white,
              selectedIndex: _selectedIndex,
              activeColor: Color.fromARGB(200, 30, 129, 176),
              iconSize: 24.sp,
              tabBackgroundColor: Colors.grey.shade300,
              tabBorderRadius: 20,
              padding: EdgeInsets.all(16),
              gap: 20,
              tabs: const [
                GButton(icon: Icons.home, text: 'Ana Sayfa'),
                GButton(icon: Icons.location_on, text: 'Konum'),
                GButton(
                    icon: Icons.record_voice_over_rounded, text: 'Rehberler'),
                GButton(icon: Icons.person, text: 'Hesap')
              ],
            ),
          ),
        ));

    // BottomNavigationBar(
    //   backgroundColor: Colors.blue,
  }
}









//  BottomNavigationBar(
//           backgroundColor: Colors.blue,
//           items: const <BottomNavigationBarItem>[
//             BottomNavigationBarItem(
//               icon: Icon(
//                 Icons.home,
//               ),
//               label: 'Ana Sayfa',
//             ),
//             BottomNavigationBarItem(
//               icon: Icon(Icons.record_voice_over_rounded),
//               label: 'Asistanlar',
//             ),
//             BottomNavigationBarItem(
//                 icon: Icon(Icons.location_on), label: 'Konum'),
//             BottomNavigationBarItem(
//               icon: Icon(Icons.person),
//               label: 'Hesap',
//             ),
//           ],
//           currentIndex: _selectedIndex,
//           unselectedItemColor: Colors.grey[400],
//           selectedItemColor: Colors.white,
//           onTap: _onItemTapped,
//           iconSize: 26.sp,
//           showUnselectedLabels: true,
//           selectedFontSize: 16,
//         ));