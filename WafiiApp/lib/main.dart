import 'package:flutter/material.dart';
import 'Cancelorder.dart';
import 'cart.dart';
import 'Category.dart';
import 'Lang.dart';
import 'personalinformation.dart';
import 'review.dart';
import 'sharing.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primarySwatch: Colors.red,
        textTheme: TextTheme(
          bodyMedium: TextStyle(fontSize: 14, color: Colors.black),
        ),
      ),
      home: HomePage(),
      routes: {
        '/cancelorder': (context) => Cancelorder(),
        '/cart': (context) => CartPage(),
        '/category': (context) => CategoryPage(),
        '/lang': (context) => LangPage(),
        '/personalinfo': (context) => PersonalInformationPage(),
        '/review': (context) => ReviewPage(),
        '/sharing': (context) => SharingPage(),
      },
    );
  }
}

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Main Menu')),
      body: ListView(
        children: [
          ListTile(
            title: Text('Cancel Order'),
            onTap: () => Navigator.pushNamed(context, '/cancelorder'),
          ),
          ListTile(
            title: Text('Cart'),
            onTap: () => Navigator.pushNamed(context, '/cart'),
          ),
          ListTile(
            title: Text('Category'),
            onTap: () => Navigator.pushNamed(context, '/category'),
          ),
          ListTile(
            title: Text('Language Settings'),
            onTap: () => Navigator.pushNamed(context, '/lang'),
          ),
          ListTile(
            title: Text('Personal Information'),
            onTap: () => Navigator.pushNamed(context, '/personalinfo'),
          ),
          ListTile(
            title: Text('Review'),
            onTap: () => Navigator.pushNamed(context, '/review'),
          ),
          ListTile(
            title: Text('Sharing'),
            onTap: () => Navigator.pushNamed(context, '/sharing'),
          ),
        ],
      ),
    );
  }
}
