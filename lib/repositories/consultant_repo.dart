
import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:official_fortline_app/models/consultant_model.dart';
import 'package:http/http.dart' as http;


class ConsultantRepo{

  Future<ConsultantModel> fetchConsultant() async{
    try{
      String url = 'http://sc9.indus-erp.com:1251/ords/fortline/reg/ConsultantAPI';
      final responce = await http.get(Uri.parse(url));
      if(responce.statusCode == 200){
        final body = jsonDecode(responce.body);
        print(responce.body);
        return ConsultantModel.fromJson(body);

      }
    }
    catch (e){
      if(kDebugMode){
        print(e.toString());
      }
      throw Error();

    }
    throw Exception();
  }
}