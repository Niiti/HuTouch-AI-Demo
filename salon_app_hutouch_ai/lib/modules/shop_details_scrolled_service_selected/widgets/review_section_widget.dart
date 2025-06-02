/* SELECTED CODE START */
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class ReviewSectionWidget extends StatelessWidget {
  const ReviewSectionWidget({Key? key}) : super(key: key);

  Future<List<Review>> _fetchReviews() async {
    final response = await http.get(Uri.parse('https://6803759d-2bfb-4aa4-8ab1-ddc2ace685e8.mock.pstmn.io/get_reviews_list'));
    if (response.statusCode == 200) {
      List<dynamic> data = json.decode(response.body);
      return data.map<Review>((json) => Review.fromJson(json)).toList();
    } else {
      throw Exception('Failed to load reviews');
    }
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return FutureBuilder<List<Review>>(
      future: _fetchReviews(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(child: CircularProgressIndicator());
        } else if (snapshot.hasError) {
          return Center(child: Text('Error: ${snapshot.error}'));
        } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
          return const Center(child: Text('No reviews available'));
        } else {
          return Padding(
            padding: EdgeInsets.symmetric(horizontal: size.width * 0.05),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Reviews',
                      style: TextStyle(
                        fontSize: size.height * 0.025,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      'View All',
                      style: TextStyle(
                        fontSize: size.height * 0.02,
                        fontWeight: FontWeight.w600,
                        color: Colors.blue,
                      ),
                    ),
                  ],
                ),
                SizedBox(height: size.height * 0.01),
                ...snapshot.data!.map((review) => ReviewCardWidget(
                  reviewerName: review.reviewerName,
                  reviewText: review.reviewText,
                  timeAgo: review.timeAgo,
                  imageAsset: review.imageAsset,
                )).toList(),
              ],
            ),
          );
        }
      },
    );
  }
}

class Review {
  final String reviewerName;
  final String reviewText;
  final String timeAgo;
  final String imageAsset;

  Review({
    required this.reviewerName,
    required this.reviewText,
    required this.timeAgo,
    required this.imageAsset,
  });

  factory Review.fromJson(Map<String, dynamic> json) {
    return Review(
      reviewerName: json['name'],  // Changed 'reviewerName' to 'name'
      reviewText: json['comment'],  // Changed 'reviewText' to 'comment'
      timeAgo: json['date'],  // Changed 'timeAgo' to 'date'
      imageAsset: json['imageUrl'] ?? '',  // Changed 'imageAsset' to 'imageUrl'
    );
  }
}

class ReviewCardWidget extends StatelessWidget {
  final String reviewerName;
  final String reviewText;
  final String timeAgo;
  final String imageAsset;

  const ReviewCardWidget({
    Key? key,
    required this.reviewerName,
    required this.reviewText,
    required this.timeAgo,
    required this.imageAsset,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ListTile(
          leading: CircleAvatar(
            backgroundImage: NetworkImage(imageAsset),
          ),
          title: Text(reviewerName),
          subtitle: Text(reviewText),
          trailing: Text(timeAgo),
        ),
        Divider(),
      ],
    );
  }
}

/* SELECTED CODE END */