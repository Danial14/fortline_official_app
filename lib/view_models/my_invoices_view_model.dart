import 'package:flutter/material.dart';
import 'package:official_fortline_app/repositories/invoices_repo.dart';

import '../models/invoices_model.dart';

class MyInvoicesViewModel with ChangeNotifier{
  InvoicesRepo _invoicesRepo = InvoicesRepo();
  InvoicesModel? _invoicesModel;
  Map<String, List<Map<String, String>>> _paidInvoices = {"PAID" : [
  {"date" : "2-19=-24",
  "title" : "Test Invoice",
    "invoice amount" : "PKR 5000",
    "redeem by" : "cash",
    "invoice no" : "INV-10",
    "rebate amount" : "PKR 3000",
    "status" : "paid"
  },
    {"date" : "2-19=-24",
      "title" : "Test Invoice",
      "invoice amount" : "PKR 6000",
      "redeem by" : "cash",
      "invoice no" : "INV-11",
      "rebate amount" : "PKR 2000",
      "status" : "paid"
    }
  ]
  };
  Map<String, List<Map<String, String>>> _unpaidInvoices = {"UNPAID" : [
    {"date" : "2-19=-24",
      "title" : "Test Invoice",
      "invoice amount" : "PKR 5000",
      "redeem by" : "adjustment",
      "invoice no" : "INV-12",
      "rebate amount" : "PKR 3000",
      "status" : "unpaid"
    },
    {"date" : "2-19=-24",
      "title" : "Test Invoice",
      "invoice amount" : "PKR 6000",
      "redeem by" : "adjustment",
      "invoice no" : "INV-13",
      "rebate amount" : "PKR 2000",
      "status" : "unpaid"
    }
  ]
  };
  Map<String, List<Map<String, String>>> _currentTabbedInvoice = {};
  Future<Map<String, List<Map<String, String>>>> fetchInitialPaidInvoices() async{
    return _paidInvoices;
  }
  Map<String, List<Map<String, String>>> get getCurrentTabbedInvoice{
    return _currentTabbedInvoice;
  }
  Future<void> fetchPaidInvoices() async{
    _currentTabbedInvoice = _paidInvoices;
    notifyListeners();
  }
  Future<void> fetchUnpaidInvoices() async{
    _currentTabbedInvoice = _unpaidInvoices;
    notifyListeners();
  }
  Future<InvoicesModel> fetchAllInvoices() async{
    _invoicesModel = await _invoicesRepo.fetchAllInvoices();
    return _invoicesModel!;
  }
  InvoicesModel get getProducts{
    return _invoicesModel!;
  }
}