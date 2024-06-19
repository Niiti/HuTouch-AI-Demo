import 'package:flutter/material.dart';

class AIArtHomeScreen extends StatefulWidget {
  @override
  _AIArtHomeScreenState createState() => _AIArtHomeScreenState();
}

class _AIArtHomeScreenState extends State<AIArtHomeScreen> {
  final TextEditingController _searchController = TextEditingController();
  String _searchKeyword = '';
  List<String> _allAvatars = ["AUTUMN 3D", "SUMMER 3D", "WINTER 3D"];
  List<String> _filteredAvatars = [];

  @override
  void initState() {
    super.initState();
    _filteredAvatars = _allAvatars;
  }

  void _onSearchChanged() {
    setState(() {
      _searchKeyword = _searchController.text;
      _filteredAvatars = _allAvatars
          .where((avatar) =>
              avatar.toLowerCase().contains(_searchKeyword.toLowerCase()))
          .toList();
    });
  }

  void _continueWithAd() {
    // Implement further logic for "Continue with Ad"
    print("Continue with Ad pressed!");
  }

  void _tryNow(String title) {
    // Implement the logic for Try Now button
    print("Trying Now: $title");
  }

  void _navigateToCategory(String category) {
    // Implement the navigation logic for different categories
    print("Navigating to Category: $category");
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("AI Art Home"),
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context); // Back navigation logic
          },
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Search Box
              TextField(
                controller: _searchController,
                onChanged: (value) => _onSearchChanged(),
                decoration: InputDecoration(
                  labelText: 'Search',
                  hintText: 'Enter keyword',
                  prefixIcon: Icon(Icons.search),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8.0),
                  ),
                ),
              ),
              SizedBox(height: 20),
              // Trending Avatars Section
              Text(
                "Trending Avatars",
                style: TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 10),
              Container(
                height: 200,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: _filteredAvatars.length,
                  itemBuilder: (context, index) {
                    return buildAvatarCard(context, _filteredAvatars[index]);
                  },
                ),
              ),
              SizedBox(height: 20),
              // Advertisement Section
              Container(
                height: 100,
                color: Colors.red, // Ad placeholder color
                child: Center(
                  child: Text(
                    "Ad Placeholder",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
              SizedBox(height: 20),
              // Other Categories Section
              Text(
                "Other Categories",
                style: TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 10),
              buildCategoryTabs(),
            ],
          ),
        ),
      ),
    );
  }

  Widget buildAvatarCard(BuildContext context, String title) {
    return Card(
      child: Container(
        width: 220,
        child: Column(
          children: [
            Image.asset(
              'assets/images/image1.png', // Replace with actual image assets
              width: 220,
              height: 130,
              fit: BoxFit.cover,
            ),
            SizedBox(height: 10),
            Text(
              title,
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 10),
            ElevatedButton(
              onPressed: () => _tryNow(title),
              child: Text("Try Now"),
              style: ElevatedButton.styleFrom(
                minimumSize: Size(double.infinity, 40), // full width button
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget buildCategoryTabs() {
    return DefaultTabController(
      length: 4,
      child: Column(
        children: <Widget>[
          TabBar(
            isScrollable: true,
            tabs: [
              Tab(text: 'TRENDING'),
              Tab(text: 'FASHION'),
              Tab(text: 'ANIME'),
              Tab(text: 'DIGITAL ART'),
            ],
          ),
          Container(
            height: 400, // Height of the TabBarView
            child: TabBarView(
              children: [
                buildCategoryContent('TRENDING'),
                buildCategoryContent('FASHION'),
                buildCategoryContent('ANIME'),
                buildCategoryContent('DIGITAL ART'),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget buildCategoryContent(String category) {
    return ListView.builder(
      itemCount: _allAvatars.length,
      itemBuilder: (context, index) {
        return GestureDetector(
          onTap: () => _navigateToCategory(category),
          child: Card(
            child: ListTile(
              leading: Icon(Icons.image),
              title: Text('Avatar: ${_allAvatars[index]}'),
              subtitle: Text('Category: $category'),
            ),
          ),
        );
      },
    );
  }
}
