import 'package:flutter/material.dart';
import 'shop_app_bar.dart';
import 'add_review.dart';
import 'data.dart';

class ReviewsScreen extends StatefulWidget {
  final int id;

  ReviewsScreen({required this.id});

  @override
  _ReviewsScreenState createState() => _ReviewsScreenState();
}

class _ReviewsScreenState extends State<ReviewsScreen> {
  late List reviews;

  @override
  void initState() {
    super.initState();
    reviews = products[widget.id]?['reviews'];
  }

  @override
  Widget build(BuildContext context) {
    final product = products[widget.id];

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: ShopAppBar(title: "Reviews"),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        '${reviews.length} Reviews',
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(height: 8),
                      Row(
                        children: [
                          Text(
                            reviews.isNotEmpty
                                ? _calculateAverageRating(reviews).toStringAsFixed(1)
                                : '0.0',
                            style: TextStyle(
                              fontSize: 16,
                            ),
                          ),
                          SizedBox(width: 4),
                          Row(
                            children: List.generate(5, (index) {
                              return Icon(
                                index < _calculateAverageRating(reviews).floor()
                                    ? Icons.star
                                    : index == _calculateAverageRating(reviews).floor() &&
                                    _calculateAverageRating(reviews) % 1 != 0
                                    ? Icons.star_half
                                    : Icons.star_border,
                                color: Colors.orange,
                                size: 16,
                              );
                            }),
                          ),
                        ],
                      ),
                    ],
                  ),
                  TextButton.icon(
                    onPressed: () async {
                      bool? isReviewAdded = await Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => AddReviewScreen(
                            id: widget.id,
                          ),
                        ),
                      );

                      if (isReviewAdded == true) {
                        setState(() {
                          reviews = products[widget.id]?['reviews'];
                        });
                      }
                    },
                    icon: Icon(Icons.edit, color: Colors.white),
                    label: Text(
                      'Add Review',
                      style: TextStyle(color: Colors.white),
                    ),
                    style: TextButton.styleFrom(
                      backgroundColor: Colors.orange,
                      padding: EdgeInsets.symmetric(vertical: 8, horizontal: 16),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(4),
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 20.0),
              ListView.separated(
                physics: NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                itemBuilder: (context, index) => buildChatItem(reviews[index]),
                separatorBuilder: (context, index) => SizedBox(height: 20.0),
                itemCount: reviews.length,
              ),
            ],
          ),
        ),
      ),
    );
  }

  double _calculateAverageRating(List reviews) {
    if (reviews.isEmpty) return 0.0;
    double total = reviews.fold(0.0, (sum, review) => sum + review['stars']);
    return total / reviews.length;
  }

  Widget buildChatItem(review) => Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              CircleAvatar(
                radius: 30.0,
                backgroundImage: NetworkImage(
                  'https://img.freepik.com/free-photo/portrait-man-laughing_23-2148859448.jpg?size=338&ext=jpg&ga=GA1.1.2008272138.1726272000&semt=ais_hybrid',
                ),
              ),
              SizedBox(width: 15.0),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    review['name'],
                    style: TextStyle(
                      fontSize: 16.0,
                      fontWeight: FontWeight.bold,
                    ),
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                  SizedBox(height: 5.0),
                  Row(
                    children: [
                      Icon(
                        Icons.access_time,
                        color: Colors.grey,
                        size: 14.0,
                      ),
                      SizedBox(width: 4),
                      Text(
                        review['date'],
                        style: TextStyle(
                          color: Colors.grey,
                          fontSize: 14.0,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ],
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Row(
                children: [
                  Text(
                    review['stars'].toStringAsFixed(1),
                    style: TextStyle(
                      fontSize: 16.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(width: 4),
                  Text(
                    'rating',
                    style: TextStyle(
                      fontSize: 14.0,
                      color: Colors.grey,
                    ),
                  ),
                ],
              ),
              SizedBox(height: 5.0),
              Row(
                children: List.generate(5, (index) {
                  return Icon(
                    index < review['stars'].floor()
                        ? Icons.star
                        : index == review['stars'].floor() && review['stars'] % 1 != 0
                        ? Icons.star_half
                        : Icons.star_border,
                    color: Colors.orange,
                    size: 16,
                  );
                }),
              ),
            ],
          ),
        ],
      ),
      SizedBox(height: 10.0),
      Text(
        review['details'],
        maxLines: 3,
        overflow: TextOverflow.ellipsis,
        style: TextStyle(
          fontSize: 14.0,
          color: Colors.grey[700],
        ),
      ),
    ],
  );
}
