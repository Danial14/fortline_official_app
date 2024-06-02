import '../models/invoices_model.dart';
import 'package:http/http.dart' as http;

class InvoicesRepo{
  Future<InvoicesModel> fetchAllInvoices() async{
    String url = "";
    var response = await http.get(Uri.parse(url));
    if(response.statusCode == 200){
      //return InvoicesModel.fromJson(jsonDecode(response.body));
    }
    throw Exception("error");
  }
}