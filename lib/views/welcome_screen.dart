

import 'package:flutter/material.dart';
import 'package:official_fortline_app/views/widgets/toggle_button.dart';
import 'new_login.dart';
import 'signup_screen.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:page_transition/page_transition.dart';



class WelcomeScreen extends StatefulWidget {
  const WelcomeScreen({Key? key}) : super(key: key);

  @override
  State<WelcomeScreen> createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen> {
  @override
  Widget build(BuildContext context) {
   final width = MediaQuery.of(context).size.width * 1;
   final height = MediaQuery.of(context).size.height * 1;

    return Scaffold(
      body: Column(
        children: [
          Flexible(
            fit: FlexFit.tight,
            child: Padding(
              padding: const EdgeInsets.only(left: 40),
              child: Container(
                height: height * 0.2,
                    width:  width * 9,
                    decoration: const BoxDecoration(

                      image: DecorationImage(

                        image: AssetImage('assets/images/elementTop1.png',),
                        alignment: Alignment.topRight,
                        fit: BoxFit.fitWidth


                      ),
                    ),
                    child: Column(
                      children: [
                        SizedBox(height: height * 0.30,),
                        Image.asset('assets/images/logo.png',height: 60,),

                      ],
                    ),
                  ),
            ),
          ),
          Flexible(
            fit: FlexFit.tight,

              child: Container(
                height: height * .9,
                width:  width * 9,
                decoration: const BoxDecoration(
                  color: Color(0xffED1C24),
                  borderRadius: BorderRadius.only(topLeft: Radius.circular(40),
                  topRight: Radius.circular(40)),
                  image: DecorationImage(

                      image: AssetImage('assets/images/elementBottom.png',),
                      alignment: Alignment.bottomLeft,
                      fit: BoxFit.fitWidth


                  ),
                ),
                child: Column(
                  children: [
                    SizedBox(height: height * 0.02,),

                    Padding(
                      padding: const EdgeInsets.only(left: 15),
                      child: Align(
                        alignment: Alignment.topCenter,
                        child: Text('Welcome To Fortline',style: GoogleFonts.albertSans(
                            fontSize: 30,
                            fontWeight: FontWeight.bold,
                            color: Colors.white
                        )),
                      ),
                    ),
                    SizedBox(height: height * 0.01,),
                    Padding(
                      padding: const EdgeInsets.only(left: 15),
                      child: Align(
                        alignment: Alignment.topCenter,
                        child: Text('Enabling Technology To The Next Level',style: GoogleFonts.albertSans(
                            fontSize: 12,
                            fontWeight: FontWeight.bold,
                            color: Colors.white
                        )),
                      ),
                    ),

                    SizedBox(height: height * 0.04,),
                    Center(
                      child: Container(
                        padding: const EdgeInsets.all(10.0),
                        child: ToggleButton(
                          width: 250.0,
                          height: 40.0,
                          toggleBackgroundColor: Colors.transparent,
                          toggleBorderColor: (Colors.white),
                          toggleColor: (Colors.white),
                          activeTextColor: const Color(0xffED1C24),
                          inactiveTextColor: Colors.white,
                          leftDescription: 'Sign Up',
                          rightDescription: 'Sign In',
                          onLeftToggleActive: () {
                            Navigator.pushReplacement(context, PageTransition(child: const NewLogin(), type: PageTransitionType.rightToLeft));

                          },
                          onRightToggleActive: () {
                            Navigator.pushReplacement(context, PageTransition(child: const SignUpScreen(), type: PageTransitionType.rightToLeft));

                          },
                        ),
                      ),
                    )

                  ],
                ),
              ),
            ),


        ],
      ),



    );
  }
}
