import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:guide_me/screens/Homepage.dart';
import 'package:guide_me/screens/signUpScreen.dart';
import 'package:guide_me/widgets/Button.dart';
import 'package:guide_me/widgets/Textwidget.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SingleChildScrollView(
          padding: EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Container(
                width: 100.w,
                height: 30.h,
                child: Center(
                  child: Image.asset(
                    'assets/logo/logo.png',
                    width: 100.w,
                    height: 30.h,
                  ),
                ),
              ),
              const SizedBox(height: 20),
              Container(
                width: 100.w,
                child: Text(
                  textAlign: TextAlign.center,
                  'Hoşgeldiniz',
                  style: GoogleFonts.inter(
                      fontSize: 24, fontWeight: FontWeight.w200),
                ),
              ),
              const SizedBox(height: 30),
              const TextFieldWidget(
                  obsoureText: false,
                  placeholder: "E-mail Adresinizi Girin",
                  hintText: "E-mail Adresi"),
              const SizedBox(height: 25),
              const TextFieldWidget(
                  obsoureText: true,
                  placeholder: "Şifreniz",
                  hintText: "Şifre Girin"),
              const SizedBox(height: 20),
              MainButton(
                text: "Giriş Yap",
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => HomePage()),
                  );
                },
              ),
              const SizedBox(height: 20),
              const Text('Şununla devam et'),
              const SizedBox(height: 10),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    width: 15.w,
                    child: IconButton(
                      icon:
                          Image.asset('assets/logo/google.png'), // Google icon
                      iconSize: 50,
                      onPressed: () {},
                    ),
                  ),
                  SizedBox(
                    width: 25,
                  ),
                  Container(
                    width: 13.w,
                    child: IconButton(
                      icon: Image.asset(
                          'assets/logo/facebook.png'), // Google icon
                      iconSize: 50,
                      onPressed: () {},
                    ),
                  ),
                  SizedBox(
                    width: 25,
                  ),
                  Container(
                    width: 13.w,
                    child: IconButton(
                      icon: Image.asset('assets/logo/phone.png'), // Google icon
                      iconSize: 50,
                      onPressed: () {},
                    ),
                  ),
                ],
              ),
              SizedBox(height: 20),
              GestureDetector(
                onTap: () {},
                child: InkWell(
                  onTap: () => {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => Signupscreen()),
                    )
                  },
                  child: Text(
                    'Hesabın yok mu? Kayıt Ol',
                    style: TextStyle(
                      decoration: TextDecoration.underline,
                    ),
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
