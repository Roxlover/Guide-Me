import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:guide_me/widgets/PlayerWidget.dart';

class AsistansPage extends StatelessWidget {
  const AsistansPage({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              "Rehberlerimiz",
              style: GoogleFonts.inter(fontSize: 25),
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
    );
    ;
  }
}
