



import 'package:flutter/material.dart';
import 'package:official_fortline_app/models/consultant_model.dart';
import 'package:official_fortline_app/repositories/consultant_repo.dart';

class ConsultantViewModel with ChangeNotifier{

  ConsultantRepo _repo = ConsultantRepo();
  ConsultantModel? _getConsultantRepo;

  ConsultantModel get consultantRepository{
    return _getConsultantRepo!;
  }

  Future<ConsultantModel> fetchConsultantRepo () async{

    _getConsultantRepo = await _repo.fetchConsultant();
    return _getConsultantRepo!;
  }
}