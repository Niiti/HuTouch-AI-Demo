import 'package:flutter/material.dart';

void main() {
  runApp(CategoryPage());
}

class CategoryPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: GeneratedUI(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class GeneratedUI extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    double padding = width * 0.05;
    double iconSize = width * 0.06;
    double fontSize = width * 0.04;

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(height * 0.1),
        child: AppBar(
          leading: IconButton(
            icon: Icon(Icons.arrow_back, color: Colors.white, size: iconSize),
            onPressed: () {},
          ),
          title: Text(
            'All Categories',
            style: TextStyle(
              color: Colors.white,
              fontSize: fontSize * 1.2,
              fontWeight: FontWeight.bold,
            ),
          ),
          actions: [
            IconButton(
              icon: Icon(Icons.search, color: Colors.white, size: iconSize),
              onPressed: () {},
            ),
            IconButton(
              icon: Icon(Icons.shopping_cart,
                  color: Colors.white, size: iconSize),
              onPressed: () {},
            ),
          ],
          backgroundColor: Color(0xFFD0021B),
        ),
      ),
      body: Column(
        children: [
          Expanded(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: padding),
              child: GridView.builder(
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 3,
                  mainAxisSpacing: height * 0.02,
                  crossAxisSpacing: width * 0.04,
                ),
                itemCount: categories.length,
                itemBuilder: (context, index) {
                  return CategoryItem(
                    imagePath: categories[index].imagePath,
                    label: categories[index].label,
                    fontSize: fontSize,
                  );
                },
              ),
            ),
          ),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.grid_view, color: Color.fromRGBO(206, 17, 38, 1)),
            label: 'Explore',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.shopping_bag),
            label: 'My Orders',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Account',
          ),
        ],
        unselectedItemColor: Colors.black,
        selectedItemColor: Color.fromRGBO(206, 17, 38, 1),
      ),
    );
  }
}

class CategoryItem extends StatelessWidget {
  final String imagePath;
  final String label;
  final double fontSize;

  CategoryItem({
    required this.imagePath,
    required this.label,
    required this.fontSize,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize:
          MainAxisSize.min, // Ensures the column takes only necessary space
      children: [
        Container(
          width: fontSize * 5, // Circle size remains consistent
          height: fontSize * 5,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            border: Border.all(
              color: Colors.grey, // Border color
              width: 2.0, // Border thickness
            ),
          ),
          child: Padding(
            padding: EdgeInsets.all(
                fontSize * 0.4), // Add padding to reduce image size
            child: ClipOval(
              child: Image.asset(
                imagePath,
                fit: BoxFit.cover,
                width: fontSize * 5, // Slightly smaller than the circle
                height: fontSize * 5,
              ),
            ),
          ),
        ),
        SizedBox(height: fontSize / 2), // Adjusted spacing
        Flexible(
          child: Text(
            label,
            textAlign: TextAlign.center,
            maxLines: 2, // Limit text to two lines
            overflow: TextOverflow.ellipsis, // Show ellipsis if text overflows
            style: TextStyle(
              fontSize: fontSize * 0.9, // Slightly smaller font size
              fontWeight: FontWeight.w500,
              color: Color.fromRGBO(0, 0, 0, 1),
            ),
          ),
        ),
      ],
    );
  }
}

class Category {
  final String imagePath;
  final String label;

  Category(this.imagePath, this.label);
}

List<Category> categories = [
  Category('assets/iphone.png', 'Mobiles & Tablets'),
  Category('assets/electronics.png', 'Electronics'),
  Category('assets/tv.png', 'Computers & IT'),
  Category('assets/banner1.png', 'Watches'),
  Category('assets/hot.png', 'Deals'),
  Category('assets/food.png', 'Supermarket'),
  Category('assets/food.png', 'Appliances'),
  Category('assets/food.png', 'Perfumes & Fragrances'),
  Category('assets/food.png', 'Health & Beauty'),
  Category('assets/food.png', 'Telecom'),
  Category('assets/food.png', 'Musical Instruments'),
  Category('assets/food.png', 'Pharmacy'),
  Category('assets/food.png', 'Baby Care'),
  Category('assets/food.png', 'Kitchen & Dining'),
  Category('assets/food.png', 'Tools & DIY'),
  Category('assets/food.png', 'Pet Supplies'),
  Category('assets/food.png', 'Furniture & Storage'),
  Category('assets/food.png', 'Diet & Nutrition'),
  Category('assets/food.png', 'Automotive'),
  Category('assets/food.png', 'Office Supplies'),
  Category('assets/food.png', 'Cakes & Flowers'),
  Category('assets/food.png', 'Gaming & Consoles'),
  Category('assets/food.png', 'School Essentials'),
  Category('assets/food.png', 'Home Decor & Furnishing'),
];
