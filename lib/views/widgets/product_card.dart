import 'package:flutter/material.dart';
import 'package:official_fortline_app/views/constants/constants.dart';

class ProductCard extends StatelessWidget {
  late String _productname;
  ProductCard(String productName){
    this._productname = productName;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.bottomLeft,
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage("assets/images/cisco_access_points.png"),
          fit:  BoxFit.fill
        )
      ),
      child: Container(
        alignment: Alignment.center,
        height: 20,
        child: Text(_productname, style: TextStyle(
          fontSize: 10,
          color: Colors.white,
          fontWeight: FontWeight.w900
        ),),
        decoration: BoxDecoration(
          color: MyConstants.INPUT_BOX_RED_COLOR,
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.5),
              blurRadius: 4,
              offset: Offset(4, 8), // Shadow position
            ),
          ],
        ),
      ),
    );
  }
}
