import 'dart:math';

import 'package:flutter/material.dart';
import 'package:mando_shop/model/product_model.dart';
import 'package:mando_shop/provider/product_provider.dart';
import 'package:provider/provider.dart';

class ProductDetail extends StatelessWidget {
  ProductDetail({Key? key}) : super(key: key);

  // Khai bao router name
  static const routerName = "/product_detail";


  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<ProductProvider>(context);
    provider.getProductModel();
    // Hàm này là lấy argument của router xong gán vào ProdcutModel để lấy thuộc tính tilte imaga ,...
    final item = ModalRoute.of(context)!.settings.arguments as ProductModel;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.deepOrangeAccent,
        title: const Text("Product Detail"),
      ),
      body: SingleChildScrollView(
        child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Container(
              padding: const EdgeInsets.only(top: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Center(
                    child: Text(
                      '${item.title}',
                      style: const TextStyle(
                          fontSize: 16,
                          color: Colors.black,
                          fontWeight: FontWeight.w700),
                    ),
                  ),
                  const SizedBox(height: 20),
                  Center(
                    child: Image(
                      image: NetworkImage('${item.image}'),
                      fit: BoxFit.fill,
                      width: MediaQuery.of(context).size.width * 0.45,
                      height: MediaQuery.of(context).size.height * 0.3,
                    ),
                  ),
                  const SizedBox(height: 30),
                  Center(
                    child: Text(
                      'Description: ${item.description}',
                      textAlign: TextAlign.justify,
                      style: const TextStyle(
                          fontSize: 16,
                          color: Colors.black,
                          fontWeight: FontWeight.w500),
                    ),
                  ),
                  const SizedBox(height: 20),
                  SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Row(
                      children: [
                        const Text(
                          'Select colors: ',
                          textAlign: TextAlign.justify,
                          style: TextStyle(
                              fontSize: 16,
                              color: Colors.black,
                              fontWeight: FontWeight.w500),
                        ),
                        Container(
                          padding: const EdgeInsets.all(10),
                          margin: const EdgeInsets.fromLTRB(20, 10, 10, 10),
                          decoration: BoxDecoration(
                            color: Colors.deepOrangeAccent,
                            borderRadius: BorderRadius.circular(30),
                          ),
                        ),
                        Container(
                          padding: const EdgeInsets.all(10),
                          margin: const EdgeInsets.fromLTRB(20, 10, 10, 10),
                          decoration: BoxDecoration(
                            color: Colors.black,
                            borderRadius: BorderRadius.circular(30),
                          ),
                        ),
                        Container(
                          padding: const EdgeInsets.all(10),
                          margin: const EdgeInsets.fromLTRB(20, 10, 10, 10),
                          decoration: BoxDecoration(
                            color: Colors.green,
                            borderRadius: BorderRadius.circular(20),
                          ),
                        ),
                        Container(
                          padding: const EdgeInsets.all(10),
                          margin: const EdgeInsets.fromLTRB(20, 10, 10, 10),
                          decoration: BoxDecoration(
                            color: Colors.blue,
                            borderRadius: BorderRadius.circular(30),
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 20),
                  SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Row(
                      children: [
                        const Text(
                          'Select size: ',
                          textAlign: TextAlign.justify,
                          style: TextStyle(
                              fontSize: 16,
                              color: Colors.black,
                              fontWeight: FontWeight.w500),
                        ),
                        Container(
                            padding: const EdgeInsets.all(10),
                            margin: const EdgeInsets.only(left: 20),
                            decoration: BoxDecoration(
                              border: Border.all(
                                  width: 1.0, color: Colors.deepOrangeAccent),
                              borderRadius: BorderRadius.circular(10),
                            ),
                            child: const Text(" S ",
                                style: TextStyle(
                                    fontSize: 12,
                                    fontWeight: FontWeight.bold))),
                        Container(
                            padding: const EdgeInsets.all(10),
                            margin: const EdgeInsets.only(left: 20),
                            decoration: BoxDecoration(
                              border: Border.all(
                                  width: 1.0, color: Colors.deepOrangeAccent),
                              borderRadius: BorderRadius.circular(10),
                            ),
                            child: const Text(" M ",
                                style: TextStyle(
                                    fontSize: 12,
                                    fontWeight: FontWeight.bold))),
                        Container(
                            padding: const EdgeInsets.all(10),
                            margin: const EdgeInsets.only(left: 20),
                            decoration: BoxDecoration(
                              border: Border.all(
                                  width: 1.0, color: Colors.deepOrangeAccent),
                              borderRadius: BorderRadius.circular(10),
                            ),
                            child: const Text(" L ",
                                style: TextStyle(
                                    fontSize: 12,
                                    fontWeight: FontWeight.bold))),
                        Container(
                            padding: const EdgeInsets.all(10),
                            margin: const EdgeInsets.only(left: 20),
                            decoration: BoxDecoration(
                              border: Border.all(
                                  width: 1.0, color: Colors.deepOrangeAccent),
                              borderRadius: BorderRadius.circular(10),
                            ),
                            child: const Text(" XL ",
                                style: TextStyle(
                                    fontSize: 12,
                                    fontWeight: FontWeight.bold))),
                      ],
                    ),
                  ),
                  const SizedBox(height: 30),
                  Row(
                    children: [
                      Expanded(
                        flex: 4,
                        child: Container(
                          height: 60,
                          alignment: Alignment.center,
                          decoration: BoxDecoration(
                              border: Border.all(
                                  width: 1.0, color: Colors.deepOrangeAccent),
                              color: Colors.deepOrangeAccent,
                              borderRadius:
                                  const BorderRadius.all(Radius.circular(10))),
                          child: Text(
                            "Price: ${item.price} \$",
                            style: const TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                                color: Colors.white),
                          ),
                        ),
                      ),
                      const SizedBox(width: 10),
                      //Icon(Icons.filter_list, color: Colors.black54),
                      Expanded(
                          flex: 6,
                          child: Container(
                            height: 60,
                            child: InkWell(
                              onTap: null,
                              child: Container(
                                padding: const EdgeInsets.all(10),
                                decoration: BoxDecoration(
                                  color: Colors.deepOrangeAccent,
                                  borderRadius: BorderRadius.circular(10),
                                ),
                                child: Container(
                                  width: 80,
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: const [
                                      Icon(
                                        Icons.shopping_cart_outlined,
                                        size: 20,
                                        color: Colors.white,
                                      ),
                                      Text(" Add to Cart",
                                          style: TextStyle(
                                              fontSize: 16,
                                              fontWeight: FontWeight.bold,
                                              color: Colors.white)),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          )),
                    ],
                  ),
                ],
              ),
            )
            //child: Text("${item.description}"),
            ),
      ),
    );
  }
}
