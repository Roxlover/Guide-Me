import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:guide_me/screens/promotion1.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class Promotion extends StatelessWidget {
  const Promotion({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              Container(
                height: 55.h,
                width: 100.w,
                child: Image.asset(
                  'assets/images/start1.png',
                  fit: BoxFit.cover,
                ),
              ),
              SizedBox(height: 20),
              Text(
                'Guide Me',
                style: GoogleFonts.inter(
                    fontSize: 35, fontWeight: FontWeight.w400),
              ),
              SizedBox(height: 20),
              Container(
                width: 75.w,
                child: Text(
                  'Her yolculuk, yeni bir hikaye demektir. Bu hikayeyi seçtiğin turist rehberiyle dinlemek ister misin ?',
                  style: GoogleFonts.inter(
                      fontSize: 16, fontWeight: FontWeight.w200),
                ),
              ),
              SizedBox(height: 20),
              Container(
                width: 50,
                height: 20,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Container(
                      height: 10,
                      width: 10,
                      decoration: BoxDecoration(
                        color: Color.fromRGBO(0, 122, 255, 1),
                        borderRadius: BorderRadius.circular(50),
                      ),
                    ),
                    Container(
                      height: 10,
                      width: 10,
                      decoration: BoxDecoration(
                        color: Colors.grey[400],
                        borderRadius: BorderRadius.circular(50),
                      ),
                    ),
                    Container(
                      height: 10,
                      width: 10,
                      decoration: BoxDecoration(
                        color: Colors.grey[400],
                        borderRadius: BorderRadius.circular(50),
                      ),
                    )
                  ],
                ),
              ),
              SizedBox(height: 20),
              Padding(
                padding: const EdgeInsets.all(6.0),
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => Promotion1()),
                    );
                  },
                  style: ElevatedButton.styleFrom(
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10.0)),
                    backgroundColor: Color.fromARGB(200, 30, 129, 176),
                    minimumSize: Size(300, 65),
                  ),
                  child: Text(
                    'Sonraki',
                    style: GoogleFonts.inter(
                        fontSize: 20,
                        color: Colors.white,
                        fontWeight: FontWeight.w200),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
