import '../product.dart';

class ProductService {
  List<Product> getProducts() {
    List<Product> products = [
      Product(
        productId: 101,
        productName: 'Macbook Pro',
        price: 145000,
        imageUrl:
            'https://icdn.digitaltrends.com/image/digitaltrends/macbook-pro-2021-01.jpg',
      ),
      Product(
        productId: 102,
        productName: 'Sony Handy Cam',
        price: 65000,
        imageUrl:
            'https://5.imimg.com/data5/JR/ST/MY-60738950/sony-professional-video-camera-500x500.jpg',
      ),
      Product(
        productId: 103,
        productName: 'LG 75inch Flat Panel',
        price: 245000,
        imageUrl:
            'https://5.imimg.com/data5/GX/TO/EZ/ANDROID-4363282/images-jpeg-14-jpg-500x500.jpg',
      ),
      Product(
        productId: 104,
        productName: 'Macbook Pro M1 Chip',
        price: 145000,
        imageUrl:
            'https://icdn.digitaltrends.com/image/digitaltrends/macbook-pro-2021-01.jpg',
      ),
      Product(
        productId: 105,
        productName: 'Sony Handy Cam Old Model',
        price: 65000,
        imageUrl:
            'https://5.imimg.com/data5/JR/ST/MY-60738950/sony-professional-video-camera-500x500.jpg',
      ),
      Product(
        productId: 106,
        productName: 'LG 75inch Interactive Flat Panel',
        price: 245000,
        imageUrl:
            'https://5.imimg.com/data5/GX/TO/EZ/ANDROID-4363282/images-jpeg-14-jpg-500x500.jpg',
      )
    ];
    return products;
  }
}
