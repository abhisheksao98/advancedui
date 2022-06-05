import 'package:adavncedui/getx/cart_controller.dart';
import 'package:adavncedui/getx/shooping_Controller.dart';
import 'package:adavncedui/product.dart';
import 'package:adavncedui/product_service.dart';
import 'package:badges/badges.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_getx_widget.dart';

class ShoppingUi extends StatefulWidget {
  const ShoppingUi({Key? key}) : super(key: key);

  @override
  State<ShoppingUi> createState() => _ShoppingUiState();
}

class _ShoppingUiState extends State<ShoppingUi> {
  // List<Product> products = ProductService().getProducts();
  // // List<Product> products = <Product>[].obs;
  final shoppingController = Get.put(ShoppingController());
  final userCartController = Get.put(CartController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.lightBlue[700],
          title: Text(
            'Shopping Cart',
          ),
          centerTitle: true,
          leading: Icon(Icons.circle_notifications),
          actions: [
            Padding(
                padding: const EdgeInsets.only(right: 15, top: 9),
                child: Badge(
                  toAnimate: false,
                  child: Icon(Icons.shopping_cart),
                  badgeContent: GetX<CartController>(
                    builder: ((controller) {
                      return Text(
                          controller.selectedProducts.length.toString());
                    }),
                  ),
                ))
          ],
        ),
        body: GetX<ShoppingController>(builder: ((controller) {
          return ListView.builder(
              itemCount: controller.products.length,
              itemBuilder: (context, index) {
                return Container(
                    color: Colors.lightBlue[700],
                    // height: MediaQuery.of(context).size.height - 100,
                    width: MediaQuery.of(context).size.width,
                    child: ListView(
                        // mainAxisAlignment: MainAxisAlignment.start,
                        // crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Stack(children: [
                            const Padding(
                              padding: EdgeInsets.only(top: 35, left: 50),
                              child: Text(
                                'Welcome',
                                style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 22.0,
                                    fontWeight: FontWeight.bold),
                              ),
                            ),
                            Row(children: const [
                              Padding(
                                padding:
                                    const EdgeInsets.only(left: 10, top: 30),
                                child: CircleAvatar(
                                  backgroundImage: NetworkImage(
                                    'https://media.istockphoto.com/photos/studio-portrait-of-18-year-old-woman-with-brown-hair-picture-id1295120027?b=1&k=20&m=1295120027&s=170667a&w=0&h=xAOYYiTlswncFGASSWzPDkOPWRJ5uIvrVFHpI8NUEbM=',
                                  ),
                                  radius: 18,
                                ),
                              ),
                            ]),
                            const Padding(
                              padding: const EdgeInsets.only(top: 80, left: 70),
                              child: Text(
                                'What would you like to buy\n today? Search Below',
                                style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 18.0,
                                    fontWeight: FontWeight.bold),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(top: 150),
                              child: Container(
                                height: MediaQuery.of(context).size.height * 2,
                                decoration: const BoxDecoration(
                                    color: Colors.black87,
                                    borderRadius: BorderRadius.only(
                                        topLeft: Radius.circular(50),
                                        topRight: Radius.circular(50))),
                                child: Padding(
                                  padding: const EdgeInsets.only(
                                    top: 20,
                                    left: 30,
                                    right: 30,
                                  ),
                                  child: TextField(
                                    decoration: InputDecoration(
                                      labelText: 'Search',
                                      hintText: 'Search',
                                      fillColor: Colors.lightBlue[100],
                                      filled: true,
                                      suffixIcon: const Icon(Icons.search),
                                      border: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(50),
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            SizedBox(
                              height: 50,
                            ),
                            Padding(
                              padding: const EdgeInsets.only(top: 250),
                              child: GridView.count(
                                  physics: const ScrollPhysics(),
                                  scrollDirection: Axis.vertical,
                                  crossAxisSpacing: 10.0,
                                  mainAxisSpacing: 10.0,
                                  childAspectRatio: 0.65,
                                  crossAxisCount: 2,
                                  shrinkWrap: true,
                                  children: [
                                    // Positioned(
                                    //     top: 200,
                                    buildShopItems(1, 500, 5, 1),
                                    buildShopItems(578, 3, 12, 2),
                                    buildShopItems(300, 5, 0, 3),
                                    buildShopItems(200, 2, 0, 4),
                                    buildShopItems(100, 4, 0, 5),
                                  ]),
                            )
                          ])
                        ]));
              });
        })));
  }

  Widget buildShopItems(int comm, int likes, int price, int index) {
    body:
    GetX<ShoppingController>(builder: ((controller) {
      return
          // padding: index.isEven
          //     ? const EdgeInsets.only(right: 16.0)
          //     : const EdgeInsets.only(left: 16.0),
          Container(
        height: 120,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            border: Border.all(width: 1.0, style: BorderStyle.solid)),
        child: Stack(children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                height: 120.0,
                decoration: BoxDecoration(
                    borderRadius: const BorderRadius.only(
                        topLeft: Radius.circular(10.0),
                        topRight: Radius.circular(10.0)),
                    image: DecorationImage(
                      image: NetworkImage(controller.products[index].imageUrl),
                    )),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 8.0, top: 8.0),
                child: Text(
                  '${controller.products[index].productName}',
                  style: const TextStyle(fontSize: 14.0, color: Colors.white),
                ),
              ),
              const SizedBox(height: 4.0),
              Padding(
                padding: const EdgeInsets.only(left: 8.0, top: 8.0),
                child: Text(
                  '${controller.products[index].productId}',
                  style: TextStyle(fontSize: 12.0, color: Colors.white),
                ),
              ),
              const SizedBox(height: 4.0),
              Padding(
                padding: const EdgeInsets.only(left: 8.0, top: 8.0),
                child: Text(
                  '${controller.products[index].price}',
                  style: TextStyle(fontSize: 12.0, color: Colors.white),
                ),
              ),
              const SizedBox(height: 4.0),
              Padding(
                padding: const EdgeInsets.only(left: 5.0, top: 10.0),
                child: Row(
                  children: [
                    const Icon(
                      Icons.star,
                      color: Colors.yellow,
                    ),
                    const SizedBox(width: 2.0),
                    Text(
                      likes.toString(),
                      style:
                          const TextStyle(fontSize: 12.0, color: Colors.grey),
                    ),
                    const SizedBox(width: 2.0),
                    Icon(
                      Icons.chat_bubble,
                      color: Colors.grey.withOpacity(0.5),
                    ),
                    const SizedBox(width: 2.0),
                    Text(
                      comm.toString(),
                      style:
                          const TextStyle(fontSize: 12.0, color: Colors.grey),
                    ),
                  ],
                ),
              )
            ],
          ),
          Positioned(
              left: 130.0,
              top: 200.0,
              child: Container(
                height: 40.0,
                width: 40.0,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20.0),
                  color: Colors.amber,
                ),
                child: IconButton(
                    onPressed: () {
                      userCartController
                          .addProducttoCart(controller.products[index]);
                    },
                    icon: Icon(Icons.shopping_cart)),
              ))
        ]),
      );
    }));
    throw Exception('Null Value');
  }
}
