import 'package:adavncedui/product.dart';
import 'package:get/get.dart';

class CartController extends GetxController {
  List<Product> selectedProducts = <Product>[].obs;

  void addProducttoCart(Product product) {
    selectedProducts.add(product);
  }

  void removeProduct(Product product) {
    selectedProducts.remove(product);
  }

  double get totalPrice => selectedProducts.fold(
      0, (total, selectedProduct) => total + selectedProduct.price);
}
