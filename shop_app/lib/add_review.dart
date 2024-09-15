import 'package:flutter/material.dart';
import 'data.dart';
import 'package:intl/intl.dart'; // For date formatting

class AddReviewScreen extends StatefulWidget {
  final int id;

  AddReviewScreen({required this.id});

  @override
  _AddReviewScreenState createState() => _AddReviewScreenState();
}

class _AddReviewScreenState extends State<AddReviewScreen> {
  double rating = 2.5;
  final TextEditingController nameController = TextEditingController();
  final TextEditingController experienceController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context); // Handle back action
          },
        ),
        title: Text('Add Review'),
        backgroundColor: Colors.white,
        foregroundColor: Colors.black,
        elevation: 0,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Name",
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 16,
              ),
            ),
            SizedBox(height: 8),
            TextField(
              controller: nameController,
              decoration: InputDecoration(
                hintText: 'Type your name',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
              ),
            ),
            SizedBox(height: 16),
            Text(
              "How was your experience?",
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 16,
              ),
            ),
            SizedBox(height: 8),
            TextField(
              controller: experienceController,
              maxLines: 5,
              decoration: InputDecoration(
                hintText: 'Describe your experience',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
              ),
            ),
            SizedBox(height: 16),
            Text(
              "Rating",
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 16,
              ),
            ),
            Slider(
              value: rating,
              min: 0.0,
              max: 5.0,
              divisions: 5,
              activeColor: Colors.purple,
              onChanged: (newRating) {
                setState(() {
                  rating = newRating;
                });
              },
            ),
            SizedBox(height: 16),
            Center(
              child: ElevatedButton(
                onPressed: _submitReview,
                child: Text("Submit Review"),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.purple,
                  padding: EdgeInsets.symmetric(horizontal: 24, vertical: 12),
                  textStyle: TextStyle(fontSize: 16),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  void _submitReview() {
    String name = nameController.text;
    String experience = experienceController.text;

    if (name.isEmpty || experience.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Please provide a name and review details')),
      );
      return;
    }

    String currentDate = DateFormat('dd MMM yyyy').format(DateTime.now());

    Map<String, Object> newReview = {
      'name': name,
      'date': currentDate,
      'details': experience,
      'stars': rating,
    };

    if (products.containsKey(widget.id)) {
      List<Map<String, Object>> reviews = (products[widget.id]?['reviews'] as List<dynamic>?)
          ?.cast<Map<String, Object>>() ??
          <Map<String, Object>>[];
      reviews.add(newReview);
      products[widget.id]?['reviews'] = reviews;
      Navigator.pop(context, true);
    } else {

      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Product not found')),
      );
    }
  }

}
