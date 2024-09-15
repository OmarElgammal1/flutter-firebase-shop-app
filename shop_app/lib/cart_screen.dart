import 'package:flutter/material.dart';
import 'product_card.dart';
import 'data.dart'; // Assuming this contains the cart and orders lists

class CartScreen extends StatefulWidget {
  final String screenType;

  CartScreen({required this.screenType});

  @override
  _CartScreenState createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  void _removeFromCart(int productId) {
    setState(() {
      cart.removeWhere((item) => item['id'] == productId);
    });
  }

  void _checkout() {
    setState(() {
      orders.addAll(cart);
      cart.clear();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.screenType),
      ),
      body: Column(
        children: [
          // Expanded ensures the grid takes up remaining space
          Expanded(
            child: GridView.builder(
              itemCount: cart.length,
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                crossAxisSpacing: 10,
                mainAxisSpacing: 10,
                childAspectRatio: 0.75,
              ),
              itemBuilder: (context, index) {
                var cartItem = cart[index];
                var productId = cartItem['id'];
                var size = cartItem['size'];

                var product = products[productId];

                if (product == null) {
                  return Center(child: Text('Product not found!'));
                }

                return ProductCard(
                  id: productId,
                  productName: product['productName'],
                  imageUrl: product['imageUrls'][0],
                  price: product['price'],
                  isFavorite: product['isFavorite'],
                  screenType: 'Cart',
                  size: size,
                  onRemoveFromCart: () {
                    _removeFromCart(productId);
                  },
                );
              },
            ),
          ),
          // Checkout Button
          if (cart.isNotEmpty)
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: ElevatedButton(
                onPressed: _checkout,
                style: ElevatedButton.styleFrom(
                  padding: EdgeInsets.symmetric(horizontal: 24, vertical: 12),
                  backgroundColor: Colors.purple,
                ),
                child: Text(
                  'Checkout',
                  style: TextStyle(fontSize: 18, color: Colors.white),
                ),
              ),
            ),
        ],
      ),
    );
  }
}
