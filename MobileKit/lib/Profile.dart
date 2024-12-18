import 'package:flutter/material.dart';
import 'rating_ui.dart'; // Import the RatingUI page

class Profile extends StatelessWidget {
  final Map<String, Color> styles;

  Profile({required this.styles});

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: styles['White'],
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                width: width,
                color: styles['Green/Primary'],
                padding: EdgeInsets.symmetric(vertical: 20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    // Wrap Settings text with InkWell for navigation
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 20),
                      child: InkWell(
                        onTap: () {
                          // Navigate to RatingUI page
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => RatingUI()),
                          );
                        },
                        child: Text(
                          'Settings',
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w500,
                            color: styles['White'],
                          ),
                        ),
                      ),
                    ),
                    Text(
                      'Profile',
                      style: TextStyle(
                        fontSize: 30,
                        fontWeight: FontWeight.bold,
                        color: styles['White'],
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 20),
                      child: Text(
                        'Logout',
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w500,
                          color: styles['White'],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 20),
              CircleAvatar(
                radius: width * 0.18,
                backgroundImage: AssetImage('assets/profilepic.png'),
                backgroundColor: styles['White'],
                child: Container(
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    border: Border.all(color: styles['White']!, width: 4),
                    boxShadow: [
                      BoxShadow(
                        color: Color.fromRGBO(100, 100, 100, 0.15),
                        offset: Offset(0, 4),
                        blurRadius: 20,
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(height: 10),
              Text(
                'Victoria Robertson',
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: styles['Black'],
                ),
              ),
              Text(
                'A mantra goes here',
                style: TextStyle(
                  fontSize: 16,
                  color: styles['Black'],
                ),
              ),
              SizedBox(height: 15),
              Container(
                margin: EdgeInsets.symmetric(horizontal: width * 0.05),
                decoration: BoxDecoration(
                  color: styles['Gray/01'],
                  borderRadius: BorderRadius.circular(50),
                  border: Border.all(color: styles['Gray/02']!),
                ),
                child: Row(
                  children: [
                    Expanded(
                      child: Container(
                        padding: EdgeInsets.symmetric(vertical: 12),
                        decoration: BoxDecoration(
                          color: styles['White'],
                          borderRadius: BorderRadius.circular(50),
                        ),
                        child: Center(
                          child: Text(
                            'Posts',
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                              color: Color.fromRGBO(93, 176, 117, 1),
                            ),
                          ),
                        ),
                      ),
                    ),
                    Expanded(
                      child: Container(
                        padding: EdgeInsets.symmetric(vertical: 12),
                        decoration: BoxDecoration(
                          color: Colors.transparent,
                          borderRadius: BorderRadius.circular(50),
                        ),
                        child: Center(
                          child: Text(
                            'Photos',
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                              color: Color(0xFF5DB075),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              ListView.builder(
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                itemCount: 3,
                itemBuilder: (context, index) {
                  return ContentBlock(
                    styles: styles,
                    asset: 'assets/Content Block.png',
                    title: index == 0
                        ? 'Workouts to Boost Your Day'
                        : index == 1
                            ? 'Mastering Personal Finance'
                            : 'Exploring Hidden Gems',
                    timeAgo: '8m ago',
                    description: index == 0
                        ? 'Short on time? These quick exercises can energize your body and improve your focus.'
                        : index == 1
                            ? 'Take control of your finances with these simple steps to budgeting, saving.'
                            : 'Step off the beaten path with these breathtaking places that promise unique experiences.',
                  );
                },
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: BottomAppBar(
        child: Container(
          height: 60,
          color: styles['White'],
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: List.generate(5, (index) {
              return Container(
                padding: EdgeInsets.all(10),
                child: CircleAvatar(
                  radius: 5,
                  backgroundColor:
                      index == 0 ? styles['Green/Primary'] : styles['Gray/02'],
                ),
              );
            }),
          ),
        ),
      ),
    );
  }
}

class ContentBlock extends StatelessWidget {
  final Map<String, Color> styles;
  final String asset;
  final String title;
  final String timeAgo;
  final String description;

  ContentBlock({
    required this.styles,
    required this.asset,
    required this.title,
    required this.timeAgo,
    required this.description,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          padding: EdgeInsets.all(16),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Image.asset(
                asset,
                width: 50,
                height: 50,
                fit: BoxFit.cover,
              ),
              SizedBox(width: 10),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      title,
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        color: styles['Black'],
                      ),
                    ),
                    SizedBox(height: 4),
                    Text(
                      description,
                      style: TextStyle(
                        fontSize: 14,
                        color: styles['Black'],
                      ),
                    ),
                  ],
                ),
              ),
              Text(
                timeAgo,
                style: TextStyle(
                  fontSize: 14,
                  color: styles['Gray/03'],
                ),
              ),
            ],
          ),
        ),
        Divider(color: styles['Gray/02']),
      ],
    );
  }
}
