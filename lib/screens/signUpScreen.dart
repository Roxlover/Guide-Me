import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:guide_me/screens/loginScreen.dart';
import 'package:guide_me/widgets/Button.dart';
import 'package:guide_me/widgets/Textwidget.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class Signupscreen extends StatelessWidget {
  const Signupscreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SingleChildScrollView(
          padding: EdgeInsets.all(15),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Container(
                width: 45.w,
                child: Center(
                  child: Image.asset(
                    'assets/logo/logo.png',
                  ),
                ),
              ),
              const SizedBox(height: 20),
              Container(
                width: 100.w,
                child: Text(
                  textAlign: TextAlign.center,
                  ' Kayıt Ol',
                  style: GoogleFonts.inter(
                      fontSize: 24, fontWeight: FontWeight.w200),
                ),
              ),
              SizedBox(height: 30),
              Container(
                child: TextFieldWidget(
                  obsoureText: false,
                  hintText: "Ad Soyad",
                  placeholder: "Adınız ve Soyadınız",
                ),
              ),
              SizedBox(height: 20),
              Container(
                child: TextFieldWidget(
                  obsoureText: false,
                  hintText: "E-mail Adresi",
                  placeholder: "E-mail Adresinizi Girin",
                ),
              ),
              SizedBox(height: 20),
              Container(
                child: TextFieldWidget(
                  obsoureText: false,
                  hintText: "Telefon numarası",
                  placeholder: "Telefon Numarası Girin",
                ),
              ),
              SizedBox(height: 20),
              Container(
                child: TextFieldWidget(
                  obsoureText: true,
                  hintText: "Şifreniz",
                  placeholder: "Güçlü bir şifre belirleyin",
                ),
              ),
              SizedBox(height: 20),
              MainButton(
                  text: "Kayıt Olun",
                  onPressed: () => {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => LoginScreen(),
                          ),
                        ),
                      }),
              SizedBox(height: 30),
              GestureDetector(
                onTap: () {},
                child: InkWell(
                  onTap: () => {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => LoginScreen(),
                      ),
                    ),
                  },
                  child: Text(
                    'Hesabın yok mu?  Giriş yap',
                    style: TextStyle(
                      decoration: TextDecoration.underline,
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
