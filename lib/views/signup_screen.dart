import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:official_fortline_app/views/otp.dart';
import '../utils/utils.dart';
import 'new_login.dart';
import 'package:page_transition/page_transition.dart';


class SignUpScreen extends StatefulWidget {
  const SignUpScreen({Key? key}) : super(key: key);

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  GlobalKey<FormState> _formKey = GlobalKey<FormState>();



  @override
  Widget build(BuildContext context) {

    Size size = MediaQuery.of(context).size;
    print("device height ${size.height}");
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
                width: size.width,
                height: size.height * 1,
                decoration: BoxDecoration(

                    image: DecorationImage(
                        image: AssetImage("assets/images/otp_bg.png",),
                        fit: BoxFit.fill,



                    )
                ),
                child: Padding(
                    padding: const EdgeInsets.only(left: 15),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        SizedBox(height: size.height * 0.06,),
                         Image.asset("assets/images/logo.png",
                            width: size.width * 0.35,
                            //fit: BoxFit.cover,
                          ),

                        SizedBox(height: size.height * 0.03,),
                        const Text("Let's Sign Up",
                          style: TextStyle(
                              color: Color(0xffED1C24),
                              fontSize: 30,
                              fontWeight: FontWeight.bold
                          ),
                        ),
                        SizedBox(height: size.height * 0.03,),
                        Form(
                                key: _formKey,
                                child: Column(
                                  children: <Widget>[
                                    SizedBox(height: size.height * 0.04,),
                                  Padding(
                                    padding: const EdgeInsets.only(right: 15.0),
                                    child: Container(
                                      height: size.height * 0.06,
                                      width: size.width * 1,
                                      child: Row(
                                          children: [
                                             Expanded(
                                               child: TextFormField(

                                                  decoration: const InputDecoration(

                                                      filled: true,
                                                      fillColor: Colors.white,
                                                      focusedBorder:OutlineInputBorder(
                                                          borderSide: BorderSide(color: Color(0xffED1C24)),
                                                          borderRadius: BorderRadius.all(Radius.circular(8.0))
                                                      ),

                                                      border: OutlineInputBorder(

                                                        borderRadius: BorderRadius.all(Radius.circular(8.0)),
                                                      ),
                                                      hintText: "Full Name",
                                                      hintStyle: TextStyle(
                                                        fontSize: 12,
                                                        fontWeight: FontWeight.w500
                                                      ),
                                                  ),
                                                  keyboardType: TextInputType.text,
                                                ),
                                             ),

                                            SizedBox(width: size.width * 0.03,),
                                            Expanded(child: TextFormField(
                                                decoration: const InputDecoration(
                                                    filled: true,
                                                    fillColor: Colors.white,
                                                    focusedBorder:OutlineInputBorder(
                                                        borderSide: BorderSide(color: Color(0xffED1C24)),
                                                        borderRadius: BorderRadius.all(Radius.circular(8.0))
                                                    ),
                                                    border: OutlineInputBorder(
                                                        borderRadius: BorderRadius.all(Radius.circular(8.0))
                                                    ),
                                                    hintText: "Email",
                                                  hintStyle: TextStyle(
                                                      fontSize: 12,
                                                      fontWeight: FontWeight.w500
                                                  ),
                                                ),
                                                keyboardType: TextInputType.emailAddress,
                                              ),),

                                          ],),
                                    ),
                                  ),

                                    SizedBox(height: size.height * 0.03,),
                                    Padding(
                                      padding: const EdgeInsets.only(right: 15.0),
                                      child: Container(
                                        height: size.height * 0.06,
                                        width: size.width * 1,
                                        child: Row(
                                          children: [
                                            Expanded(
                                              child: TextFormField(
                                                decoration: const InputDecoration(
                                                    filled: true,
                                                    fillColor: Colors.white,
                                                    focusedBorder:OutlineInputBorder(
                                                        borderSide: BorderSide(color: Color(0xffED1C24)),
                                                        borderRadius: BorderRadius.all(Radius.circular(8.0))
                                                    ),
                                                    border: OutlineInputBorder(
                                                        borderRadius: BorderRadius.all(Radius.circular(8.0))
                                                    ),
                                                    hintText: "Phone no",
                                                  hintStyle: TextStyle(
                                                      fontSize: 12,
                                                      fontWeight: FontWeight.w500
                                                  ),


                                                ),
                                                keyboardType: TextInputType.phone,
                                              ),
                                            ),

                                            SizedBox(width: size.width * 0.03,),
                                            Expanded(child:TextFormField(
                                              decoration: const InputDecoration(
                                                  filled: true,
                                                  fillColor: Colors.white,
                                                  focusedBorder:OutlineInputBorder(
                                                      borderSide: BorderSide(color: Color(0xffED1C24)),
                                                      borderRadius: BorderRadius.all(Radius.circular(8.0))
                                                  ),
                                                  border: OutlineInputBorder(
                                                      borderRadius: BorderRadius.all(Radius.circular(8.0))
                                                  ),
                                                  hintText: "Password",
                                                  hintStyle: TextStyle(
                                                      fontSize: 12,
                                                      fontWeight: FontWeight.w500
                                                  ),
                                                  suffixIcon: Icon(Icons.visibility_off_outlined,size: 20,)
                                              ),
                                              obscureText: true,
                                            ),),

                                          ],
                                        ),
                                      ),
                                    ),

                                     SizedBox(height: size.height * 0.03,),
                                     Padding(
                                       padding: const EdgeInsets.only(right: 15.0),
                                       child: Container(
                                         height: size.height * 0.06,
                                         width: size.width * 1,
                                         child: TextFormField(
                                            decoration: const InputDecoration(
                                                filled: true,
                                                fillColor: Colors.white,
                                                focusedBorder:OutlineInputBorder(
                                                    borderSide: BorderSide(color: Color(0xffED1C24)),
                                                    borderRadius: BorderRadius.all(Radius.circular(8.0))
                                                ),
                                                border: OutlineInputBorder(
                                                    borderRadius: BorderRadius.all(Radius.circular(8.0))
                                                ),
                                                hintText: "Address",
                                              hintStyle: TextStyle(
                                                  fontSize: 12,
                                                  fontWeight: FontWeight.w500
                                              ),
                                            ),
                                            keyboardType: TextInputType.text,
                                          ),
                                       ),
                                     ),

                                    SizedBox(height: size.height * 0.03,),
                                    Padding(
                                     padding: const EdgeInsets.only(right: 15.0),
                                     child: Container(
                                       height: size.height * 0.06,
                                       width: size.width * 1,
                                       child: Row(
                                         children: [
                                           Expanded(
                                             child: TextFormField(
                                               decoration: const InputDecoration(
                                                   filled: true,
                                                   fillColor: Colors.white,
                                                   focusedBorder:OutlineInputBorder(
                                                       borderSide: BorderSide(color: Color(0xffED1C24)),
                                                       borderRadius: BorderRadius.all(Radius.circular(8.0))
                                                   ),
                                                   border: OutlineInputBorder(
                                                       borderRadius: BorderRadius.all(Radius.circular(8.0))
                                                   ),
                                                   hintText: "Company Name",
                                                 hintStyle: TextStyle(
                                                     fontSize: 12,
                                                     fontWeight: FontWeight.w500
                                                 ),
                                               ),
                                               keyboardType: TextInputType.text,
                                             ),
                                           ),

                                           SizedBox(width: size.width * 0.03,),
                                           Expanded(child:TextFormField(
                                             decoration: const InputDecoration(
                                                 filled: true,
                                                 fillColor: Colors.white,
                                                 focusedBorder:OutlineInputBorder(
                                                     borderSide: BorderSide(color: Color(0xffED1C24)),
                                                     borderRadius: BorderRadius.all(Radius.circular(8.0))
                                                 ),
                                                 border: OutlineInputBorder(
                                                     borderRadius: BorderRadius.all(Radius.circular(8.0))
                                                 ),
                                                 hintText: "Company Email",
                                               hintStyle: TextStyle(
                                                   fontSize: 12,
                                                   fontWeight: FontWeight.w500
                                               ),
                                             ),
                                             keyboardType: TextInputType.emailAddress,
                                           ),
                                           ),

                                         ],),
                                     ),
                                   ),
                                    SizedBox(height: size.height * 0.03,),
                                    InkWell(
                                      child: Container(
                                        width: size.width * 0.55,
                                        height: size.height * 0.05,
                                        decoration: BoxDecoration(
                                            color: const Color(0xffED1C24),
                                            borderRadius: BorderRadius.circular(20)
                                        ),
                                        child: const Center(child: Text("Sign Up",
                                          style: TextStyle(
                                              color: Colors.white
                                          ),
                                        )),
                                      ),
                                      onTap: (){
                                        Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (ctx){
                                          return OtpScreen();
                                        }));
                                      },
                                    ),

                                    SizedBox(height: size.height * 0.03,),
                                    Padding(
                                      padding: const EdgeInsets.only(bottom: 8.0),
                                      child: InkWell(child: const Text("Already have an account? Sign In"),
                                        onTap: (){
                                            Navigator.pushReplacement(context, PageTransition(child: const NewLogin(), type: PageTransitionType.rightToLeft));
                                        },
                                      ),
                                    ),
                                  ],
                                ),
                         )
                      ],
                    ),
                  ),
                ),
        ),



    );
  }
}
