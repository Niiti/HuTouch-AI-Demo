import 'package:flutter/material.dart';
import 'package:share_plus/share_plus.dart';

void main() {
  runApp(SharingPage());
}

class SharingPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Pay Later App',
      theme: ThemeData(
        primarySwatch: Colors.red,
      ),
      home: GeneratedUI(),
    );
  }
}

class GeneratedUI extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;

    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              HeaderSection(),
              PromotionalSection(width: width, height: height),
              MainContentSection(width: width, height: height),
            ],
          ),
        ),
      ),
      bottomNavigationBar: FooterSection(),
    );
  }
}

class HeaderSection extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 16),
      height: 56,
      decoration: BoxDecoration(
        color: Color(0xFFC8102E),
        boxShadow: [BoxShadow(color: Colors.black26, blurRadius: 4)],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          IconButton(
            icon: Icon(Icons.arrow_back, color: Colors.white),
            onPressed: () => Navigator.pop(context),
          ),
          Text(
            "Pay Later",
            style: TextStyle(
              color: Colors.white,
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
          Row(
            children: [
              IconButton(
                icon: Icon(Icons.search, color: Colors.white),
                onPressed: () => Navigator.pushNamed(context, '/search'),
              ),
              IconButton(
                icon: Icon(Icons.shopping_cart, color: Colors.white),
                onPressed: () => Navigator.pushNamed(context, '/cart'),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class PromotionalSection extends StatelessWidget {
  final double width;
  final double height;

  PromotionalSection({required this.width, required this.height});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(width * 0.05),
      padding: EdgeInsets.all(width * 0.05),
      decoration: BoxDecoration(
        color: Color(0xFFFF4A4A),
        borderRadius: BorderRadius.circular(10),
      ),
      child: Row(
        children: [
          Flexible(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Love it. Spotii it. Own it.",
                  style: TextStyle(
                    fontSize: width * 0.05,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
                SizedBox(height: height * 0.01),
                Text(
                  "Own what you love today, live\nfearlessly tomorrow Checkout\nusing Spotii and split your total\nbill over 4 cost-free instalments.",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: width * 0.035,
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: Image.asset(
              'assets/shopping.png',
              fit: BoxFit.cover,
            ),
          ),
        ],
      ),
    );
  }
}

class MainContentSection extends StatelessWidget {
  final double width;
  final double height;

  MainContentSection({required this.width, required this.height});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: width * 0.05),
      child: Column(
        children: [
          Text(
            "Buy Now Pay Later",
            style: TextStyle(
              fontSize: width * 0.06,
              fontWeight: FontWeight.bold,
            ),
            textAlign: TextAlign.center,
          ),
          SizedBox(height: height * 0.01),
          Text(
            "Credit for all your shopping needs!",
            style: TextStyle(
              fontSize: width * 0.04,
            ),
            textAlign: TextAlign.center,
          ),
          SizedBox(height: height * 0.02),
          Text(
            "Instant approval up to \$1000",
            style: TextStyle(
              fontSize: width * 0.055,
              fontWeight: FontWeight.bold,
              color: Color(0xFFC8102E),
            ),
            textAlign: TextAlign.center,
          ),
          SizedBox(height: height * 0.02),
          Text(
            "Anything you buy with Spotii will be\nsplit into 4 easy payments,",
            style: TextStyle(
              fontSize: width * 0.035,
            ),
            textAlign: TextAlign.center,
          ),
          SizedBox(height: height * 0.03),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              PieChart(percent: 0.25, label: "25%"),
              PieChart(percent: 0.50, label: "50%"),
              PieChart(percent: 0.75, label: "75%"),
              PieChart(percent: 1.0, label: "100%"),
            ],
          ),
          SizedBox(height: height * 0.04),
          TextButton(
            style: TextButton.styleFrom(
              backgroundColor: Color(0xFFC8102E),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(width * 0.03),
              ),
              padding: EdgeInsets.symmetric(
                horizontal: width * 0.2,
                vertical: height * 0.02,
              ),
            ),
            onPressed: () => ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(content: Text('Activation Initiated')),
            ),
            child: Text(
              "Activate Now!",
              style: TextStyle(
                fontSize: width * 0.04,
                color: Colors.white,
              ),
            ),
          ),
          SizedBox(height: height * 0.03),
          Text(
            "100% Safe and Secure",
            style: TextStyle(
              fontSize: width * 0.04,
            ),
            textAlign: TextAlign.center,
          ),
          SizedBox(height: height * 0.03),
          OutlinedButton.icon(
            icon: Icon(Icons.share, size: width * 0.04),
            label: Text(
              "Share Page",
              style: TextStyle(fontSize: width * 0.04),
            ),
            onPressed: () =>
                Share.share('Check out this awesome Pay Later feature!'),
            style: OutlinedButton.styleFrom(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(width * 0.03),
              ),
              padding: EdgeInsets.symmetric(
                horizontal: width * 0.12,
                vertical: height * 0.015,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class PieChart extends StatelessWidget {
  final double percent;
  final String label;

  PieChart({required this.percent, required this.label});

  @override
  Widget build(BuildContext context) {
    double size = MediaQuery.of(context).size.width * 0.15;
    return Column(
      children: [
        Stack(
          alignment: Alignment.center,
          children: [
            SizedBox(
              width: size,
              height: size,
              child: CircularProgressIndicator(
                value: percent,
                strokeWidth: 8,
                color: Color(0xFFC8102E),
                backgroundColor: Color(0xFFE6E6E6),
              ),
            ),
            Text(
              label,
              style:
                  TextStyle(fontSize: size * 0.25, fontWeight: FontWeight.bold),
            ),
          ],
        ),
      ],
    );
  }
}

class FooterSection extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      selectedItemColor: Color(0xFFC8102E),
      unselectedItemColor: Colors.black,
      items: <BottomNavigationBarItem>[
        BottomNavigationBarItem(
          icon: Icon(Icons.home),
          label: 'Home',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.explore),
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
      onTap: (index) {
        switch (index) {
          case 0:
            Navigator.pushNamed(context, '/home');
            break;
          case 1:
            Navigator.pushNamed(context, '/explore');
            break;
          case 2:
            Navigator.pushNamed(context, '/orders');
            break;
          case 3:
            Navigator.pushNamed(context, '/account');
            break;
        }
      },
    );
  }
}
