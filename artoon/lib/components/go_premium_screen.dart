import 'package:flutter/material.dart';
import 'ai_art_home_screen.dart';
import 'blank_payment_page.dart'; // Create this page for payment

class GoPremiumScreen extends StatefulWidget {
  @override
  _GoPremiumScreenState createState() => _GoPremiumScreenState();
}

class _GoPremiumScreenState extends State<GoPremiumScreen> {
  String _selectedPlan = "Free"; // Default selected plan

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
          icon: Icon(Icons.close, color: Colors.white),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        actions: [
          TextButton(
            onPressed: () {
              // Restore purchase logic here
            },
            child: Text(
              "Restore Purchase",
              style: TextStyle(color: Colors.white),
            ),
          ),
        ],
      ),
      extendBodyBehindAppBar: true,
      body: Stack(
        children: [
          Image.asset(
            'assets/images/premium_background.png', // Replace with your background image
            fit: BoxFit.cover,
            width: double.infinity,
            height: double.infinity,
          ),
          Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [Colors.black.withOpacity(0.5), Colors.transparent],
                begin: Alignment.bottomCenter,
                end: Alignment.topCenter,
              ),
            ),
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Text(
                "ArtoonAI",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 10),
              Text(
                "Remove all ads  •  Faster Processing\nNo Watermark  •  All Sizes",
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 16,
                ),
              ),
              SizedBox(height: 20),
              _buildSubscriptionOption(context, "Free",
                  "Contains Ads and Longer waiting time period", "₹0.00"),
              _buildSubscriptionOption(
                  context, "Weekly", "Trying free for 3 Days", "₹410.00/week"),
              _buildSubscriptionOption(context, "Lifetime", "Best Offer",
                  "₹4150.00/lifetime", false, true),
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: ElevatedButton(
                  onPressed: () {
                    if (_selectedPlan == "Free") {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => AIArtHomeScreen(),
                        ),
                      );
                    } else {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => BlankPaymentPage(),
                        ),
                      );
                    }
                  },
                  child: Text("Continue with AD"),
                  style: ElevatedButton.styleFrom(
                    minimumSize: Size(double.infinity, 50), // full width button
                  ),
                ),
              ),
                Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  TextButton(
                  onPressed: () {
                    // Privacy and Terms logic here
                  },
                  child: Text(
                    "Privacy and Terms",
                    style: TextStyle(color: Colors.white),
                  ),
                  ),
                  SizedBox(width: 10),
                  TextButton(
                  onPressed: () {
                    // Cancel anytime logic here
                  },
                  child: Text(
                    "Cancel anytime",
                    style: TextStyle(color: Colors.white),
                  ),
                  ),
                ],
                ),
              SizedBox(height: 20),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildSubscriptionOption(
      BuildContext context, String title, String subtitle, String price,
      [bool selected = false, bool bestOffer = false]) {
    final isSelected = _selectedPlan == title;

    return GestureDetector(
      onTap: () {
        setState(() {
          _selectedPlan = title;
        });
      },
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 4.0),
        child: Card(
          elevation: isSelected ? 4.0 : 1.0,
          color: isSelected ? Colors.blue[100] : Colors.white,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10.0),
          ),
          child: ListTile(
            leading: Icon(
                isSelected
                    ? Icons.radio_button_checked
                    : Icons.radio_button_unchecked,
                color: Colors.blue),
            title: Text(title, style: TextStyle(fontSize: 20)),
            subtitle: Text(subtitle),
            trailing: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(price,
                    style:
                        TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
                if (bestOffer)
                  Container(
                    padding:
                        EdgeInsets.symmetric(horizontal: 4.0, vertical: 2.0),
                    margin: EdgeInsets.only(top: 4.0),
                    decoration: BoxDecoration(
                      color: Colors.red,
                      borderRadius: BorderRadius.circular(4.0),
                    ),
                    child: Text(
                      "Best Offer",
                      style: TextStyle(color: Colors.white, fontSize: 12),
                    ),
                  ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
