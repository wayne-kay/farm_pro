import 'package:flutter/material.dart';
import '../models/product_model.dart';
import 'api_service.dart';

class ProductService extends ChangeNotifier{
  final ApiService apiService = ApiService();

  List<ProductModel> products = [];
  List<CategoryModel> categories = [];

  bool isLoading = false;

  Future<void> fetchProducts() async {
    isLoading = true;
    notifyListeners();

    try{
      final response = await apiService.get("/fetchAllProducts");

      products = (response as List)
          .map((product) => ProductModel.fromJson(product))
          .toList();

    }catch(e){
      print("Error fetching products: $e");
    }finally{
      isLoading = false;
      notifyListeners();
    }
  }

  Future<void> fetchCategories() async {
    isLoading = true;
    notifyListeners();

    try{
      final response = await apiService.get("/fetchAllCategories");

      categories = (response as List)
          .map((category) => CategoryModel.fromJson(category))
          .toList();

    }catch(e){
      print("Error fetching categories: $e");
    }finally{
      isLoading = false;
      notifyListeners();
    }
  }

  Future<void> fetchProductsPerCategory(int id) async {
    isLoading = true;
    notifyListeners();

    try{
      final response = await apiService.get("/fetchProductsPerCategory/$id");

      products = (response as List)
          .map((product) => ProductModel.fromJson(product))
          .toList();

    }catch(e){
      print("Error fetching products: $e");
    }finally{
      isLoading = false;
      notifyListeners();
    }
  }
}