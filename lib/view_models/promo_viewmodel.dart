
import 'package:flutter/foundation.dart';
import 'package:official_fortline_app/models/promo_model.dart';
import 'package:official_fortline_app/repositories/promo_repo.dart';

class PromoViewModel with ChangeNotifier{
  PromoRepo _repo = PromoRepo();

  PromoModel? _getPromoRepo;

  PromoModel get promoRepository {
    return _getPromoRepo!;
  }

Future<PromoModel> fetchPromoRepo() async{
  _getPromoRepo = await _repo.fetchPromo();
  return _getPromoRepo!;
}

}