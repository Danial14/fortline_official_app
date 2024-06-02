import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:official_fortline_app/utils/utils.dart';
import 'package:official_fortline_app/view_models/products_view_model.dart';
import 'package:official_fortline_app/views/constants/constants.dart';
import 'package:official_fortline_app/views/product_details_screen.dart';
import 'package:official_fortline_app/views/profile.dart';
import 'package:official_fortline_app/views/widgets/bottom_navigation_bar.dart';
import 'package:official_fortline_app/views/widgets/product_card.dart';
import 'package:page_transition/page_transition.dart';
import 'package:provider/provider.dart';

import '../models/products_model.dart';
import 'home.dart';

class Products extends StatefulWidget {
  const Products({Key? key}) : super(key: key);

  @override
  State<Products> createState() => _ProductsState();
}

class _ProductsState extends State<Products> {
  Future<ProductsModel>? _productsModel;
  bool _isFirstTimeDownload = true;
  @override
  initState(){
    Future.delayed(Duration.zero, () async{
      _productsModel = Provider.of<ProductsViewModel>(context, listen: false).fetchAllProducts();
      setState(() {

      });
    });
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
    resizeToAvoidBottomInset: false,
    body: Container(
      width: size.width,
      height: size.height,
      decoration: BoxDecoration(
      image: DecorationImage(
      image: AssetImage("assets/images/complaint.png"),
      fit: BoxFit.fill
      )
      ),
      child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(height: size.height * 0.044,),
      Padding(
      padding: const EdgeInsets.all(6.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
      Image.asset("assets/images/fortline_logo_white.png",
      height: 25,
      ),
      Row(
        children: [
          const Icon(Icons.notifications_none, size: 20, color: Colors.white,),
          InkWell(
              onTap: (){
                Navigator.pushReplacement(context, PageTransition(child: const UserProfile(),
                    type: PageTransitionType.rightToLeft));
              },
              child: Image.asset("assets/images/user.png", height: 20, color: Colors.white,)),

        ],
      ),
      ],
      ),
      ),
      Row(
      children: [
      InkWell(
       onTap: (){
         Navigator.pushReplacement(context, PageTransition(child: const Home(), type: PageTransitionType.leftToRight));
       },
        child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Image.asset("assets/images/back_button.png",height: 25,),
        ),
      ),
      const Expanded(child: Padding(
      padding: EdgeInsets.only(top: 6.0),
      child: Align(alignment: Alignment.topCenter,child: Text("PRODUCTS",
      style: TextStyle(color: Colors.white,
      fontSize: 16,
        fontWeight: FontWeight.w600
      ),
      ),),
      ),)
      ],
      ),
      SizedBox(height: size.height * 0.03,),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [Image.asset("assets/images/brands_head.png", width: 130, height: 50,),
            Row(
              children: [
                Image.asset("assets/images/left.png", width: 20, height: 20,),
                SizedBox(width: 4,),
                Image.asset("assets/images/right.png", width: 20, height: 20,),
              ],
            )
            ],
          ),
        ),
        SizedBox(height: 10,),
        Expanded(
          child: ListView.builder(itemBuilder: (ctx, position){
            return InkWell(
              onTap: (){
                Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (ctx){
                  return ProductDetailScreen();
                }));
              },
              child: Padding(
                padding: const EdgeInsets.only(left: 8.0),
                child: Container(
                  alignment: Alignment.center,
                  width: 170,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(25),
                    color: MyConstants.FORTLINE_GREY
                  ),
                  child: Image.asset(MyConstants.brandImages[position], width: 140, height: 100,),
                ),
              ),
            );
          }, scrollDirection: Axis.horizontal, itemCount: MyConstants.brandImages.length,),
        ),
        SizedBox(height: 10,),
        Expanded(child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 8),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                width: size.width * 0.7,
                child: Padding(
                  padding: const EdgeInsets.only(left: 6.0),
                  child: TextField(
                    decoration: InputDecoration(
                      hintText: "Search...",
                      suffixIcon: Icon(Icons.search, color: Colors.grey,),
                      border: InputBorder.none,
                      hintStyle: TextStyle(color: Colors.white)
                    ),
                  ),
                ),
                decoration: BoxDecoration(
                  color: MyConstants.INPUT_BOX_RED_COLOR,
                  borderRadius: BorderRadius.only(topRight: Radius.circular(10),topLeft: Radius.circular(10),bottomRight: Radius.circular(10),)
                ),
              ),
              Container(
                width: 80,
                decoration: BoxDecoration(
                  color: MyConstants.INPUT_BOX_RED_COLOR,
                    borderRadius: BorderRadius.circular(10)
                ),
                child: Padding(
                  padding: const EdgeInsets.only(left: 4.0),
                  child: DropdownButton(items: [
                    DropdownMenuItem(child: Text("Sort By", style: TextStyle(color: Colors.white, fontSize: 15),))
                  ],
                    onChanged: (v){

                    },
                    icon: Padding(
                      padding: const EdgeInsets.only(left: 2.0),
                      child: Image.asset("assets/images/chevron.png", width: 15, height: 15,),
                    ),
                    underline: Container(),
                  ),
                ),
              )
            ],
          ),
        )),
        SizedBox(height: 10,),
        Expanded(child: FutureBuilder<ProductsModel>(
          future: _productsModel,
          builder: (context, snapshot) {
            if(snapshot.connectionState == ConnectionState.waiting || !snapshot.hasData){
              return Center(
                child: SpinKitFadingCircle(
                  size: 40,
                  color: MyConstants.INPUT_BOX_RED_COLOR,
                ),
              );
            }
            return Consumer<ProductsViewModel>(
              builder: (context, products, ch) {
                if(_isFirstTimeDownload){
                  print("downloading products firsttime");
                  return GridView.builder(gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 3,
                      childAspectRatio: 5 / 5
                  ), itemBuilder: (ctx, position){
                    return InkWell(
                      onTap: (){
                        Navigator.pushReplacement(context, PageTransition(child: ProductDetailScreen(), type: PageTransitionType.rightToLeft));

                      },
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: ProductCard(snapshot.data!.items![position].itmdsc!),
                      ),
                    );
                  },
                    itemCount: snapshot.data!.items!.length,
                  );
                }
                return GridView.builder(gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 3,
                  childAspectRatio: 5 / 5
                ), itemBuilder: (ctx, position){
                  return InkWell(
                    onTap: (){
                      Navigator.pushReplacement(context, PageTransition(child: ProductDetailScreen(), type: PageTransitionType.rightToLeft));

                    },
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: ProductCard("Cisco Access Point"),
                    ),
                  );
                },
                itemCount: products.getProducts.items!.length,
                );
              }
            );
          }
        ), flex: 8,)
      ]
      )
      ),

    );
  }
}
