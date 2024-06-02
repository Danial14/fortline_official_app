import 'package:flutter/material.dart';
import 'package:official_fortline_app/views/profile.dart';
import 'package:page_transition/page_transition.dart';

class TermsConditionScreen extends StatefulWidget {
  const TermsConditionScreen({Key? key}) : super(key: key);

  @override
  State<TermsConditionScreen> createState() => _TermsConditionScreenState();
}

class _TermsConditionScreenState extends State<TermsConditionScreen> {



  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height * 1;
    final width = MediaQuery.of(context).size.width * 1;
    return Scaffold(
      body: Container(
            height: height * 1,
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage('assets/images/privacypolicy.png'),
                fit: BoxFit.fill,
              ),
            ),
            child: Column(
              children: [
                SizedBox(height: height * 0.043,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Align(
                        alignment: Alignment.topLeft,
                        child: Image.asset('assets/images/Fortline-logo-white.png',height: 25,),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        children: [
                          const Icon(Icons.notifications_none,color: Colors.white,size: 20,),
                          InkWell(
                              onTap: (){
                                Navigator.pushReplacement(context, PageTransition(child: const UserProfile(),
                                    type: PageTransitionType.rightToLeft));
                              },
                              child: Image.asset('assets/images/user.png',height: 20,color: Colors.white,))
                        ],
                      ),
                    )
                  ],
                ),
                Row(
                  children: [
                    InkWell(
                      onTap: (){
                        Navigator.pushReplacement(context, PageTransition(child: const UserProfile(),
                            type: PageTransitionType.leftToRight));
                      },
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Align(
                            alignment: Alignment.topLeft,
                            child: Image.asset('assets/images/back-button.png',height: 25,)
                        ),
                      ),
                    ),
                    SizedBox(width: width * 0.2,),
                    const Text('TERMS & CONDITION',style: TextStyle(
                        color: Colors.white,
                        fontSize: 16,
                        fontWeight: FontWeight.w600
                    ),),

                  ],
                ),
                SizedBox(height: height * 0.016,),
                Container(
                  height: height * 0.8,
                  child: ListView(
                    padding: EdgeInsets.zero,
                     children: [
                       Padding(
                         padding: const EdgeInsets.only(left: 8.0,right: 8.0),
                         child: Container(
                           height: height * 0.3 ,
                           child: const Text('Lorem ipsum dolor sit amet, consetetur sadipscing elitr, sed diam nonumy eirmod tempor invidunt ut labore et dolore magna aliquyam erat, sed diam voluptua. At vero eos et accusam et justo duo dolores et ea rebum. Stet clita kasd gubergren, no sea takimata sanctus est Lorem ipsum dolor sit amet. Lorem ipsum dolor sit amet, consetetur sadipscing elitr, sed diam nonumy eirmod tempor invidunt ut labore et dolore magna aliquyam erat, sed diam voluptua. At vero eos et accusam et justo duo dolores et ea rebum. Stet clita kasd gubergren, no sea takimata sanctus est Lorem ipsum dolor sit amet.',
                             style: TextStyle(
                                 fontSize: 13
                             ),),
                         ),
                       ),
                       SizedBox(height: height * 0.03,),
                       Padding(
                         padding: const EdgeInsets.only(left: 8.0,right: 8.0),
                         child: Container(
                           height: height * 0.5 ,
                           child: const Text('Lorem ipsum dolor sit amet, consetetur sadipscing elitr, sed diam nonumy eirmod tempor invidunt ut labore et dolore magna aliquyam erat, sed diam voluptua. At vero eos et accusam et justo duo dolores et ea rebum. Stet clita kasd gubergren, no sea takimata sanctus est Lorem ipsum dolor sit amet. Lorem ipsum dolor sit amet, consetetur sadipscing elitr, sed diam nonumy eirmod tempor invidunt ut labore et dolore magna aliquyam erat, sed diam voluptua. At vero eos et accusam et justo duo dolores et ea rebum. Stet clita kasd gubergren, no sea takimata sanctus est Lorem ipsum dolor sit amet.Lorem ipsum dolor sit amet, consetetur sadipscing elitr, sed diam nonumy eirmod tempor invidunt ut labore et dolore magna aliquyam erat, sed diam voluptua. At vero eos et accusam et justo duo dolores et ea rebum. Stet clita kasd gubergren, no sea takimata sanctus est Lorem ipsum dolor sit amet. Lorem ipsum dolor sit amet, consetetur sadipscing',
                             style: TextStyle(
                                 fontSize: 13
                             ),),
                         ),
                       ),
                     ],

                  ),
                ),



              ],
            ),
          ),


    );
  }
}
