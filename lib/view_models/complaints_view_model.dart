import 'package:flutter/material.dart';
import 'package:official_fortline_app/models/complaints_model.dart';
import 'package:official_fortline_app/repositories/complaints_repo.dart';

class ComplaintsViewModel with ChangeNotifier{
  ComplaintsRepo _complaintsRepo = ComplaintsRepo();
  ComplaintsModel? _complaintsModel;
  Future<ComplaintsModel> fetchAllComplaints(String emailId) async{
    _complaintsModel = await _complaintsRepo.fetchAllComplaints(emailId);
    return _complaintsModel!;
  }
  ComplaintsModel get getProducts{
    return _complaintsModel!;
  }
}