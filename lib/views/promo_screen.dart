import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:official_fortline_app/models/promo_model.dart';
import 'package:official_fortline_app/view_models/promo_viewmodel.dart';
import 'package:official_fortline_app/views/profile.dart';
import 'package:official_fortline_app/views/widgets/bottom_navigation_bar.dart';
import 'package:page_transition/page_transition.dart';
import 'package:provider/provider.dart';
import 'dart:convert';

class PromoScreen extends StatefulWidget {
  const PromoScreen({Key? key}) : super(key: key);

  @override
  State<PromoScreen> createState() => _PromoScreenState();
}

class _PromoScreenState extends State<PromoScreen> {

  Future<PromoModel>? newsFuture;

  @override
  void initState() {
    // TODO: implement initState
    Future.delayed(Duration.zero,(){
      newsFuture = Provider.of<PromoViewModel>(context,listen: false).fetchPromoRepo();

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
                const Text('PROMO',style: TextStyle(
                    color: Colors.white,
                    fontSize: 16,
                    fontWeight: FontWeight.w600
                ),),

            SizedBox(height: height * 0.025,),
            Container(
              height: height * .78,
              width: width,

              child: FutureBuilder<PromoModel>(
                future: newsFuture,
                builder: (context,AsyncSnapshot snapshot){
                  if(snapshot.connectionState == ConnectionState.waiting || !snapshot.hasData)
                  {
                    return const Center(
                      child: SpinKitFadingCircle(
                        color: Color(0xffED1C24),
                        size: 40,
                      ),
                    );
                  }
                  else{
                    return Consumer<PromoViewModel>(builder: (context,value,child){
                      return snapshot.data!.items!.length == 0 ?
                      Column(
                        children: [
                          SizedBox(height: height * 0.2,),
                          Image.asset('assets/images/nopromo.png',height: height * 0.2,),
                          const Text('No Promo Yet',
                            style: TextStyle(fontSize: 30,fontWeight: FontWeight.normal),)
                        ],

                      ) : ListView.builder(

                          itemCount: snapshot.data!.items!.length,
                          padding: EdgeInsets.zero,
                          shrinkWrap: true,
                          itemBuilder: (ctx,index){
                            String enddate = snapshot.data!.items[index]!.enddate;
                            DateTime endDate = DateTime.parse(enddate);
                            String formattedDate = "${endDate.day}-${endDate.month}-${endDate.year}";

                            var blob = snapshot.data!.items[index]!.contentsBlob;

                            return Padding(
                              padding: const EdgeInsets.only(left: 20.0,right: 20.0,bottom: 20.0,),
                              child: Row(
                                children: [
                                  Expanded(
                                    child: Container(
                                      height: height * 0.2,
                                      decoration:  BoxDecoration(
                                          image: DecorationImage(
                                              image: blob != null ? MemoryImage(base64Decode(blob)) as ImageProvider : AssetImage('assets/images/promo.png') as ImageProvider,
                                              fit: BoxFit.fill
                                          )
                                      ),

                                    ),
                                  ),
                                  Expanded(child:Container(
                                    height: height * 0.2,

                                    decoration: const BoxDecoration(
                                      color: Color(0xffED1C24),
                                    ),
                                    child:  Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Column(
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        children: [
                                          Text(snapshot.data.items[index]!.notification,maxLines: 4,style: TextStyle(
                                              fontSize: 9,
                                              color: Colors.white
                                          ),),

                                          const Center(
                                            child: Text('READY STOCK',style: TextStyle(
                                                fontSize: 12,
                                                color: Colors.white
                                            ),),
                                          ),
                                          Text('Offer Valid Till : ${formattedDate}'
                                            ,style: TextStyle(
                                                fontSize: 10,
                                                color: Colors.white
                                            ),),
                                          SizedBox(height: height * 0.01,),
                                          Container(
                                            height: height * 0.02,
                                            width: width * 0.5,
                                            color: Colors.black,
                                            child: Center(
                                              child: Text('TOTAL : PKR ${snapshot.data.items[index]!.price}',style: TextStyle(
                                                  fontSize: 9,
                                                  color: Colors.white
                                              ),),
                                            ),
                                          ),


                                        ],
                                      ),
                                    ),
                                  ),
                                  ),
                                ],

                              ),
                            );
                          });

                    });
                  }

                },

              ),
            ),




          ],
        ),
      ),


      bottomNavigationBar: BottomNavigationBarWidget("Promotions"),
    );
  }

}
