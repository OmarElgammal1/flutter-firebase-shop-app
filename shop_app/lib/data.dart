import 'package:flutter/material.dart';




Map<int, Map<String, dynamic>> products = {
  1: {
  'productName': 'Nike Sportswear Club Fleece',
  'price': 99.0,
  'imageUrls': ['https://en-kw.sssports.com/dw/image/v2/BDVB_PRD/on/demandware.static/-/Sites-akeneo-master-catalog/default/dw58f7d23c/sss/SSS2/N/K/C/Z/7/SSS2_NKCZ7718_510_194501879071_1.jpg?sw=700&sh=700&sm=fit', 'https://en-kw.sssports.com/dw/image/v2/BDVB_PRD/on/demandware.static/-/Sites-akeneo-master-catalog/default/dw58f7d23c/sss/SSS2/N/K/C/Z/7/SSS2_NKCZ7718_510_194501879071_1.jpg?sw=700&sh=700&sm=fit'],
  'isFavorite': true,
  'reviews': {"name": "Mohsen", "date": "10 Sep 2024", "details": "Very good product", "stars": 4.5}
  }
};


List<Map<String, dynamic>> cart = [{'id': 1, "quantity": 12, "size": "XL"}];

List<Map<String, dynamic>> orders = [{'id': 1, "quantity": 12, "size": "XL"}];