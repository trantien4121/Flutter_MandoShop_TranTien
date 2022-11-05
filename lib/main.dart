import 'package:flutter/material.dart';
import 'package:mando_shop/mando_home_full.dart';
import 'package:mando_shop/mando_product_detail.dart';
import 'package:mando_shop/provider/product_provider.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MultiProvider(
    providers: [ChangeNotifierProvider(create: (_) => ProductProvider())],
    child: MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomePage(),
      routes: {
        // Khao báo router
        "/home": (context) => HomePage() , // Khai báo kiểu này cũng đc , path r
        ProductDetail.routerName: (context) => ProductDetail()
      },
    ),
  ));
}
