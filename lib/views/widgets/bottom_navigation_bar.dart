import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:official_fortline_app/views/constants/constants.dart';
import 'package:official_fortline_app/views/consultant_screen.dart';
import 'package:official_fortline_app/views/my_invoices.dart';
import 'package:official_fortline_app/views/pdf_viewer.dart';
import 'package:official_fortline_app/views/support.dart';
import 'package:page_transition/page_transition.dart';
import 'package:persistent_bottom_nav_bar/persistent_tab_view.dart';

import '../home.dart';
import '../products.dart';
import '../promo_screen.dart';

class BottomNavigationBarWidget extends StatefulWidget {
  BottomNavigationBarWidget(String screenName){
   this._screenName = screenName;
  }
  late String _screenName;
  @override
  State<BottomNavigationBarWidget> createState() => _BottomNavigationBarWidgetState();
}

class _BottomNavigationBarWidgetState extends State<BottomNavigationBarWidget> {
  static int selectedTab = 0;
  PersistentTabController _controller = PersistentTabController(initialIndex: 0);
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  _changeTab(int index) {
    /*if(index == 5){
      selectedTab = 0;
    }
    else {
      selectedTab = index;
    }*/
    if (MyConstants.BOTTOM_NAVIGATION_ITEMS[index]["name"]! == "Promotions") {
      Navigator.pushReplacement(context, PageTransition(child: PromoScreen(), type: PageTransitionType.rightToLeft));
    }
    else if (MyConstants.BOTTOM_NAVIGATION_ITEMS[index]["name"]! == "Team") {
      Navigator.pushReplacement(context, PageTransition(child: ConsultantScreen(), type: PageTransitionType.rightToLeft));

    }
    else if (MyConstants.BOTTOM_NAVIGATION_ITEMS[index]["name"]! == "Invoices") {
      Navigator.pushReplacement(context, PageTransition(child: MyInvoices(), type: PageTransitionType.rightToLeft));

    }
    else if (MyConstants.BOTTOM_NAVIGATION_ITEMS[index]["name"]! == "Home") {
      Navigator.pushReplacement(context, PageTransition(child: Home(), type: PageTransitionType.rightToLeft));

    }
    else if (MyConstants.BOTTOM_NAVIGATION_ITEMS[index]["name"]! == "Support") {
      Navigator.pushReplacement(context, PageTransition(child: Support(), type: PageTransitionType.rightToLeft));
    }
    else{
      Navigator.pushReplacement(context, PageTransition(child: PdfScreen(), type: PageTransitionType.rightToLeft));
    }
  }


  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      width: size.width,
      height: size.height * 0.05,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.only(topRight: Radius.circular(25),
        topLeft: Radius.circular(25)
        ),
        color: Color(0xffED1C24)
      ),
      child: ListView.builder(itemBuilder: (ctx, position){
        return InkWell(
          onTap: (){
            _changeTab(position);
          },
          child: Padding(
            padding: EdgeInsets.only(left: 25, top: 2, bottom: 2),
            child: widget._screenName == MyConstants.BOTTOM_NAVIGATION_ITEMS[position]["name"]! ? Container(
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(25),
                  color: Colors.white
              ),
              width: size.width * 0.3,
              height: 20,
              child: Row(
                children: <Widget>[
                  Expanded(child: Image.asset(MyConstants.BOTTOM_NAVIGATION_ITEMS[position]["icon"]!, color: Colors.red,),
                    flex: 2,
                  ),
                  Expanded(child: Text(MyConstants.BOTTOM_NAVIGATION_ITEMS[position]["name"]!, style: TextStyle(
                      color: Colors.red,
                      fontSize: 12
                  ),
                  ),
                    flex: 3,
                  )
                ],
              ),
            ) : Image.asset(MyConstants.BOTTOM_NAVIGATION_ITEMS[position]["icon"]!,color: Colors.white,)
          ),
        );
      },
      itemCount: MyConstants.BOTTOM_NAVIGATION_ITEMS.length,
        scrollDirection: Axis.horizontal,
      ),
    );
  }
}




