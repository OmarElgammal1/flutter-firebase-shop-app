import 'package:flutter/material.dart';
import 'product_card.dart';
import 'shop_app_bar.dart';
import 'nav_bar.dart';


// Sample data
List<Map<String, dynamic>> products = [
  {
    'productName': 'Nike Sportswear Club Fleece',
    'price': 99.0,
    'imageUrl': 'https://en-kw.sssports.com/dw/image/v2/BDVB_PRD/on/demandware.static/-/Sites-akeneo-master-catalog/default/dw58f7d23c/sss/SSS2/N/K/C/Z/7/SSS2_NKCZ7718_510_194501879071_1.jpg?sw=700&sh=700&sm=fit',
    'isFavorite': true,
  },
  {
    'productName': 'Trail Running Jacket Nike Windrunner',
    'price': 99.0,
    'imageUrl': 'https://en-kw.sssports.com/dw/image/v2/BDVB_PRD/on/demandware.static/-/Sites-akeneo-master-catalog/default/dw58f7d23c/sss/SSS2/N/K/C/Z/7/SSS2_NKCZ7718_510_194501879071_1.jpg?sw=700&sh=700&sm=fit',
    'isFavorite': false,
  },
  {
    'productName': 'Training Top Nike Sport Clash',
    'price': 99.0,
    'imageUrl': 'https://en-kw.sssports.com/dw/image/v2/BDVB_PRD/on/demandware.static/-/Sites-akeneo-master-catalog/default/dw58f7d23c/sss/SSS2/N/K/C/Z/7/SSS2_NKCZ7718_510_194501879071_1.jpg?sw=700&sh=700&sm=fit',
    'isFavorite': false,
  },
  {
    'productName': 'Trail Running Jacket Nike Windrunner',
    'price': 99.0,
    'imageUrl': 'https://en-kw.sssports.com/dw/image/v2/BDVB_PRD/on/demandware.static/-/Sites-akeneo-master-catalog/default/dw58f7d23c/sss/SSS2/N/K/C/Z/7/SSS2_NKCZ7718_510_194501879071_1.jpg?sw=700&sh=700&sm=fit',
    'isFavorite': true,
  },
  {
    'productName': 'Training Top Nike Sport Clash',
    'price': 99.0,
    'imageUrl': 'https://en-kw.sssports.com/dw/image/v2/BDVB_PRD/on/demandware.static/-/Sites-akeneo-master-catalog/default/dw58f7d23c/sss/SSS2/N/K/C/Z/7/SSS2_NKCZ7718_510_194501879071_1.jpg?sw=700&sh=700&sm=fit',
    'isFavorite': false,
  },
  {
    'productName': 'Trail Running Jacket Nike Windrunner',
    'price': 99.0,
    'imageUrl': 'https://en-kw.sssports.com/dw/image/v2/BDVB_PRD/on/demandware.static/-/Sites-akeneo-master-catalog/default/dw58f7d23c/sss/SSS2/N/K/C/Z/7/SSS2_NKCZ7718_510_194501879071_1.jpg?sw=700&sh=700&sm=fit',
    'isFavorite': true,
  },
  {
    'productName': 'Training Top Nike Sport Clash',
    'price': 99.0,
    'imageUrl': 'https://en-kw.sssports.com/dw/image/v2/BDVB_PRD/on/demandware.static/-/Sites-akeneo-master-catalog/default/dw58f7d23c/sss/SSS2/N/K/C/Z/7/SSS2_NKCZ7718_510_194501879071_1.jpg?sw=700&sh=700&sm=fit',
    'isFavorite': false,
  },
  {
    'productName': 'Trail Running Jacket Nike Windrunner',
    'price': 99.0,
    'imageUrl': 'https://en-kw.sssports.com/dw/image/v2/BDVB_PRD/on/demandware.static/-/Sites-akeneo-master-catalog/default/dw58f7d23c/sss/SSS2/N/K/C/Z/7/SSS2_NKCZ7718_510_194501879071_1.jpg?sw=700&sh=700&sm=fit',
    'isFavorite': true,
  },
  {
    'productName': 'Training Top Nike Sport Clash',
    'price': 99.0,
    'imageUrl': 'https://en-kw.sssports.com/dw/image/v2/BDVB_PRD/on/demandware.static/-/Sites-akeneo-master-catalog/default/dw58f7d23c/sss/SSS2/N/K/C/Z/7/SSS2_NKCZ7718_510_194501879071_1.jpg?sw=700&sh=700&sm=fit',
    'isFavorite': false,
  },
  {
    'productName': 'Trail Running Jacket Nike Windrunner',
    'price': 99.0,
    'imageUrl': 'https://en-kw.sssports.com/dw/image/v2/BDVB_PRD/on/demandware.static/-/Sites-akeneo-master-catalog/default/dw58f7d23c/sss/SSS2/N/K/C/Z/7/SSS2_NKCZ7718_510_194501879071_1.jpg?sw=700&sh=700&sm=fit',
    'isFavorite': true,
  },
];

class ProductScreen extends StatelessWidget {
  final String screenType; // Pass 'Wishlist', 'Cart', etc.

  ProductScreen({required this.screenType});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: ShopAppBar(
        title: screenType,
      ),
      body: GridView.builder(
        itemCount: products.length,
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2, // items per row
        ),
        itemBuilder: (context, index) {
          var product = products[index];
          return ProductCard(
            productName: product['productName'],
            imageUrl: product['imageUrl'],
            price: product['price'],
            isFavorite: product['isFavorite'],
            screenType: screenType,
            onAddToCart: () {
              // Example of adding to cart
              print('${product['productName']} added to cart');
            },
            onRemoveFromWishlist: () {
              // Example of removing from wishlist
              print('${product['productName']} removed from wishlist');
            },
          );
        },
      ),
      bottomNavigationBar: ShopNavBar(),
    );
  }
}
