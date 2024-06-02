import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:official_fortline_app/utils/utils.dart';
import 'package:official_fortline_app/views/widgets/home_complaints_list.dart';
import 'package:official_fortline_app/views/widgets/home_invoices_list.dart';
import 'package:official_fortline_app/views/widgets/home_products_list.dart';
import 'package:official_fortline_app/views/my_invoices.dart';
import 'package:official_fortline_app/views/products.dart';
import 'package:official_fortline_app/views/profile.dart';
import 'package:official_fortline_app/views/promo_screen.dart';
import 'package:official_fortline_app/views/support.dart';
import 'package:official_fortline_app/views/widgets/bottom_navigation_bar.dart';
import 'package:official_fortline_app/views/widgets/complaint_card.dart';
import 'package:official_fortline_app/views/widgets/product_card.dart';
import 'package:page_transition/page_transition.dart';

import 'constants/constants.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  List imgList = ["assets/images/slide.png"];
  CarouselController carouselController = CarouselController();

  int currentIndex = 0;

  ScrollController _categoryScrollController = ScrollController();
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Scaffold(
      bottomNavigationBar: BottomNavigationBarWidget("Home"),
      body: Container(
              width: size.width,
              height: size.height,
              decoration: const BoxDecoration(
                image: DecorationImage(
                  image: AssetImage("assets/images/home_back.png"),
                  fit: BoxFit.fill,
                )
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.only( top: 30, right: 6),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Image.asset("assets/images/fortline_logo_white.png",
                          height: 25,
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Row(
                            children: [
                              const Icon(Icons.notifications_none, size: 20, color: Colors.white,),
                              InkWell(
                                  onTap: (){
                                    Navigator.pushReplacement(context, PageTransition(child: const UserProfile(), type: PageTransitionType.rightToLeft));
                                  },
                                  child: Image.asset("assets/images/user.png", height: 20, color: Colors.white,)),

                            ],
                          ),
                        )
                        ],
                    ),
                  ),
                  Padding(padding: EdgeInsets.only(left: size.width * 0.2, top: 10),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                       const Padding(
                         padding: EdgeInsets.only(left: 16.0),
                         child: Text("Welcome,",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 18
                          ),
                          ),
                       ),

                      const SizedBox(width: 2,),
                      Text(MyConstants.getUsername == null ? "Home" : MyConstants.getUsername!,
                        style: TextStyle(color: Colors.white,
                        fontSize: 12,
                        ),
                        ),
                      SizedBox(width: size.width * 0.22,),
                      const Padding(
                        padding: EdgeInsets.only(right: 15),
                        child: CircleAvatar(
                          radius: 15,
                          child: Icon(Icons.person,),
                        ),
                      )
                    ],
                  ),
                  ),
                  Expanded(
                    child: FutureBuilder<bool>(
                      future: _homeData(),
                      builder: (context, snapshot) {
                        return Container(
                          width: size.width,
                          child: Column(
                            children: [
                              InkWell(
                                        onTap: (){},
                                        child: CarouselSlider.builder(itemCount: imgList.length, itemBuilder: (ctx, pos, _){
                                          print("item $pos $_");
                                          return Container(
                                              width: MediaQuery.of(context).size.width,
                                              margin: const EdgeInsets.symmetric(horizontal: 5.0, vertical: 5),
                                           child: Image.asset(imgList[pos]),
                                          );
                                        }, options: CarouselOptions(
                                          autoPlay: true,
                                          aspectRatio: 1.6,
                                          viewportFraction: 0.9,
                                          onPageChanged: (index, reason) {
                                            currentIndex = index;
                                          },
                                        ),),
                                      ),
                              Expanded(
                                child: Container(
                                  alignment: Alignment.topLeft,
                                  //color: Colors.green,
                                  width: size.width,
                                  child: ListView(
                                    padding: EdgeInsets.zero,
                                    children: [
                                      Padding(
                                        padding: const EdgeInsets.symmetric(horizontal: 8.0),
                                        child: Row(
                                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                          children: [Image.asset("assets/images/invoices_head.png", width: 100, height: 50,)

                                          ],
                                        ),
                                      ),
                                      //HomeInvoicesList(),
                                      Container(
                                        width: size.width,
                                        height: size.height * 0.13,
                                        child: Stack(
                                          children: [
                                            Container(
                                              width: size.width,
                                              height: size.height * 0.13,
                                              child: ListView.builder(controller: _categoryScrollController,
                                                itemBuilder: (ctx, position){
                                                return InkWell(
                                                  onTap: (){
                                                    Navigator.pushReplacement(context, PageTransition(child: const MyInvoices(), type: PageTransitionType.rightToLeft));

                                                  },
                                                  child: Padding(
                                                    padding: const EdgeInsets.only(right: 5.0, left: 5),
                                                    child: Container(
                                                     // height: size.height * 0.18,
                                                      width: size.width * 0.47,
                                                      decoration: BoxDecoration(
                                                        color: MyConstants.INPUT_BOX_RED_COLOR,
                                                        borderRadius: BorderRadius.circular(10),
                                                        boxShadow: [
                                                          BoxShadow(
                                                            color: Colors.grey.withOpacity(0.5),
                                                            blurRadius: 4,
                                                            offset: Offset(4, 8), // Shadow position
                                                          ),
                                                        ],
                                                      ),
                                                      child: Row(
                                                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                        crossAxisAlignment: CrossAxisAlignment.start,
                                                        children: [
                                                          const Padding(
                                                            padding: EdgeInsets.symmetric(vertical: 10, horizontal: 10),
                                                            child: Column(
                                                              crossAxisAlignment: CrossAxisAlignment.start,
                                                              children: [
                                                                Text("TOTAL\nINVOICES", style: TextStyle(
                                                                    color: Colors.white,
                                                                    fontSize: 15
                                                                ),),
                                                                Text("05", style: TextStyle(
                                                                    color: Colors.white,
                                                                    fontSize: 17,
                                                                    fontWeight: FontWeight.w700
                                                                ),),
                                                              ],
                                                            ),
                                                          ),
                                                          ClipRRect(
                                                            borderRadius: const BorderRadius.only(topRight: Radius.circular(10)),
                                                            child: Image.asset("assets/images/tot_invoice.png", height: 70,),
                                                          )
                                                        ],
                                                      ),
                                                    ),
                                                  ),
                                                );
                                              },
                                                itemCount: 4,
                                                scrollDirection: Axis.horizontal,
                                              ),
                                            ),
                                            Container(
                                              width: size.width,
                                              height: size.height * 0.13,
                                              child: Row(
                                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                children: [
                                                  InkWell(onTap: (){
                                                    _categoryScrollController.animateTo(MediaQuery.of(context).size.width * 0.1, duration: Duration(seconds: 1), curve: Curves.easeInOut);
                                                  },child: Icon(Icons.arrow_back_ios_new, color: Colors.grey.shade500,
                                                  size: 20
                                                  )
                                                  ),

                                                  InkWell(onTap: (){
                                                    _categoryScrollController.animateTo(MediaQuery.of(context).size.width * 0.9, duration: Duration(seconds: 1), curve: Curves.easeInOut);
                                                  },child: Icon(Icons.arrow_back_ios_new, textDirection: TextDirection.rtl,
                                                    color: Colors.grey.shade500,
                                                  size: 20,
                                                  )
                                                  ),
                                                ],
                                              ),
                                            )
                                          ],
                                        ),
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.symmetric(horizontal: 8.0),
                                        child: Row(
                                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                          children: [Image.asset("assets/images/complaints_head.png", width: 130, height: 50,),
                                           TextButton(
                                                onPressed: (){
                                                  Navigator.pushReplacement(context, PageTransition(child: const Support(), type: PageTransitionType.rightToLeft));

                                                },
                                                child: const Text("View All", style: TextStyle(
                                                  color: Colors.grey
                                                ),),
                                              ),

                                          ],
                                        ),
                                      ),
                                      HomeComplaintsList(),
                                      Padding(
                                        padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 5),
                                        child: Row(
                                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                          children: [Image.asset("assets/images/product_head.png", width: 130, height: 50,),
                                            TextButton(
                                                onPressed: (){
                                                  Navigator.pushReplacement(context, PageTransition(child: const Products(), type: PageTransitionType.rightToLeft));

                                                },
                                                child: const Text("Shop All",
                                                style: TextStyle(color: Colors.grey),
                                                ),
                                              ),

                                          ],
                                        ),
                                      ),
                                      HomeProductsList(),
                                      Container(
                                            width: size.width,
                                            height: size.height * 0.15,
                                            child: ListView.builder(itemBuilder: (ctx, position){
                                              return Container(
                                                  width: size.width * 0.45,
                                                  child:
                                              Padding(
                                                padding: const EdgeInsets.only(right: 5, left: 5),
                                                child: Image.asset(MyConstants.brandImages[position],),));
                                            },
                                              itemCount: MyConstants.brandImages.length,
                                              scrollDirection: Axis.horizontal,
                                              padding: EdgeInsets.zero,
                                            )
                                        ),
                                    ],
                                  ),
                                ),
                              )

                            ],

                          ),
                        );
                      }
                    ),
                  ),
                ],
              ),
            ),
    );
  }
  @override
  void initState() {
    // TODO: implement initState
    //Utils.hideStatusbar();
    super.initState();
  }
  Future<bool> _homeData() async{
    return true;
  }
}
