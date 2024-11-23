import 'package:flutter/material.dart';

class CustomProductImageViewer extends StatefulWidget {
  final List<String> images;

  CustomProductImageViewer({required this.images});

  @override
  _CustomProductImageViewerState createState() => _CustomProductImageViewerState();
}

class _CustomProductImageViewerState extends State<CustomProductImageViewer> {
  int currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        // Main Image
        Container(
          width: double.infinity,
          height: 450,
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage(widget.images[currentIndex]),
              fit: BoxFit.cover,
            ),
          ),
        ),
        SizedBox(height: 16),
        // Thumbnail Images
        Container(
          height: 72,
          padding: EdgeInsets.symmetric(horizontal: 16.0),
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: widget.images.length,
            itemBuilder: (context, index) {
              return GestureDetector(
                onTap: () {
                  setState(() {
                    currentIndex = index;
                  });
                },
                child: Container(
                  width: 72,
                  height: 72,
                  margin: EdgeInsets.only(right: 16.0),
                  decoration: BoxDecoration(
                    color: Color(0xFFB3A5A5),
                    image: DecorationImage(
                      image: AssetImage(widget.images[index]),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              );
            },
          ),
        ),
      ],
    );
  }
}