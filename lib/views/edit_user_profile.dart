import 'package:flutter/material.dart';
import 'package:flutter_custom_clippers/flutter_custom_clippers.dart';
import 'package:official_fortline_app/utils/utils.dart';
import 'package:official_fortline_app/views/constants/constants.dart';
import 'package:official_fortline_app/views/profile.dart';
import 'package:official_fortline_app/views/widgets/bottom_navigation_bar.dart';
import 'package:badges/badges.dart' as badges;
import 'package:official_fortline_app/views/widgets/profile_pic.dart';
import 'package:page_transition/page_transition.dart';

class EditUserProfile extends StatefulWidget {
  const EditUserProfile({Key? key}) : super(key: key);

  @override
  State<EditUserProfile> createState() => _EditUserState();
}

class _EditUserState extends State<EditUserProfile> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      resizeToAvoidBottomInset: false,
    body: Container(
        width: size.width,
        height: size.height,
        decoration: BoxDecoration(
        image: DecorationImage(
        image: AssetImage("assets/images/edit profile.png"),
        fit: BoxFit.fill
        )
        ),
        child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(height: size.height * 0.045,),
        Padding(
        padding: const EdgeInsets.only(left: 8, top: 30),
        child: Row(
        children: [
        Image.asset("assets/images/fortline_logo_white.png",
        height: 25,
        ),
        SizedBox(width: size.width * 0.6,),
        Icon(Icons.notifications_none, size: 20, color: Colors.white,),

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
            Navigator.pushReplacement(context, PageTransition(child: const UserProfile(), type: PageTransitionType.leftToRight));
          },
          child: Padding(
          padding: const EdgeInsets.only(left: 8.0, top: 10),
          child: Image.asset("assets/images/back_button.png", width: 25, height: 25,),
          ),
        ),
        SizedBox(width: size.width * 0.25,),
        const Expanded(child: Padding(
        padding: EdgeInsets.only(top: 15.0),
        child: Text("MY ACCOUNT",
        style: TextStyle(color: Colors.white,
        fontSize: 16,
        fontWeight: FontWeight.w600
        ),
        ),
        ),),
        ],
        ),
          SizedBox(height: size.height * 0.01,),
          Container(
            alignment: Alignment.center,
            width: size.width,
            child: ProfilePicture(),
          ),
          SizedBox(height: size.height * 0.02,),
          Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 15.0),
                  child: badges.Badge(
                    position: badges.BadgePosition.bottomEnd(bottom: -16),
                    badgeStyle: badges.BadgeStyle(
                      badgeColor: Colors.transparent
                    ),
                    badgeContent: InkWell(
                      onTap: (){

                      },
                      child: Container(
                        width: 90,
                        height: 30,
                        decoration: BoxDecoration(
                          color: Colors.black,
                          borderRadius: BorderRadius.circular(20)
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Image.asset("assets/images/save.png", width: 20, height: 20,),
                            SizedBox(width: 3,),
                            Text("SAVE", style: TextStyle(color: Colors.white),)
                          ],
                        ),
                      ),
                    ),
                    child:Container(
                            width: size.width,
                            height: size.height * 0.63,
                            decoration: BoxDecoration(
                              color: MyConstants.INPUT_BOX_RED_COLOR,
                              borderRadius: BorderRadius.only(bottomLeft: Radius.circular(25))
                            ),
                            child: Form(
                                  child: Padding(
                                    padding: const EdgeInsets.symmetric(horizontal: 8.0),
                                    child: ListView(
                                      padding: EdgeInsets.zero,
                                      children: [
                                        Text("Full Name:", style: TextStyle(
                                          color: Colors.white
                                        ),
                                        ),
                                        Container(
                                          width: size.width,
                                          height: 40,
                                          decoration: BoxDecoration(
                                            borderRadius: BorderRadius.circular(10),
                                            color: Colors.white
                                          ),
                                          child: Padding(
                                            padding: const EdgeInsets.only(left: 8.0),
                                            child: TextFormField(
                                              decoration: InputDecoration(
                                                prefixIcon: Padding(
                                                  padding: const EdgeInsets.only(right: 8.0),
                                                  child: Image.asset("assets/images/full_name.png"),
                                                ),
                                                hintText: "Full Name",
                                                border: InputBorder.none,
                                                prefixIconConstraints: BoxConstraints(
                                                  maxWidth: 30,
                                                  maxHeight: 30
                                                )
                                              ),
                                            ),
                                          ),
                                        ),
                                        Text("Email:", style: TextStyle(
                                            color: Colors.white
                                        ),
                                        ),
                                        Container(
                                          width: size.width,
                                          height: 40,
                                          decoration: BoxDecoration(
                                              borderRadius: BorderRadius.circular(10),
                                              color: Colors.white
                                          ),
                                          child: Padding(
                                            padding: const EdgeInsets.only(left: 8.0),
                                            child: TextFormField(
                                              decoration: InputDecoration(
                                                  prefixIcon: Padding(
                                                    padding: const EdgeInsets.only(right: 8.0),
                                                    child: Image.asset("assets/images/mail.png"),
                                                  ),
                                                  hintText: "Email",
                                                  border: InputBorder.none,
                                                  prefixIconConstraints: BoxConstraints(
                                                      maxWidth: 30,
                                                      maxHeight: 30
                                                  )
                                              ),
                                            ),
                                          ),
                                        ),
                                        Text("Phone:", style: TextStyle(
                                            color: Colors.white
                                        ),
                                        ),
                                        Container(
                                          width: size.width,
                                          height: 40,
                                          decoration: BoxDecoration(
                                              borderRadius: BorderRadius.circular(10),
                                              color: Colors.white
                                          ),
                                          child: Padding(
                                            padding: const EdgeInsets.only(left: 8.0),
                                            child: TextFormField(
                                              decoration: InputDecoration(
                                                  prefixIcon: Padding(
                                                    padding: const EdgeInsets.only(right: 8.0),
                                                    child: Image.asset("assets/images/phone.png"),
                                                  ),
                                                  hintText: "Phone",
                                                  border: InputBorder.none,
                                                  prefixIconConstraints: BoxConstraints(
                                                      maxWidth: 30,
                                                      maxHeight: 30
                                                  )
                                              ),
                                            ),
                                          ),
                                        ),
                                        Text("Password:", style: TextStyle(
                                            color: Colors.white
                                        ),
                                        ),
                                        Container(
                                          width: size.width,
                                          height: 40,
                                          decoration: BoxDecoration(
                                              borderRadius: BorderRadius.circular(10),
                                              color: Colors.white
                                          ),
                                          child: Padding(
                                            padding: const EdgeInsets.only(left: 8.0),
                                            child: TextFormField(
                                              decoration: InputDecoration(
                                                  prefixIcon: Padding(
                                                    padding: const EdgeInsets.only(right: 8.0),
                                                    child: Image.asset("assets/images/password.png"),
                                                  ),
                                                  hintText: "Password",
                                                  border: InputBorder.none,
                                                  prefixIconConstraints: BoxConstraints(
                                                      maxWidth: 30,
                                                      maxHeight: 30
                                                  )
                                              ),
                                            ),
                                          ),
                                        ),
                                        Text("Confirm Password:", style: TextStyle(
                                            color: Colors.white
                                        ),
                                        ),
                                        Container(
                                          width: size.width,
                                          height: 40,
                                          decoration: BoxDecoration(
                                              borderRadius: BorderRadius.circular(10),
                                              color: Colors.white
                                          ),
                                          child: Padding(
                                            padding: const EdgeInsets.only(left: 8.0),
                                            child: TextFormField(
                                              decoration: InputDecoration(
                                                  prefixIcon: Padding(
                                                    padding: const EdgeInsets.only(right: 8.0),
                                                    child: Image.asset("assets/images/confirm_password.png"),
                                                  ),
                                                  hintText: "Confirm Password",
                                                  border: InputBorder.none,
                                                  prefixIconConstraints: BoxConstraints(
                                                      maxWidth: 30,
                                                      maxHeight: 30
                                                  )
                                              ),
                                            ),
                                          ),
                                        ),
                                        Text("Address:", style: TextStyle(
                                            color: Colors.white
                                        ),
                                        ),
                                        Container(
                                          width: size.width,
                                          height: 40,
                                          decoration: BoxDecoration(
                                              borderRadius: BorderRadius.circular(10),
                                              color: Colors.white
                                          ),
                                          child: Padding(
                                            padding: const EdgeInsets.only(left: 8.0),
                                            child: TextFormField(
                                              decoration: InputDecoration(
                                                  prefixIcon: Padding(
                                                    padding: const EdgeInsets.only(right: 8.0),
                                                    child: Image.asset("assets/images/address.png"),
                                                  ),
                                                  hintText: "Address",
                                                  border: InputBorder.none,
                                                  prefixIconConstraints: BoxConstraints(
                                                      maxWidth: 30,
                                                      maxHeight: 30
                                                  )
                                              ),
                                            ),
                                          ),
                                        )
                                      ],
                                    ),
                                  ),
                                ),
                          ),
                      ),
                  ),
        ]
        )
        ),
    );
  }
  @override
  void initState() {
    // TODO: implement initState
   // Utils.hideStatusbar();
    super.initState();
  }
}
