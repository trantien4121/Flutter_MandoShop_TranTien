import 'package:flutter/material.dart';
import 'package:mando_shop/model/product_model.dart';
import 'package:mando_shop/provider/product_provider.dart';
import 'package:provider/provider.dart';
import 'package:flutter_slidable/flutter_slidable.dart';


class CartProductPage extends StatefulWidget {
  const CartProductPage({Key? key}) : super(key: key);

  @override
  State<CartProductPage> createState() => _CartProductPageState();
}

class _CartProductPageState extends State<CartProductPage> {
  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<ProductProvider>(context);

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.deepOrangeAccent,
        title: const Text("Shopping Cart"),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Container(
            margin: const EdgeInsets.only(top: 15),
            child: Column(
              children: [
                //Tiêu đề giỏ
                Row(
                  children: [
                    Expanded(
                      flex: 7,
                      child: Container(
                          child: const Text(
                            "My Products",
                            style: TextStyle(
                                fontSize: 20,
                                color: Colors.black,
                                fontWeight: FontWeight.w500),
                          )),
                    ),
                    const SizedBox(width: 20),
                    //Icon(Icons.filter_list, color: Colors.black54),
                    Expanded(
                      flex: 1,
                      child: Container(
                        height: 40,
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                            border: Border.all(
                                width: 1.0, color: Colors.deepOrangeAccent),
                            color: Colors.deepOrangeAccent,
                            borderRadius:
                            const BorderRadius.all(Radius.circular(10))),
                        child: InkWell(
                          onTap: () {},
                          child: (const Icon(Icons.delete_outlined,
                              color: Colors.white)),
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 30),
                //List các sản phẩm
                Container(
                  height: MediaQuery.of(context).size.height* 0.5,
                  child: ListView.builder(
                      scrollDirection: Axis.vertical,
                      shrinkWrap: true,
                      itemCount: provider.product.length,
                      itemBuilder: (context, index) {
                        return
                          Slidable(
                            endActionPane: ActionPane(
                              motion: ScrollMotion(),
                              extentRatio: 0.3, // Chieu rong cua slideable(2 button) bang 1/2
                              children: [
                                const SizedBox(width: 10),
                                SlidableAction(
                                  flex: 1,
                                  onPressed: (_){
                                    provider.remove(provider.product[index]);
                                  },
                                  borderRadius: const BorderRadius.only(
                                    topRight: Radius.circular(10),
                                    bottomRight:  Radius.circular(10),
                                    topLeft: Radius.circular(10),
                                    bottomLeft:  Radius.circular(10),
                                  ),
                                  backgroundColor: Colors.red,
                                  foregroundColor: Colors.white,
                                  icon: Icons.delete,
                                  label: 'Delete',
                                ),
                              ],
                            ),
                            child: Container(
                              margin: EdgeInsets.only(bottom: 20),
                              child: Row(
                                children: [
                                  Expanded(
                                    flex: 5,
                                    child: Container(
                                        width: 100,
                                        child: Row(
                                          children: [
                                            Image(
                                              image: NetworkImage(
                                                  '${provider.product[index].image}'),
                                              fit: BoxFit.fill,
                                              width: 50,
                                              height: 50,
                                            ),
                                            Container(
                                              padding: const EdgeInsets.only(
                                                  top: 5,
                                                  bottom: 5,
                                                  left: 10,
                                                  right: 5),
                                              width: MediaQuery.of(context).size.width *
                                                  0.4,
                                              child: Column(
                                                crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                                children: [
                                                  Text(
                                                    '${provider.product[index].title}',
                                                    style: const TextStyle(
                                                        fontSize: 16,
                                                        color: Colors.black,
                                                        fontWeight: FontWeight.w600),
                                                    maxLines: 1,
                                                    overflow: TextOverflow.ellipsis,
                                                  ),
                                                  const SizedBox(height: 8),
                                                  Text(
                                                    '${provider.product[index].price} \$',
                                                    style: const TextStyle(
                                                        fontSize: 16,
                                                        color: Colors.black,
                                                        fontWeight: FontWeight.w600),
                                                    maxLines: 1,
                                                    overflow: TextOverflow.ellipsis,
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ],
                                        )),
                                  ),
                                  const SizedBox(width: 5),
                                  //Icon(Icons.filter_list, color: Colors.black54),
                                  Expanded(
                                    flex: 1,
                                    child: Container(
                                      height: 40,
                                      alignment: Alignment.center,
                                      decoration: BoxDecoration(
                                          border: Border.all(
                                              width: 1.0,
                                              color: Colors.deepOrangeAccent),
                                          color: Colors.deepOrangeAccent,
                                          borderRadius: const BorderRadius.all(
                                              Radius.circular(10))),
                                      child: InkWell(
                                        onTap: () {},
                                        child: (const Text(
                                          "-",
                                          style: TextStyle(
                                              fontSize: 16,
                                              color: Colors.white,
                                              fontWeight: FontWeight.w700),
                                        )),
                                      ),
                                    ),
                                  ),
                                  const SizedBox(width: 5),
                                  Expanded(
                                    flex: 1,
                                    child: Container(
                                      height: 40,
                                      alignment: Alignment.center,
                                      decoration: BoxDecoration(
                                          border: Border.all(
                                              width: 1.0,
                                              color: Colors.deepOrangeAccent),
                                          color: Colors.white30,
                                          borderRadius: const BorderRadius.all(
                                              Radius.circular(10))),
                                      child: (const Text(
                                        "1",
                                        style: TextStyle(
                                            fontSize: 16,
                                            color: Colors.black,
                                            fontWeight: FontWeight.w700),
                                      )),
                                    ),
                                  ),
                                  const SizedBox(width: 5),
                                  Expanded(
                                    flex: 1,
                                    child: Container(
                                      height: 40,
                                      alignment: Alignment.center,
                                      decoration: BoxDecoration(
                                          border: Border.all(
                                              width: 1.0,
                                              color: Colors.deepOrangeAccent),
                                          color: Colors.deepOrangeAccent,
                                          borderRadius: const BorderRadius.all(
                                              Radius.circular(10))),
                                      child: InkWell(
                                        onTap: () {},
                                        child: (const Text(
                                          "+",
                                          style: TextStyle(
                                              fontSize: 16,
                                              color: Colors.white,
                                              fontWeight: FontWeight.w700),
                                        )),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          );
                      }),
                ),
                const SizedBox(height: 20),
                Row(
                  children: [
                    Expanded(
                      flex: 7,
                      child: Container(
                          child: Text(
                            "${provider.product.length} product",
                            style: const TextStyle(
                                fontSize: 16,
                                color: Colors.black,
                                fontWeight: FontWeight.w500
                            ),
                          )
                      ),
                    ),
                    const SizedBox(width: 20),
                    Expanded(
                      flex:5,
                      child: Container(
                        height: 40,
                        alignment: Alignment.center,
                        decoration:  BoxDecoration(
                            border: Border.all(width: 1.0, color: Colors.deepOrangeAccent),
                            color: Colors.white,
                            borderRadius: const BorderRadius.all(Radius.circular(10))),
                        child:(
                            Text(
                              "${provider.price} \$",
                              style: const TextStyle(
                                fontSize: 16,
                                color: Colors.black,
                                fontWeight: FontWeight.bold,
                              ),
                            )
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 40),

                //Phần button Checkout
                Container(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      InkWell(
                        onTap: () {},
                        child: Container(
                            padding: const EdgeInsets.only(top: 15, bottom: 15),
                            width: MediaQuery.of(context).size.width * 0.91,
                            decoration: BoxDecoration(
                              color: Colors.deepOrange,
                              borderRadius: BorderRadius.circular(5),
                            ),
                            child: const Text(
                              "Check out",
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                  fontSize: 18,
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold),
                            )),
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}


