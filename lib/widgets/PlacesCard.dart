import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:guide_me/screens/chooseGuide.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class PlacesCard extends StatefulWidget {
  final String title;
  final String image;
  final String description;

  PlacesCard(
      {Key? key,
      required this.title,
      required this.image,
      required this.description})
      : super(key: key);

  @override
  _PlacesCardState createState() => _PlacesCardState();
}

class _PlacesCardState extends State<PlacesCard> {
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: InkWell(
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => ChooseGuide()),
          );
        },
        child: Container(
          width: 100.w,
          decoration: BoxDecoration(
              color: Colors.white,
              border: Border.all(
                  color: Color.fromARGB(200, 30, 129, 176), width: 2),
              borderRadius: BorderRadius.circular(15),
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withOpacity(0.5),
                  spreadRadius: 5,
                  blurRadius: 7,
                  offset: Offset(0, 3), // Gölgenin konumu
                ),
              ]),
          child: Column(
            children: [
              Padding(
                  padding: const EdgeInsets.all(6.0),
                  child: Container(
                    width: 80.w,
                    height: 24.h,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15),
                    ),
                    child: Column(
                      children: [
                        ClipRRect(
                          borderRadius: BorderRadius.circular(15),
                          child: Image.asset(
                            width: 80.w,
                            height: 20.h,
                            widget.image,
                            fit: BoxFit.fitWidth,
                          ),
                        ),
                        Text(
                          widget.title,
                          style: GoogleFonts.inter(
                              fontSize: 20,
                              color: Color.fromARGB(200, 30, 129, 176)),
                        ),
                      ],
                    ),
                  )),
            ],
          ),
        ),
      ),
    );
  }
}
