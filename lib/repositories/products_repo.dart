import 'dart:convert';

import '../models/products_model.dart';
import 'package:http/http.dart' as http;

class ProductsRepo{
  Future<ProductsModel> fetchAllProducts() async{
    String url = "http://sc9.indus-erp.com:1251/ords/fortline/reg/ProductAPI";
    var response = await http.get(Uri.parse(url));
    if(response.statusCode == 200){
      return ProductsModel.fromJson(jsonDecode(response.body));
    }
    throw Exception("error");
  }
}