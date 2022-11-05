import 'package:flutter/material.dart';
import 'package:mando_shop/mando_cart_page.dart';
import 'package:mando_shop/mando_product_detail.dart';
import 'package:mando_shop/model/product_model.dart';
import 'package:mando_shop/provider/product_provider.dart';
import 'package:provider/provider.dart';

class HomePage extends StatefulWidget {
  HomePage({Key? key}) : super(key: key);

  List<ProductModel> list = [];

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  String search = "";

  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<ProductProvider>(context);
    provider.getProductModel();
    provider.getProductCategories();
    //provider.getProductModelSearch(search);

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        leading: boxHeaderMenu(context),
        title: boxHeaderTitle(context),
        actions: [boxHeaderAccount(context)],
      ),
      body: Column(
        children: [
          Container(
            margin:
                const EdgeInsets.only(top: 20, left: 20, bottom: 5, right: 20),
            child: Row(
              children: [
                // Search Field
                Expanded(
                  flex: 8,
                  child: Container(
                    height: 40,
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                        border: Border.all(
                            width: 1.0, color: Colors.deepOrangeAccent),
                        color: Colors.white,
                        borderRadius:
                            const BorderRadius.all(Radius.circular(10))),
                    child: TextField(
                      onChanged: (value) {
                        setState(() {
                          search = value;
                        });
                      },
                      decoration: const InputDecoration(
                          border: InputBorder.none,
                          hintText: "Search Products ...",
                          hintStyle: TextStyle(fontSize: 12),
                          contentPadding: EdgeInsets.only(
                              left: 10, right: 10, bottom: 0, top: 5),
                          prefixIcon: Icon(Icons.search, color: Colors.black)),
                    ),
                  ),
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
                        color: Colors.white,
                        borderRadius:
                            const BorderRadius.all(Radius.circular(10))),
                    child: InkWell(
                        onTap: () {
                          Navigator.of(context).restorablePush(_dialogBuilder);
                        },
                        child: (const Icon(Icons.filter_list,
                            color: Colors.black))),
                  ),
                ),
              ],
            ),
          ),
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              children: [
                ...provider.categories.map((e) {
                  return Container(
                      padding: const EdgeInsets.all(15),
                      margin:
                          const EdgeInsets.only(left: 20, top: 15, bottom: 5),
                      decoration: BoxDecoration(
                        border: Border.all(
                            width: 1.0, color: Colors.deepOrangeAccent),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: InkWell(
                        onTap: () {
                          search = "${e.toString()}";
                        },
                        child: Text("#${e.toString()}",
                            style: const TextStyle(
                                fontSize: 12, fontWeight: FontWeight.bold)),
                      ));
                }).toList(),
              ],
            ),
          ),
          Expanded(
              child: search.isEmpty
                  ? SingleChildScrollView(
                      child: Container(
                        padding: const EdgeInsets.only(left: 0, right: 0),
                        child: Column(
                          children: [
                            Container(
                              height: MediaQuery.of(context).size.height - 250,
                              margin: const EdgeInsets.only(
                                  top: 20, bottom: 20, left: 10, right: 10),
                              child: GridView.count(
                                crossAxisCount: 2,
                                mainAxisSpacing: 20,
                                crossAxisSpacing: 1,
                                childAspectRatio: 2 / 3.7,
                                children: [
                                  ...provider.list.map((e) {
                                    return Center(
                                      child: Container(
                                        width:
                                            MediaQuery.of(context).size.width *
                                                0.4,
                                        decoration: BoxDecoration(
                                            border: Border.all(
                                                width: 1.0,
                                                color: Colors.deepOrangeAccent),
                                            borderRadius:
                                                const BorderRadius.all(
                                                    Radius.circular(10)),
                                            boxShadow: const [
                                              BoxShadow(
                                                color: Colors.deepOrangeAccent,
                                                offset: Offset(
                                                  5.0,
                                                  5.0,
                                                ),
                                                blurRadius: 5.0,
                                                spreadRadius: 1.0,
                                              ),
                                              BoxShadow(
                                                color: Colors.white,
                                                offset: Offset(0.0, 0.0),
                                                blurRadius: 0.0,
                                                spreadRadius: 0.0,
                                              ),
                                            ]),
                                        child: Container(
                                          padding: EdgeInsets.all(15),
                                          child: Column(children: [
                                            InkWell(
                                              onTap: () {
                                                // click router sang path "/product_detaul" với arg là e
                                                Navigator.pushNamed(context,
                                                    ProductDetail.routerName,
                                                    arguments: e);
                                              },
                                              child: Column(
                                                children: [
                                                  Image(
                                                    image: NetworkImage(
                                                        '${e.image}'),
                                                    fit: BoxFit.fill,
                                                    width: 100,
                                                    height: 120,
                                                  ),
                                                  SizedBox(height: 10),
                                                  Text(
                                                    '${e.title}',
                                                    style: const TextStyle(
                                                        fontSize: 14,
                                                        color: Colors.black,
                                                        fontWeight:
                                                            FontWeight.w400),
                                                    maxLines: 2,
                                                    overflow:
                                                        TextOverflow.ellipsis,
                                                  ),
                                                ],
                                              ),
                                            ),
                                            SizedBox(height: 10),
                                            Text(
                                              'Giá: ${e.price}',
                                              style: const TextStyle(
                                                fontSize: 12,
                                              ),
                                            ),
                                            SizedBox(height: 10),
                                            Container(
                                              padding:
                                                  EdgeInsets.only(left: 16),
                                              child: Row(
                                                children: [
                                                  Text(
                                                    'Đánh giá: ${e.rating?.rate}',
                                                    style: const TextStyle(
                                                      fontSize: 12,
                                                    ),
                                                  ),
                                                  const Icon(
                                                    Icons.star,
                                                    color: Colors.yellow,
                                                    size: 14,
                                                  )
                                                ],
                                              ),
                                            ),
                                            SizedBox(height: 20),
                                            Container(
                                              child: Container(
                                                padding:
                                                    const EdgeInsets.all(10),
                                                decoration: BoxDecoration(
                                                  color: Colors.deepOrange,
                                                  borderRadius:
                                                      BorderRadius.circular(5),
                                                ),
                                                child: InkWell(
                                                  onTap: () {},
                                                  child: InkWell(
                                                    onTap: () {
                                                      provider.add(e);
                                                      Navigator.push(
                                                        context,
                                                        MaterialPageRoute(
                                                            builder: (context) =>
                                                                CartProductPage()),
                                                      );
                                                    },
                                                    child: Container(
                                                      width: 80,
                                                      child: Row(
                                                        children: const [
                                                          Icon(
                                                            Icons
                                                                .shopping_cart_outlined,
                                                            size: 14,
                                                            color: Colors.white,
                                                          ),
                                                          Text(" Add to Cart",
                                                              style: TextStyle(
                                                                  fontSize: 12,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .bold,
                                                                  color: Colors
                                                                      .white)),
                                                        ],
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                              ),
                                            )
                                          ]),
                                        ),
                                      ),
                                    );
                                  }).toList()
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    )
                  : ListView.builder(
                      scrollDirection: Axis.vertical,
                      shrinkWrap: true,
                      itemCount: provider.list.length,
                      itemBuilder: (context, index) {
                        if (provider.list[index].title
                                .toString()
                                .toLowerCase()
                                .contains(search) ||
                            provider.list[index].category
                                    .toString()
                                    .toLowerCase() ==
                                search) {
                          return Column(
                            children: [
                              Container(
                                margin: const EdgeInsets.only(
                                    left: 20, right: 20, top: 20, bottom: 10),
                                decoration: BoxDecoration(
                                    border: Border.all(
                                        width: 1.0,
                                        color: Colors.deepOrangeAccent),
                                    borderRadius: const BorderRadius.all(
                                        Radius.circular(10)),
                                    boxShadow: const [
                                      BoxShadow(
                                        color: Colors.deepOrangeAccent,
                                        offset: Offset(
                                          5.0,
                                          5.0,
                                        ),
                                        blurRadius: 5.0,
                                        spreadRadius: 1.0,
                                      ),
                                      BoxShadow(
                                        color: Colors.white,
                                        offset: Offset(0.0, 0.0),
                                        blurRadius: 0.0,
                                        spreadRadius: 0.0,
                                      ),
                                    ]),
                                child: Container(
                                  padding: EdgeInsets.all(10),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Row(
                                        children: [
                                          Image(
                                            image: NetworkImage(
                                                '${provider.list[index].image}'),
                                            fit: BoxFit.fill,
                                            width: 80,
                                            height: 80,
                                          ),
                                          const SizedBox(width: 20),
                                          Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              InkWell(
                                                onTap: () {
                                                  // click router sang path "/product_detaul" với arg là e
                                                  Navigator.pushNamed(context,
                                                      ProductDetail.routerName,
                                                      arguments:
                                                          provider.list[index]);
                                                },
                                                child: Container(
                                                  width: MediaQuery.of(context)
                                                          .size
                                                          .width *
                                                      0.55,
                                                  child: Text(
                                                    '${provider.list[index].title}',
                                                    style: const TextStyle(
                                                        fontSize: 14,
                                                        color: Colors.black,
                                                        fontWeight:
                                                            FontWeight.w400),
                                                    maxLines: 2,
                                                    overflow:
                                                        TextOverflow.ellipsis,
                                                  ),
                                                ),
                                              ),
                                              SizedBox(height: 10),
                                              Text(
                                                'Giá: ${provider.list[index].price}',
                                                style: const TextStyle(
                                                  fontSize: 12,
                                                ),
                                              ),
                                              SizedBox(height: 10),
                                              Container(
                                                child: Row(
                                                  children: [
                                                    Text(
                                                      'Đánh giá: ${provider.list[index].rating?.rate}',
                                                      style: const TextStyle(
                                                        fontSize: 12,
                                                      ),
                                                    ),
                                                    const Icon(
                                                      Icons.star,
                                                      color: Colors.yellow,
                                                      size: 14,
                                                    )
                                                  ],
                                                ),
                                              ),
                                              SizedBox(height: 10),
                                            ],
                                          ),
                                        ],
                                      ),
                                      SizedBox(height: 10),
                                      Container(
                                        child: InkWell(
                                          onTap: null,
                                          child: Container(
                                            padding: const EdgeInsets.all(10),
                                            decoration: BoxDecoration(
                                              color: Colors.deepOrange,
                                              borderRadius:
                                                  BorderRadius.circular(5),
                                            ),
                                            child: InkWell(
                                              onTap: () {
                                                provider
                                                    .add(provider.list[index]);
                                                Navigator.push(
                                                  context,
                                                  MaterialPageRoute(
                                                      builder: (context) =>
                                                          CartProductPage()),
                                                );
                                              },
                                              child: Container(
                                                width: 80,
                                                child: Row(
                                                  children: const [
                                                    Icon(
                                                      Icons
                                                          .shopping_cart_outlined,
                                                      size: 14,
                                                      color: Colors.white,
                                                    ),
                                                    Text(" Add to Cart",
                                                        style: TextStyle(
                                                            fontSize: 12,
                                                            fontWeight:
                                                                FontWeight.bold,
                                                            color:
                                                                Colors.white)),
                                                  ],
                                                ),
                                              ),
                                            ),
                                          ),
                                        ),
                                      )
                                    ],
                                  ),
                                ),
                              )
                            ],
                          );
                        }
                        return Container();
                      })),
        ],
      ),
    );
  }
}

boxHeaderMenu(BuildContext context) {
  return Container(
    margin: EdgeInsets.only(left: 20, top: 10, bottom: 10),
    decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(14.0),
        color: Colors.deepOrangeAccent,
        border: Border.all(width: 2.0, color: Colors.deepOrangeAccent),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.2),
            spreadRadius: 2,
            blurRadius: 3,
          ),
        ]),
    child: Row(
      children: const [
        SizedBox(width: 6),
        Icon(
          Icons.menu_rounded,
          size: 20,
          color: Colors.white,
        ),
      ],
    ),
  );
}

boxHeaderTitle(BuildContext context) {
  return Row(
    children: const [
      //SizedBox(width: 50),
      Text("Mando Fashion",
          style: TextStyle(
            fontSize: 24,
            color: Colors.deepOrangeAccent,
            fontWeight: FontWeight.w700,
          ))
    ],
  );
}

boxHeaderAccount(BuildContext context) {
  return InkWell(
    onTap: () {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => CartProductPage()),
      );
    },
    child: Row(children: const [
      Icon(
        Icons.card_travel,
        size: 32,
        color: Colors.deepOrangeAccent,
      ),
      SizedBox(width: 20),
    ]),
  );
}

Route<Object?> _dialogBuilder(BuildContext context, Object? arguments) {
  return DialogRoute<void>(
    context: context,
    builder: (BuildContext context) {
      return AlertDialog(
        title: const Text('Select filter mode'),
        content: Container(
          height: MediaQuery.of(context).size.height * 0.16,
          child: Column(
            children: [
              InkWell(
                onTap: () {},
                child: const Text("Price: Min price"),
              ),
              const SizedBox(height: 15),
              InkWell(
                onTap: () {},
                child: const Text("Price: Max price"),
              ),
              const SizedBox(height: 15),
              InkWell(
                onTap: () {},
                child: const Text("Bestseller"),
              ),
              const SizedBox(height: 15),
              InkWell(
                onTap: () {},
                child: const Text("Top Rated"),
              )
            ],
          ),
        ),
        actions: <Widget>[
          TextButton(
            style: TextButton.styleFrom(
              textStyle: Theme.of(context).textTheme.labelLarge,
            ),
            child: const Text('Cancel'),
            onPressed: () {
              Navigator.of(context).pop();
            },
          ),
          TextButton(
            style: TextButton.styleFrom(
              textStyle: Theme.of(context).textTheme.labelLarge,
            ),
            child: const Text('Filter'),
            onPressed: () {
              Navigator.of(context).pop();
            },
          ),
        ],
      );
    },
  );
}
