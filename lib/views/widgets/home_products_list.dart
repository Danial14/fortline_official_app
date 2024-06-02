import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:official_fortline_app/view_models/products_view_model.dart';
import 'package:official_fortline_app/views/products.dart';
import 'package:official_fortline_app/views/widgets/product_card.dart';
import 'package:page_transition/page_transition.dart';
import 'package:provider/provider.dart';

import '../../models/products_model.dart';
import '../constants/constants.dart';

class HomeProductsList extends StatefulWidget {
  const HomeProductsList({super.key});

  @override
  State<HomeProductsList> createState() => _HomeProductsListState();
}

class _HomeProductsListState extends State<HomeProductsList> {
  Future<ProductsModel>? _productsModel;
  @override
  void initState() {
    // TODO: implement initState
    Future.delayed(Duration.zero, (){
      _productsModel = Provider.of<ProductsViewModel>(context, listen: false).fetchAllProducts();
      setState(() {

      });
    });
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return FutureBuilder<ProductsModel>(future: _productsModel, builder: (ctx, snapshot){
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
          height: size.height * 0.18,
          child: ListView.builder(itemBuilder: (ctx, position){
            return Container(
              width: size.width * 0.33,
              child: Padding(
                padding: const EdgeInsets.only(right: 5, left: 5),
                child: InkWell(
                  child: ProductCard(snapshot.data!.items![position].itmdsc!),
                  onTap: (){
                    Navigator.pushReplacement(context, PageTransition(child: const Products(), type: PageTransitionType.rightToLeft));

                  },
                ),),
            );
          },
            itemCount: 3,
            scrollDirection: Axis.horizontal,
            padding: EdgeInsets.zero,
          )
      );
    });
  }
}
