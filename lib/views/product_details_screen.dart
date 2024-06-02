import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:official_fortline_app/views/products.dart';
import 'package:official_fortline_app/views/profile.dart';
import 'package:official_fortline_app/views/support.dart';
import 'package:official_fortline_app/views/widgets/bottom_navigation_bar.dart';
import 'package:page_transition/page_transition.dart';

class ProductDetailScreen extends StatefulWidget {
  const ProductDetailScreen({Key? key}) : super(key: key);

  @override
  State<ProductDetailScreen> createState() => _ProductDetailScreenState();
}

class _ProductDetailScreenState extends State<ProductDetailScreen> {
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
            SizedBox(height: height * 0.045,),
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
            Center(
              child: Row(
                children: [
                  InkWell(
                    onTap: (){
                      Navigator.pushReplacement(context, PageTransition(child: const Products(),type: PageTransitionType.leftToRight));

                    },
                    child: Padding(
                      padding: const EdgeInsets.only(left: 8.0,bottom: 8.0),
                      child: Align(
                          alignment: Alignment.topLeft,
                          child: Image.asset('assets/images/back-button.png',height: 25,)
                      ),
                    ),
                  ),
                  SizedBox(width: width * 0.25,),
                  const Text('PRODUCT DETAIL',style: TextStyle(
                      color: Colors.white,
                      fontSize: 18,
                      fontWeight: FontWeight.w600
                  ),),


                ],
              ),
            ),
            Container(
              height: height * 0.77,
              width: width,

              child: FutureBuilder(
                future: _resolveData(),
                builder: (context,snapshot){
                  return Stack(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(left: 8.0,right: 8.0,top: 8.0,bottom: 20.0),
                        child: Align(
                          alignment: Alignment.bottomCenter,
                          child: ClipRRect(
                            borderRadius: const BorderRadius.only(
                                topLeft: Radius.circular(15),
                                topRight: Radius.circular(15),
                                bottomRight: Radius.circular(15)),
                            child: Container(
                              height: height * 0.5,
                              width: width * 1,
                              decoration: const BoxDecoration(
                                  image: DecorationImage(
                                    image: AssetImage('assets/images/productBox.png'),
                                    fit: BoxFit.fill,

                                  )
                              ),
                              child: Column(
                                children: [
                                  SizedBox(height: height * 0.09,),
                                  const Text('Lenovo V15 ',style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 40,
                                      fontWeight: FontWeight.w600
                                  ),),
                                  const Text('Available In Stock ',style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 14,
                                      fontWeight: FontWeight.w300
                                  ),),
                                  SizedBox(height: height * 0.02,),
                                  const Text('Product Discription ',style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 20,
                                      fontWeight: FontWeight.w300
                                  ),),
                                  const Text('------------------- ',style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 20,
                                      fontWeight: FontWeight.w300
                                  ),),
                                  SizedBox(height: height * 0.02,),
                                  const Text('intel Core i3 -1215U 12th Generation | 4GB  ',style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 14,
                                      fontWeight: FontWeight.w300
                                  ),),
                                  const Text('+16GB RAM DDR4 | 2s6GB SSD I 15.6"Display I   ',style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 14,
                                      fontWeight: FontWeight.w300
                                  ),),
                                  const Text('DOS I Backpack  ',style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 14,
                                      fontWeight: FontWeight.w300
                                  ),),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(20.0),
                        child: Align(
                          alignment: Alignment.topCenter,
                          child: Container(
                            height: height * 0.3,
                            width: width * 1,
                            decoration: const BoxDecoration(
                                image: DecorationImage(
                                  image: AssetImage('assets/images/productImage.png'),
                                  fit: BoxFit.fill,
                                )
                            ),
                          ),
                        ),
                      ),

                    ],
                  );
                },

              ),
            ),




          ],
        ),
      ),


    );
  }
  Future<int> _resolveData() async{
    return 0;
  }
}
