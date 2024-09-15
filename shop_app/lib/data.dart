import 'package:flutter/material.dart';




Map<int, Map<String, dynamic>> products = {
  1: {
    'productName': 'Nike Sportswear Club Fleece',
    'price': 99.0,
    'imageUrls': [
      'https://en-kw.sssports.com/dw/image/v2/BDVB_PRD/on/demandware.static/-/Sites-akeneo-master-catalog/default/dw58f7d23c/sss/SSS2/N/K/C/Z/7/SSS2_NKCZ7718_510_194501879071_1.jpg?sw=700&sh=700&sm=fit',
      'https://en-kw.sssports.com/dw/image/v2/BDVB_PRD/on/demandware.static/-/Sites-akeneo-master-catalog/default/dw29b01461/sss/SSS2/N/K/D/R/7/SSS2_NKDR7571_010_196147019378_2.jpg?sw=700&sh=700&sm=fit',
      'https://en-kw.sssports.com/dw/image/v2/BDVB_PRD/on/demandware.static/-/Sites-akeneo-master-catalog/default/dw29b01461/sss/SSS2/N/K/D/R/7/SSS2_NKDR7571_010_196147019378_2.jpg?sw=700&sh=700&sm=fit'
    ],
    'isFavorite': true,
    'reviews': [
      {"name": "Mohsen", "date": "10 Sep 2024", "details": "Very good product", "stars": 4.5},
      {"name": "Amina", "date": "12 Sep 2024", "details": "Loved it, fits perfectly!", "stars": 4.7}
    ]
  },
  2: {
    'productName': 'Adidas Ultraboost Running Shoes',
    'price': 150.0,
    'imageUrls': [
      'https://en-kw.sssports.com/dw/image/v2/BDVB_PRD/on/demandware.static/-/Sites-akeneo-master-catalog/default/dw1afdec19/sss/SSS2/N/K/A/R/4/SSS2_NKAR4997_101_191888618378_1.jpg?sw=700&sh=700&sm=fit',
      'https://en-kw.sssports.com/dw/image/v2/BDVB_PRD/on/demandware.static/-/Sites-akeneo-master-catalog/default/dwffa71423/sss/SSS2/N/K/D/R/7/SSS2_NKDR7571_010_196147019378_1.jpg?sw=700&sh=700&sm=fit'
    ],
    'isFavorite': false,
    'reviews': [
      {"name": "John", "date": "05 Sep 2024", "details": "Super comfortable!", "stars": 4.8},
      {"name": "Chris", "date": "01 Aug 2024", "details": "Great for running long distances", "stars": 4.6}
    ]
  },
  3: {
    'productName': 'Puma Essentials Hoodie',
    'price': 60.0,
    'imageUrls': [
      'https://en-kw.sssports.com/dw/image/v2/BDVB_PRD/on/demandware.static/-/Sites-akeneo-master-catalog/default/dwffa71423/sss/SSS2/N/K/D/R/7/SSS2_NKDR7571_010_196147019378_1.jpg?sw=700&sh=700&sm=fit',
      'https://en-kw.sssports.com/dw/image/v2/BDVB_PRD/on/demandware.static/-/Sites-akeneo-master-catalog/default/dwffa71423/sss/SSS2/N/K/D/R/7/SSS2_NKDR7571_010_196147019378_1.jpg?sw=700&sh=700&sm=fit'
    ],
    'isFavorite': true,
    'reviews': [
      {"name": "Sarah", "date": "15 Aug 2024", "details": "Perfect for winter", "stars": 4.3},
      {"name": "James", "date": "28 Aug 2024", "details": "Great quality, but runs a bit large", "stars": 4.0}
    ]
  },
  4: {
    'productName': 'Under Armour Charged Bandit 6',
    'price': 85.0,
    'imageUrls': [
      'https://en-kw.sssports.com/dw/image/v2/BDVB_PRD/on/demandware.static/-/Sites-akeneo-master-catalog/default/dw58f7d23c/sss/SSS2/N/K/C/Z/7/SSS2_NKCZ7718_510_194501879071_1.jpg?sw=700&sh=700&sm=fit',
      'https://en-kw.sssports.com/dw/image/v2/BDVB_PRD/on/demandware.static/-/Sites-akeneo-master-catalog/default/dw58f7d23c/sss/SSS2/N/K/C/Z/7/SSS2_NKCZ7718_510_194501879071_1.jpg?sw=700&sh=700&sm=fit'

    ],
    'isFavorite': false,
    'reviews': [
      {"name": "Mike", "date": "22 Jul 2024", "details": "Great value for the price", "stars": 4.2},
      {"name": "Anna", "date": "19 Jul 2024", "details": "Comfortable but not durable", "stars": 3.9}
    ]
  },
  5: {
    'productName': 'Reebok Classic Leather Sneakers',
    'price': 90.0,
    'imageUrls': [
      'https://en-kw.sssports.com/dw/image/v2/BDVB_PRD/on/demandware.static/-/Sites-akeneo-master-catalog/default/dw1afdec19/sss/SSS2/N/K/A/R/4/SSS2_NKAR4997_101_191888618378_1.jpg?sw=700&sh=700&sm=fit',
      'https://en-kw.sssports.com/dw/image/v2/BDVB_PRD/on/demandware.static/-/Sites-akeneo-master-catalog/default/dwffa71423/sss/SSS2/N/K/D/R/7/SSS2_NKDR7571_010_196147019378_1.jpg?sw=700&sh=700&sm=fit'

    ],
    'isFavorite': true,
    'reviews': [
      {"name": "Emily", "date": "02 Sep 2024", "details": "Classic and comfortable", "stars": 4.7},
      {"name": "Tom", "date": "18 Aug 2024", "details": "Good quality but a bit narrow", "stars": 4.2}
    ]
  },
  6: {
    'productName': 'Asics Gel-Kayano 27',
    'price': 160.0,
    'imageUrls': [
      'https://en-kw.sssports.com/dw/image/v2/BDVB_PRD/on/demandware.static/-/Sites-akeneo-master-catalog/default/dwffa71423/sss/SSS2/N/K/D/R/7/SSS2_NKDR7571_010_196147019378_1.jpg?sw=700&sh=700&sm=fit',
      'https://en-kw.sssports.com/dw/image/v2/BDVB_PRD/on/demandware.static/-/Sites-akeneo-master-catalog/default/dwffa71423/sss/SSS2/N/K/D/R/7/SSS2_NKDR7571_010_196147019378_1.jpg?sw=700&sh=700&sm=fit'
    ],
    'isFavorite': false,
    'reviews': [
      {"name": "Alex", "date": "12 Sep 2024", "details": "Great for long runs", "stars": 4.9},
      {"name": "Dylan", "date": "03 Sep 2024", "details": "Excellent support for runners", "stars": 4.8}
    ]
  },
  7: {
    'productName': 'New Balance 574 Core',
    'price': 80.0,
    'imageUrls': [
      'https://en-kw.sssports.com/dw/image/v2/BDVB_PRD/on/demandware.static/-/Sites-akeneo-master-catalog/default/dw1afdec19/sss/SSS2/N/K/A/R/4/SSS2_NKAR4997_101_191888618378_1.jpg?sw=700&sh=700&sm=fit',
      'https://en-kw.sssports.com/dw/image/v2/BDVB_PRD/on/demandware.static/-/Sites-akeneo-master-catalog/default/dwffa71423/sss/SSS2/N/K/D/R/7/SSS2_NKDR7571_010_196147019378_1.jpg?sw=700&sh=700&sm=fit'
    ],
    'isFavorite': true,
    'reviews': [
      {"name": "Chris", "date": "18 Aug 2024", "details": "Retro style, love it!", "stars": 4.6},
      {"name": "Laura", "date": "22 Aug 2024", "details": "Stylish but not the best fit", "stars": 4.0}
    ]
  },
  8: {
    'productName': 'Converse Chuck Taylor All Star',
    'price': 55.0,
    'imageUrls': [
      'https://en-kw.sssports.com/dw/image/v2/BDVB_PRD/on/demandware.static/-/Sites-akeneo-master-catalog/default/dw1afdec19/sss/SSS2/N/K/A/R/4/SSS2_NKAR4997_101_191888618378_1.jpg?sw=700&sh=700&sm=fit',
      'https://en-kw.sssports.com/dw/image/v2/BDVB_PRD/on/demandware.static/-/Sites-akeneo-master-catalog/default/dwffa71423/sss/SSS2/N/K/D/R/7/SSS2_NKDR7571_010_196147019378_1.jpg?sw=700&sh=700&sm=fit'
    ],
    'isFavorite': false,
    'reviews': [
      {"name": "Taylor", "date": "30 Jul 2024", "details": "A timeless classic", "stars": 4.8},
      {"name": "Jake", "date": "15 Jul 2024", "details": "Not as durable as expected", "stars": 3.9}
    ]
  },
  9: {
    'productName': 'Vans Old Skool',
    'price': 65.0,
    'imageUrls': [
      'https://en-kw.sssports.com/dw/image/v2/BDVB_PRD/on/demandware.static/-/Sites-akeneo-master-catalog/default/dw1afdec19/sss/SSS2/N/K/A/R/4/SSS2_NKAR4997_101_191888618378_1.jpg?sw=700&sh=700&sm=fit',
      'https://en-kw.sssports.com/dw/image/v2/BDVB_PRD/on/demandware.static/-/Sites-akeneo-master-catalog/default/dwffa71423/sss/SSS2/N/K/D/R/7/SSS2_NKDR7571_010_196147019378_1.jpg?sw=700&sh=700&sm=fit'
    ],
    'isFavorite': true,
    'reviews': [
      {"name": "Jordan", "date": "05 Sep 2024", "details": "Durable and stylish", "stars": 4.4},
      {"name": "Amanda", "date": "02 Sep 2024", "details": "Fits well, and looks amazing", "stars": 4.6}
    ]
  },
  10: {
    'productName': 'Fila Disruptor II',
    'price': 70.0,
    'imageUrls': [
      'https://en-kw.sssports.com/dw/image/v2/BDVB_PRD/on/demandware.static/-/Sites-akeneo-master-catalog/default/dw1afdec19/sss/SSS2/N/K/A/R/4/SSS2_NKAR4997_101_191888618378_1.jpg?sw=700&sh=700&sm=fit',
      'https://en-kw.sssports.com/dw/image/v2/BDVB_PRD/on/demandware.static/-/Sites-akeneo-master-catalog/default/dwffa71423/sss/SSS2/N/K/D/R/7/SSS2_NKDR7571_010_196147019378_1.jpg?sw=700&sh=700&sm=fit'
    ],
    'isFavorite': false,
    'reviews': [
      {"name": "Leslie", "date": "28 Aug 2024", "details": "Chunky but comfortable", "stars": 4.3},
      {"name": "Harper", "date": "20 Aug 2024", "details": "Stylish but heavy", "stars": 4.1}
    ]
  }
};



List<Map<String, dynamic>> cart = [{'id': 1, "quantity": 12, "size": "XL"}];

List<Map<String, dynamic>> orders = [{'id': 1, "quantity": 12, "size": "XL"}];