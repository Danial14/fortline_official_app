import 'dart:async';
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_custom_clippers/flutter_custom_clippers.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:official_fortline_app/models/consultant_model.dart';
import 'package:official_fortline_app/view_models/consultant_viewmodel.dart';
import 'package:official_fortline_app/views/profile.dart';
import 'package:official_fortline_app/views/widgets/bottom_navigation_bar.dart';
import 'package:page_transition/page_transition.dart';
import 'package:provider/provider.dart';
import 'package:url_launcher/url_launcher.dart' as UrlLauncher;

class ConsultantScreen extends StatefulWidget {
  const ConsultantScreen({Key? key}) : super(key: key);

  @override
  State<ConsultantScreen> createState() => _ConsultantScreenState();
}

class _ConsultantScreenState extends State<ConsultantScreen> {

  final Uri _url = Uri.parse('tel://021111992999');
  Future<ConsultantModel>? consultanFuture;

  @override
  void initState() {
    // TODO: implement initState
    Future.delayed(Duration.zero,(){
      consultanFuture = Provider.of<ConsultantViewModel>(context,listen: false).fetchConsultantRepo();
    setState(() {

    });

    });
    super.initState();
  }
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
                  SizedBox(height: height * 0.05,),
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
                  const Text('CONSULT WITH OUT TEAM',style: TextStyle(
                          color: Colors.white,
                          fontSize: 16,
                          fontWeight: FontWeight.w600
        
                      ),),
                    SizedBox(height: height * 0.03,),
        
                  Container(
                    height: height * 0.76,
                    width: width,
                    child: FutureBuilder<ConsultantModel>(
                      future: consultanFuture,
                      builder: (context,AsyncSnapshot snapshot){
                        if(snapshot.connectionState == ConnectionState.waiting || !snapshot.hasData){
                          return const Center(
                            child: SpinKitFadingCircle(
                              color: Color(0xffED1C24),
                              size: 40,
                            ),
                          );
                        }
                        else{
                          return Consumer<ConsultantViewModel>(
                            builder: (context,value,child){
                              return snapshot.data!.items!.length == 0 ?
                                  Center(child: Text('No Team Member Has Found',style: TextStyle(
                                    fontWeight: FontWeight.w400,
                                    color: Colors.black,
                                    fontSize: 18
                                  ),),
                                  ) : GridView.builder(
                                  shrinkWrap: true,
                                  padding: EdgeInsets.zero,
                                  gridDelegate:  const SliverGridDelegateWithFixedCrossAxisCount(
                                      crossAxisCount: 3, // number of items in each row
                                      mainAxisSpacing: 8.0, // spacing between rows
                                      crossAxisSpacing: 8.0,
                                      childAspectRatio: 6/8
                                  ),
                                  itemCount: snapshot.data!.items!.length,
                                  itemBuilder: (context,index){
                                    var blob = snapshot.data!.items[index]!.consultantPicture;
                                    final Uri _consultantCall = Uri.parse('tel://${snapshot.data!.items[index]!.consultantPhone}');
                                    final whatsappUrl =
                                        Uri.parse("whatsapp://send?phone=${snapshot.data!.items[index]!.consultantPhone}");
                                    final mailUri = Uri.parse('mailto:${snapshot.data!.items[index]!.consultantEmail}?subject=&body=');
                                    return Padding(
                                      padding: const EdgeInsets.only(left: 8.0,right: 8.0,bottom: 8.0),
                                      child: ClipRRect(
                                        borderRadius: const BorderRadius.only(
                                            topLeft: Radius.circular(12.0),
                                            topRight: Radius.circular(12.0),
                                            bottomLeft: Radius.circular(4.0),
                                            bottomRight: Radius.circular(30.0)
                                        ),

                                        child: Container(
                                          height: height * 0.3,
                                          width: width * 0.3,
                                          decoration: const BoxDecoration(
                                            color: Color(0xffED1C24),
                                          ),
                                          child: Column(

                                            children: [
                                              SizedBox(height: height * 0.012,),
                                              Container(
                                                alignment: Alignment.center,
                                                width: width,
                                                child: ClipPath(
                                                  clipper: HexagonalClipper(),
                                                  child: Container(
                                                    width: width * 0.25,
                                                    height: height * 0.08,
                                                    decoration:  BoxDecoration(
                                                        color: Colors.grey,
                                                        image: DecorationImage(
                                                          image: blob != null ? MemoryImage(base64Decode(blob)) as ImageProvider : AssetImage('assets/images/user_av.png') as ImageProvider, //fit: BoxFit.cover

                                                        )

                                                    ),
                                                  ),
                                                ),
                                              ),
                                              SizedBox(height: height * 0.01,),
                                              Text(snapshot.data.items[index]!.consultantName,style: TextStyle(
                                                color: Colors.white,
                                                fontSize: 10,
                                              ),),
                                              Text(snapshot.data.items[index]!.consultantDesigination,style: TextStyle(
                                                color: Colors.white,
                                                fontSize: 6,
                                              ),),

                                              Row(
                                                crossAxisAlignment: CrossAxisAlignment.center,
                                                mainAxisAlignment: MainAxisAlignment.center,
                                                children: [
                                                  InkWell(
                                                    onTap: (){
                                                      UrlLauncher.launchUrl(_consultantCall);
                                                    },
                                                    child: Padding(
                                                      padding: const EdgeInsets.all(4.0),
                                                      child: ClipRRect(
                                                        borderRadius: const BorderRadius.only(
                                                            topRight: Radius.circular(8.0),
                                                            bottomLeft: Radius.circular(8.0)
                                                        ),
                                                        child: Container(
                                                          height: height * 0.04,
                                                          width: width * 0.06,
                                                          decoration: const BoxDecoration(
                                                            color: Colors.white,
                                                          ),
                                                          child: Padding(
                                                            padding: const EdgeInsets.all(4.0),
                                                            child: Image.asset('assets/images/phone-call.png',
                                                              color: const Color(0xffED1C24),),
                                                          ),
                                                        ),
                                                      ),
                                                    ),
                                                  ),
                                                  InkWell(
                                                    onTap: (){
                                                      UrlLauncher.launchUrl(mailUri);

                                                    },
                                                    child: Padding(
                                                      padding: const EdgeInsets.all(4.0),
                                                      child: ClipRRect(
                                                        borderRadius: const BorderRadius.only(
                                                            topRight: Radius.circular(8.0),
                                                            bottomLeft: Radius.circular(8.0)
                                                        ),
                                                        child: Container(
                                                          height: height * 0.04,
                                                          width: width * 0.06,
                                                          decoration: const BoxDecoration(
                                                            color: Colors.white,
                                                          ),
                                                          child: Padding(
                                                            padding: const EdgeInsets.all(4.0),
                                                            child: Image.asset('assets/images/email.png',
                                                              color: const Color(0xffED1C24),),
                                                          ),
                                                        ),
                                                      ),
                                                    ),
                                                  ),
                                                  InkWell(
                                                    onTap: (){
                                                      UrlLauncher.launchUrl(whatsappUrl);

                                                    },
                                                    child: Padding(
                                                      padding: const EdgeInsets.all(4.0),
                                                      child: ClipRRect(
                                                        borderRadius: const BorderRadius.only(
                                                            topRight: Radius.circular(8.0),
                                                            bottomLeft: Radius.circular(8.0)
                                                        ),
                                                        child: Container(
                                                          height: height * 0.04,
                                                          width: width * 0.06,
                                                          decoration: const BoxDecoration(
                                                            color: Colors.white,
                                                          ),
                                                          child: Padding(
                                                            padding: const EdgeInsets.all(4.0),
                                                            child: Image.asset('assets/images/whatsapp.png',
                                                              color: const Color(0xffED1C24),
                                                            ),
                                                          ),
                                                        ),
                                                      ),
                                                    ),
                                                  )
                                                ],
                                              ),

                                            ],
                                          ),
                                        ),
                                      ),
                                    );
                                  });
                            },
                          );
                        }
                      },
                    ),



                  ),
                  SizedBox(height: height * 0.01,),

        
                ],
              ),
            ),


      floatingActionButton: InkWell(
        onTap: (){
          UrlLauncher.launchUrl(_url);
        },
        child: ClipRRect(
              borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(12),
                topRight: Radius.circular(12),
                bottomLeft: Radius.circular(12),
              ),
              child: Container(
                height: height * 0.05,
                width: width * 0.6,
                decoration: const BoxDecoration(
                    color: Color(0xffED1C24)
                ),
                child: Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Image.asset('assets/images/telephone.png',color: Colors.white,height: 25,),
                    ),
                    const Text('Feel Free To Contact Us',style: TextStyle(color: Colors.white),)
                  ],
                ),
              ),
            ),
      ),


      bottomNavigationBar: BottomNavigationBarWidget("Team"),
    );

  }
}
