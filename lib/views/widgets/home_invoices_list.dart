import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:official_fortline_app/models/invoices_model.dart';
import 'package:page_transition/page_transition.dart';
import 'package:provider/provider.dart';

import '../../view_models/my_invoices_view_model.dart';
import '../constants/constants.dart';
import '../my_invoices.dart';

class HomeInvoicesList extends StatefulWidget {
  const HomeInvoicesList({Key? key}) : super(key: key);

  @override
  State<HomeInvoicesList> createState() => _HomeInvoicesListState();
}

class _HomeInvoicesListState extends State<HomeInvoicesList> {
  Future<InvoicesModel>? _invoicesModel;
  ScrollController _categoryScrollController = ScrollController();
  @override
  void initState() {
    // TODO: implement initState
    Future.delayed(Duration.zero, (){
      _invoicesModel = Provider.of<MyInvoicesViewModel>(context, listen: false).fetchAllInvoices();
      setState(() {

      });
    });
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return FutureBuilder<InvoicesModel>(future: _invoicesModel, builder: (ctx, snapshot){
      if(snapshot.connectionState == ConnectionState.waiting || !snapshot.hasData){
        return Center(
          child: SpinKitFadingCircle(
            size: 40,
            color: MyConstants.INPUT_BOX_RED_COLOR,
          ),
        );
      }
      return Container(
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
      );
    });
  }
}
