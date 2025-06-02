 
import 'package:flutter/material.dart';

class ServiceDetailsPage extends StatelessWidget {
  final String service;
  const ServiceDetailsPage({Key? key, required this.service}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('$service Details'),
      ),
      body: Center(
        child: Text('Details about $service service.'),
      ),
    );
  }
}
 
