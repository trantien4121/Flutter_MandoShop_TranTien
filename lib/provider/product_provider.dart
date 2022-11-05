import 'dart:convert';
import 'package:flutter/material.dart';
import '../model/product_model.dart';
import 'package:http/http.dart' as http;

class ProductProvider extends ChangeNotifier{
  List<ProductModel> _list_cart = [];
  num _price = 0.0;

  List<ProductModel> list = [];
  final categories = <String>[];
  final searchList = <String>[];


  void getProductModel() async{ //Ham nay re nhanh (de lap trinh bat dong bo)
    //get data from web api
    var url = "https://fakestoreapi.com/products";
    var client = http.Client();
    var rs = await client.get(Uri.parse(url)); //Doi o nhanh da re (async)
    var jsonString = rs.body;
    var jsonObject = jsonDecode(jsonString) as List;  //Bien chuoi json thanh json object (Map<String, dynamic>) roi bien no thanh danh sach
    list = jsonObject.map((e){     //Chuyen List o tren thanh List ProductModel
      return ProductModel.fromJson(e);
    }).toList();
    notifyListeners();  //Bao trang thai
  }
  Future<List<String>> getProductCategories() async{
    var url = "https://fakestoreapi.com/products/categories";
    var client = http.Client();
    var rs = await client.get(Uri.parse(url)); //Doi o nhanh da re (async)
    var jsonString = rs.body;
    var jsonObject;
    if(jsonString.isNotEmpty) {
      jsonObject = jsonDecode(jsonString);
    }
    for(var category in jsonObject){
      if(categories.contains(category)) {
        break;
      }
      else{
        categories.add(category);
      }
    }
    notifyListeners();
    return categories;
  }
  Future<List<String>> getProductModelSearch(String searchValue) async{

    for (var l in list){
      if (l.title.toString().contains(searchValue)){
        searchList.add(l.title.toString());
      }
    }
    notifyListeners();
    return searchList;
  }
  void add(ProductModel item) {
    _list_cart.add(item);
    _price += item.price!;
    notifyListeners();
  }

  void remove(ProductModel item){
    _list_cart.remove(item);
    _price = _price - item.price!;
    notifyListeners();
  }
  String get price =>_price.toStringAsFixed(2);
  List<ProductModel> get product => _list_cart;

}