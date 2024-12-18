import 'package:flutter/material.dart';

class BlogPostUI extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;

    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: width * 0.04),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: height * 0.05),
              Container(
                width: double.infinity,
                height: height * 0.25,
                decoration: BoxDecoration(
                  color: Color(0xFFF1F1F1),
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
              SizedBox(height: height * 0.02),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Post Title Here...',
                    style: TextStyle(
                      fontSize: width * 0.06,
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                    ),
                  ),
                  SizedBox(height: height * 0.01),
                  Text(
                    'Author',
                    style: TextStyle(
                      fontSize: width * 0.045,
                      fontWeight: FontWeight.bold,
                      fontStyle: FontStyle.italic,
                      color: Colors.black,
                    ),
                  ),
                ],
              ),
              SizedBox(height: height * 0.02),
              Expanded(
                child: SingleChildScrollView(
                  child: Text(
                    'Labore sunt veniam amet est. Minim nisi dolor eu ad incididunt cillum elit ex ut. Dolore exercitation nulla tempor consequat aliquip occaecat. Nisi id ipsum irure aute. Deserunt sit aute irure quis nulla eu consequat fugiat Lorem sunt magna et consequat labore. Laboris incididunt id Lorem est duis deserunt nisi dolore eiusmod culpa exercitation consectetur.\n\nFugiat do aliqua laboris cillum sint dolor officia adipisicing excepteur fugiat officia. Cupidatat ut elit consequat ea laborum occaecat laborum aute consectetur Lorem exercitation. Lorem anim minim officia aliquip commodo deserunt mollit. Duis deserunt quis cillum voluptate duis ipsum quis incididunt elit excepteur excepteur labore duis cillum. Voluptate sint nulla minim eiusmod in nulla. Ea id ad duis esse adipisicing culpa ex esse ea dolore consequat. Reprehenderit eu minim veniam aliquip do ipsum duis do qui adipisicing aliquip ad occaecat.',
                    style: TextStyle(
                      fontSize: width * 0.04,
                      color: Color(0xFF555555),
                    ),
                  ),
                ),
              ),
              SizedBox(height: height * 0.02),
              Center(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: List.generate(5, (index) {
                    return Padding(
                      padding: EdgeInsets.symmetric(horizontal: width * 0.01),
                      child: Container(
                        width: width * 0.03,
                        height: width * 0.03,
                        decoration: BoxDecoration(
                          color: index == 0 ? Color(0xFF4CAF50) : Color(0xFFE0E0E0),
                          shape: BoxShape.circle,
                        ),
                      ),
                    );
                  }),
                ),
              ),
              SizedBox(height: height * 0.03),
            ],
          ),
        ),
      ),
    );
  }
}