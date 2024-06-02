import 'package:flutter/material.dart';
import 'package:official_fortline_app/repositories/products_repo.dart';

import '../models/products_model.dart';

class ProductsViewModel with ChangeNotifier{
  ProductsRepo _productsRepo = ProductsRepo();
  ProductsModel? _productsViewModel;
  Future<ProductsModel> fetchAllProducts() async{
    _productsViewModel = await _productsRepo.fetchAllProducts();
    return _productsViewModel!;
  }
  ProductsModel get getProducts{
    return _productsViewModel!;
  }
}