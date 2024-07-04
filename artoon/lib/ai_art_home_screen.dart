import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';

class TrendingAvatarsScreen extends StatefulWidget {
  @override
  _TrendingAvatarsScreenState createState() => _TrendingAvatarsScreenState();
}

class _TrendingAvatarsScreenState extends State<TrendingAvatarsScreen> {
  List<String> _cards = ['Card 1', 'Card 2', 'Card 3'];

  void _onItemTapped(int index) {
    String message;
    switch (index) {
      case 0:
        message = 'AI Art clicked';
        break;
      case 1:
        message = 'AI Enhance clicked';
        break;
      case 2:
        message = 'ArtoonAI clicked';
        break;
      case 3:
        message = 'AI Image clicked';
        break;
      case 4:
        message = 'Profile clicked';
        break;
      default:
        message = '';
    }

    ScaffoldMessenger.of(context)
        .showSnackBar(SnackBar(content: Text(message)));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Trending Avatars'),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Trending Avatars Section
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Text(
                'Trending Avatars',
                style: TextStyle(
                  fontFamily: 'Proxima Nova',
                  fontWeight: FontWeight.bold,
                  fontSize: 20,
                  color: Color.fromRGBO(13, 13, 13, 1),
                ),
              ),
            ),
            // Card View with Slide to Remove
            if (_cards.isNotEmpty)
              Container(
                height: 200,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: _cards.length,
                  itemBuilder: (context, index) {
                    final item = _cards[index];
                    return Dismissible(
                      key: Key(item),
                      direction: DismissDirection.up,
                      onDismissed: (direction) {
                        setState(() {
                          _cards.removeAt(index);
                        });
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(content: Text('$item dismissed')),
                        );
                      },
                      background: Container(color: Colors.red),
                      child: Card(
                        child: Container(
                          width: 300,
                          color: Colors.blueAccent,
                          child: Center(child: Text(item)),
                        ),
                      ),
                    );
                  },
                ),
              ),
            // Static Carousel
            CarouselSlider(
              options: CarouselOptions(
                height: 200.0,
                autoPlay: true,
              ),
              items: ['assets/images/image1.png','assets/images/playandwin.png' ,'assets/images/image2.png', 'assets/images/avatar_placeholder.png']
                  .map((i) {
                return Builder(
                  builder: (BuildContext context) {
                    return ClipRRect(
                      borderRadius: BorderRadius.circular(15.0),
                      child: Image.asset(i, fit: BoxFit.cover, width: 1000),
                    );
                  },
                );
              }).toList(),
            ),
            // Categories Section
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'TRENDING',
                    style: TextStyle(
                      fontFamily: 'Proxima Nova',
                      fontWeight: FontWeight.bold,
                      fontSize: 14,
                      color: Color.fromRGBO(1, 129, 253, 1),
                    ),
                  ),
                  Text(
                    'FASHION',
                    style: TextStyle(
                      fontFamily: 'Proxima Nova',
                      fontSize: 14,
                      color: Color.fromRGBO(73, 76, 97, 1),
                    ),
                  ),
                  Text(
                    'ANIME',
                    style: TextStyle(
                      fontFamily: 'Proxima Nova',
                      fontSize: 14,
                      color: Color.fromRGBO(73, 76, 97, 1),
                    ),
                  ),
                  Text(
                    'DIGITAL ART',
                    style: TextStyle(
                      fontFamily: 'Proxima Nova',
                      fontSize: 14,
                      color: Color.fromRGBO(73, 76, 97, 1),
                    ),
                  ),
                ],
              ),
            ),
            // Image Section
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Row(
                children: [
                  Expanded(
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(15.0),
                      child: Stack(
                        children: [
                          Image.asset('assets/images/image1.png',
                              width: 150, height: 150, fit: BoxFit.cover),
                          Positioned(
                            bottom: 0,
                            child: Container(
                              color: Colors.black54,
                              width: 150,
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Text(
                                  'AUTUMN 3D',
                                  style: TextStyle(
                                    fontFamily: 'Proxima Nova',
                                    fontWeight: FontWeight.bold,
                                    fontSize: 18,
                                    color: Colors.white,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(width: 16),
                  Expanded(
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(15.0),
                      child: Stack(
                        children: [
                          Image.asset('assets/images/image2.png',
                              width: 150, height: 150, fit: BoxFit.cover),
                          Positioned(
                            bottom: 0,
                            child: Container(
                              color: Colors.black54,
                              width: 150,
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Text(
                                  'AUTUMN 3D',
                                  style: TextStyle(
                                    fontFamily: 'Proxima Nova',
                                    fontWeight: FontWeight.bold,
                                    fontSize: 18,
                                    color: Colors.white,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        selectedItemColor: Color.fromRGBO(1, 129, 253, 1),
        unselectedItemColor: Color.fromRGBO(73, 76, 97, 1),
        onTap: _onItemTapped,
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'AI Art',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.brush),
            label: 'AI Enhance',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.palette),
            label: 'ArtoonAI',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.image),
            label: 'AI Image',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Profile',
          ),
        ],
      ),
    );
  }
}
