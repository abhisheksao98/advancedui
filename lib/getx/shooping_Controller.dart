import 'package:adavncedui/product.dart';
import 'package:get/get.dart';
import 'package:adavncedui/product_service.dart';

class ShoppingController extends GetxController {
  List<Product> products = <Product>[].obs;

  @override
  void onInit() {
    super.onInit();
    getProductDetails();
  }

  void getProductDetails() async {
    products.assignAll(ProductService().getProducts().toList());
  }
}
