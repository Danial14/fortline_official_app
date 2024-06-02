import 'package:flutter/material.dart';
import 'package:flutter_custom_clippers/flutter_custom_clippers.dart';
import 'package:official_fortline_app/views/edit_user_profile.dart';
import 'package:official_fortline_app/views/privacy_policy_screen.dart';
import 'package:official_fortline_app/views/products.dart';
import 'package:official_fortline_app/views/terms_condition_screen.dart';
import 'package:official_fortline_app/views/welcome_screen.dart';
import 'package:page_transition/page_transition.dart';

import 'constants/constants.dart';
import 'home.dart';

class UserProfile extends StatefulWidget {
  const UserProfile({Key? key}) : super(key: key);

  @override
  State<UserProfile> createState() => _UserProfileState();
}

class _UserProfileState extends State<UserProfile> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
        resizeToAvoidBottomInset: false,
    body: Container(
    width: size.width,
    height: size.height,
    decoration: const BoxDecoration(
    image: DecorationImage(
    image: AssetImage("assets/images/edit profile.png"),
    fit: BoxFit.fill
    )
    ),
    child: Column(
    children: [
    Padding(
    padding: const EdgeInsets.only(left: 8, top: 45),
    child: Row(
    children: [
    Image.asset("assets/images/fortline_logo_white.png",
    height: 25,
    ),
    SizedBox(width: size.width * 0.6,),
    const Icon(Icons.notifications_none, size: 20, color: Colors.white,),

    InkWell(
        onTap: (){
          Navigator.pushReplacement(context, PageTransition(child: const UserProfile(), type: PageTransitionType.rightToLeft));
        },
        child: Image.asset("assets/images/user.png", height: 20, color: Colors.white,)),
    ],
    ),
    ),
    Row(
    children: [
    InkWell(
      onTap: (){
        Navigator.pushReplacement(context, PageTransition(child: const Home(), type: PageTransitionType.leftToRight));
      },
      child: Padding(
      padding: const EdgeInsets.only(left: 8.0, top: 10),
      child: Image.asset("assets/images/back_button.png", width: 25, height: 25,),
      ),
    ),
      SizedBox(width: size.width * 0.25,),

      const Expanded(
      child: Padding(
    padding: EdgeInsets.only(top: 15.0),
    child:  Text("MY ACCOUNT",
    style: TextStyle(color: Colors.white,
    fontSize: 16,
    fontWeight: FontWeight.w600
    ),
    ),
    ),),
    ],
    ),
      SizedBox(height: size.height * 0.022,),
      Container(
        alignment: Alignment.center,
        width: size.width,
        child: ClipPath(
            clipper: HexagonalClipper(),
            child: Container(
              width: 140,
              height: 100,
              decoration: const BoxDecoration(
                  color: Colors.grey,
                  image: DecorationImage(
                    image: AssetImage("assets/images/user_av.png"),
                    //fit: BoxFit.cover
                  )
              ),
            ),
          ),
      ),
      SizedBox(height: size.height * 0.03,),
      Expanded(child: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              padding: const EdgeInsets.all(8),
              width: size.width * 0.9,
              height: size.height * 0.43,
              decoration: BoxDecoration(
                  color: MyConstants.INPUT_BOX_RED_COLOR,
                  borderRadius: const BorderRadius.only(topRight: Radius.circular(10),
                      bottomRight: Radius.circular(10),
                      topLeft: Radius.circular(10),
                      bottomLeft: Radius.circular(30)
                  )
              ),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      const Text("Edit Profile", style: TextStyle(
                          color: Colors.white
                      ),),
                      const SizedBox(width: 5,),
                      InkWell(child: Image.asset("assets/images/edit.png", width: 30, height: 30, color: Colors.white,),
                        onTap: (){
                          Navigator.pushReplacement(context, PageTransition(child: const EditUserProfile(), type: PageTransitionType.rightToLeft));
                        },
                      ),
                    ],
                  ),
                  Container(
                    width: size.width,
                    child: Column(
                      children: [
                        Row(
                          children: [
                            Container(
                              width: 25,
                              height: 25,
                              alignment: Alignment.center,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(5),
                                color: Colors.white,
                              ),
                              child: Image.asset("assets/images/pro_user.png", width: 20, height: 20,),
                            ),
                            const SizedBox(width: 3),
                            Container(color: Colors.white,
                              height: 15,
                              width: 2,
                            ),
                            const SizedBox(width: 5,),
                            const Text("Full Name: Sumair Khan", style: TextStyle(color: Colors.white),)
                          ],
                        ),
                        Image.asset("assets/images/dotted_border.png", width: size.width * 0.8,)
                      ],
                    ),
                  ),
                  const SizedBox(height: 8,),
                  Container(
                    width: size.width,
                    child: Column(
                      children: [
                        Row(
                          children: [
                            Container(
                              width: 25,
                              height: 25,
                              alignment: Alignment.center,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(5),
                                color: Colors.white,
                              ),
                              child: Image.asset("assets/images/pro_email.png", width: 20, height: 20,),
                            ),
                            const SizedBox(width: 3),
                            Container(color: Colors.white,
                              height: 15,
                              width: 2,
                            ),
                            const SizedBox(width: 5,),
                            const Text("Email: abc@gmail.com", style: TextStyle(color: Colors.white),)
                          ],
                        ),
                        Image.asset("assets/images/dotted_border.png", width: size.width * 0.8,)
                      ],
                    ),
                  ),
                  SizedBox(height: 8,),
                  Container(
                    width: size.width,
                    child: Column(
                      children: [
                        Row(
                          children: [
                            Container(
                              width: 25,
                              height: 25,
                              alignment: Alignment.center,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(5),
                                color: Colors.white,
                              ),
                              child: Image.asset("assets/images/pro_phone_call.png", width: 20, height: 20,),
                            ),
                            SizedBox(width: 3),
                            Container(color: Colors.white,
                              height: 15,
                              width: 2,
                            ),
                            SizedBox(width: 5,),
                            Text("Phone: 123456", style: TextStyle(color: Colors.white),)
                          ],
                        ),
                        Image.asset("assets/images/dotted_border.png", width: size.width * 0.8,)
                      ],
                    ),
                  ),
                  SizedBox(height: 8,),
                  Container(
                    width: size.width,
                    child: Column(
                      children: [
                        Row(
                          children: [
                            Container(
                              width: 25,
                              height: 25,
                              alignment: Alignment.center,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(5),
                                color: Colors.white,
                              ),
                              child: Image.asset("assets/images/pro_lock.png", width: 20, height: 20,),
                            ),
                            SizedBox(width: 3),
                            Container(color: Colors.white,
                              height: 15,
                              width: 2,
                            ),
                            SizedBox(width: 5,),
                            Text("Password: Sumair Khan", style: TextStyle(color: Colors.white),)
                          ],
                        ),
                        Image.asset("assets/images/dotted_border.png", width: size.width * 0.8,),
                        SizedBox(height: 10,),
                        Container(width: size.width,
                          child: Row(
                            children: [
                              Container(
                                width: 25,
                                height: 25,
                                alignment: Alignment.center,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(5),
                                  color: Colors.white,
                                ),
                                child: Image.asset("assets/images/pro_loc.png", width: 20, height: 20,),
                              ),
                              SizedBox(width: 3),
                              Container(color: Colors.white,
                                height: 15,
                                width: 2,
                              ),
                              SizedBox(width: 5,),
                              Text("Address: abc street", style: TextStyle(color: Colors.white),)
                            ],
                          ),
                        ),

                        Image.asset("assets/images/dotted_border.png", width: size.width * 0.8,),
                        SizedBox(height: 10,),
                        Container(width: size.width,
                          child: Row(
                            children: [
                              Container(
                                width: 25,
                                height: 25,
                                alignment: Alignment.center,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(5),
                                  color: Colors.white,
                                ),
                                child: Icon(Icons.account_circle_outlined,size: 20,color:Color(0xffED1C24),)
                              ),
                              SizedBox(width: 3),
                              Container(color: Colors.white,
                                height: 15,
                                width: 2,
                              ),
                              SizedBox(width: 5,),
                              Text("Company Name", style: TextStyle(color: Colors.white),)
                            ],
                          ),
                        ),
                        Image.asset("assets/images/dotted_border.png", width: size.width * 0.8,),
                        SizedBox(height: 10,),
                        Container(width: size.width,
                          child: Row(
                            children: [
                              Container(
                                width: 25,
                                height: 25,
                                alignment: Alignment.center,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(5),
                                  color: Colors.white,
                                ),
                                child: Icon(Icons.alternate_email,size: 20,color: Color(0xffED1C24),),),
                              SizedBox(width: 3),
                              Container(color: Colors.white,
                                height: 15,
                                width: 2,
                              ),
                              SizedBox(width: 5,),
                              Text("Company Email: Fortline@gmail.com", style: TextStyle(color: Colors.white),)
                            ],
                          ),
                        ),

                      ],
                    ),
                  )
                ],
              ),
            ),
            SizedBox(height: 10,),
            InkWell(
              onTap: (){
                Navigator.pushReplacement(context, PageTransition(child: const TermsConditionScreen(), type: PageTransitionType.rightToLeft));
              },
              child: Container(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                width: size.width * 0.9,
                height: size.height * 0.06,
                decoration: BoxDecoration(
                    color: MyConstants.INPUT_BOX_RED_COLOR,
                    borderRadius: BorderRadius.circular(10)
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [Row(
                  children: [
                    Image.asset("assets/images/pro_agreement.png", width: 20, height: 20,),
                    SizedBox(width: 5,),
                    Container(color: Colors.white,
                      height: 15,
                      width: 2,
                    ),
                    const SizedBox(width: 5,),
                    const Text("Terms & Conditions", style: TextStyle(color: Colors.white),),
                  ],
                  ),
                    const Icon(Icons.chevron_right, size: 30, color: Colors.white,)
                  ],
                ),
              ),
            ),
            SizedBox(height: 10,),
            InkWell(
              onTap: (){
                Navigator.pushReplacement(context, PageTransition(child: PrivacyPolicyScreen(), type: PageTransitionType.rightToLeft));
              },
              child: Container(
                padding: EdgeInsets.symmetric(horizontal: 10),
                width: size.width * 0.9,
                height: size.height * 0.06,
                decoration: BoxDecoration(
                    color: MyConstants.INPUT_BOX_RED_COLOR,
                    borderRadius: BorderRadius.circular(10)
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [Row(
                    children: [
                      Image.asset("assets/images/pro_compliant.png", width: 20, height: 20,),
                      SizedBox(width: 5,),
                      Container(color: Colors.white,
                        height: 15,
                        width: 2,
                      ),
                      SizedBox(width: 5,),
                      Text("Privacy & Policy", style: TextStyle(color: Colors.white),),
                    ],
                  ),
                    Icon(Icons.chevron_right, size: 30, color: Colors.white,)
                  ],
                ),
              ),
            ),
            SizedBox(height: 10,),
            InkWell(
              onTap: (){
                Navigator.pushReplacement(context, PageTransition(child: WelcomeScreen(), type: PageTransitionType.rightToLeft));
              },
              child: Container(
                padding: EdgeInsets.symmetric(horizontal: 10),
                width: size.width * 0.9,
                height: size.height * 0.06,
                decoration: BoxDecoration(
                    color: MyConstants.INPUT_BOX_RED_COLOR,
                    borderRadius: BorderRadius.circular(10)
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [Row(
                    children: [
                      Image.asset("assets/images/logout.png", width: 20, height: 20,),
                      SizedBox(width: 5,),
                      Container(color: Colors.white,
                        height: 15,
                        width: 2,
                      ),
                      SizedBox(width: 5,),
                      Text("LOG OUT", style: TextStyle(color: Colors.white),),
                    ],
                  ),
                    Icon(Icons.chevron_right, size: 30, color: Colors.white,)
                  ],
                ),
              ),
            )
          ],
        ),
      ))
      ]
    )
    )
    )
    ;
  }
}
