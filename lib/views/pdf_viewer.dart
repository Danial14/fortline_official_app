import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';
import 'package:syncfusion_flutter_pdfviewer/pdfviewer.dart';

import 'home.dart';

class PdfScreen extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async{
        print("pop invoked");
        //PageTransition(child: Home(), type: PageTransitionType.rightToLeft);
        Navigator.of(context).pushAndRemoveUntil(MaterialPageRoute(builder: (ctx){
          return Home();
        }),
            ModalRoute.withName("/")
        );
        return true;
      },
      child: Scaffold(
        body: SfPdfViewer.asset("assets/profile/Fortline_Company_profile.pdf"),
      ),
    );
  }
}