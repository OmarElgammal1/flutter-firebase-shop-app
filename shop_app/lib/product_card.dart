import 'package:flutter/material.dart';
import 'package:untitled/data.dart';
import 'product_details_screen.dart';

class ProductCard extends StatefulWidget {
  final int id;
  final String productName;
  final String imageUrl;
  final double price;
  final bool isFavorite;
  final String screenType;
  final VoidCallback? onAddToCart;
  final VoidCallback? onRemoveFromWishlist;

  ProductCard({
    required this.id,
    required this.productName,
    required this.imageUrl,
    required this.price,
    this.isFavorite = false,
    required this.screenType,
    this.onAddToCart,
    this.onRemoveFromWishlist,
  });

  @override
  _ProductCardState createState() => _ProductCardState();
}

class _ProductCardState extends State<ProductCard> {
  late bool _isFavorite;

  @override
  void initState() {
    super.initState();
    _isFavorite = widget.isFavorite;
  }

  void toggleFavorite() {
    setState(() {
      _isFavorite = !_isFavorite;
    });

    products[widget.id]?['isFavorite'] = _isFavorite;
    print(products[widget.id]?['isFavorite']);
    /*if (_isFavorite) {
      print('${widget.productName} added to wishlist');
    } else {
      print('${widget.productName} removed from wishlist');
    }*/
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        // Navigate to ProductDetailScreen with the product id
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => ProductDetailScreen(id: widget.id),
          ),
        );
      },
      child: Card(
        elevation: 5,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Stack(
              children: [
                Image.network(widget.imageUrl,
                    fit: BoxFit.cover, height: 120, width: double.infinity),
                Positioned(
                  top: 8,
                  right: 8,
                  child: GestureDetector(
                    onTap: toggleFavorite,
                    child: Icon(
                      _isFavorite ? Icons.favorite : Icons.favorite_border,
                      color: _isFavorite ? Colors.red : Colors.grey,
                    ),
                  ),
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(widget.productName,
                      style: TextStyle(fontWeight: FontWeight.bold)),
                  Text("\$${widget.price.toString()}",
                      style: TextStyle(color: Colors.grey)),
                ],
              ),
            ),
            if (widget.screenType == 'Cart')
              IconButton(
                icon: Icon(Icons.delete),
                onPressed: () {
                  if (widget.onRemoveFromWishlist != null)
                    widget.onRemoveFromWishlist!();
                },
              ),
          ],
        ),
      ),
    );
  }
}
