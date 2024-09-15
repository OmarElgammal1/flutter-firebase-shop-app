import 'package:flutter/material.dart';
import 'data.dart';
import 'product_details_screen.dart';

class ProductCard extends StatefulWidget {
  final int id;
  final String productName;
  final String imageUrl;
  final double price;
  final bool isFavorite;
  final String screenType;
  final VoidCallback? onAddToCart;
  final VoidCallback? onRemoveFromCart;
  final String? size; // New optional size attribute

  ProductCard({
    required this.id,
    required this.productName,
    required this.imageUrl,
    required this.price,
    this.isFavorite = false,
    required this.screenType,
    this.onAddToCart,
    this.onRemoveFromCart,
    this.size, // Accepting optional size
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
        child: Stack(
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Stack(
                  children: [
                    // Product Image
                    Image.network(widget.imageUrl,
                        fit: BoxFit.cover, height: 120, width: double.infinity),

                    // Favorite Icon (Top-right corner)
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
                // Product Name and Price
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

              ],
            ),
            // Delete button for Cart screen
            if (widget.screenType == 'Cart')
              Positioned(
                bottom: 0,
                right: 50,
                child: IconButton(
                  icon: Icon(Icons.delete),
                  onPressed: () {
                    if (widget.onRemoveFromCart != null)
                      widget.onRemoveFromCart!();
                  },
                ),
              ),
            // Size display (bottom-right corner)
            if (widget.size != null)
              Positioned(
                bottom: 8,
                right: 8,
                child: Container(
                  padding: EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                  decoration: BoxDecoration(
                    color: Colors.grey.withOpacity(0.6),
                    borderRadius: BorderRadius.circular(4),
                  ),
                  child: Text(
                    widget.size!,
                    style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                    ),
                  ),
                ),
              ),
          ],
        ),
      ),
    );
  }
}
