import 'package:flutter/material.dart';

void main() {
  runApp(PersonalInformationPage());
}

class PersonalInformationPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: ProfilePage(),
    );
  }
}

class ProfilePage extends StatelessWidget {
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
              Stack(
                children: [
                  Align(
                    alignment: Alignment.center,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        IconButton(
                          icon: Image.asset("assets/arrow-right.png"),
                          onPressed: () {},
                        ),
                        Text(
                          "Personal Informations",
                          style: TextStyle(
                            fontSize: width * 0.045,
                            fontWeight: FontWeight.w600,
                            color: Colors.black,
                          ),
                        ),
                        TextButton(
                          onPressed: () {},
                          child: Text(
                            "Edit",
                            style: TextStyle(
                              fontSize: width * 0.045,
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Align(
                    alignment: Alignment.topLeft,
                    child: Padding(
                      padding: EdgeInsets.only(
                          left: width * 0.05, top: height * 0.015),
                      child: Text(
                        '12:30',
                        style: TextStyle(
                          fontSize: width * 0.035,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                  Align(
                    alignment: Alignment.topRight,
                    child: Padding(
                      padding: EdgeInsets.only(
                          right: width * 0.05, top: height * 0.015),
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Icon(Icons.network_wifi,
                              color: Colors.white, size: width * 0.05),
                          SizedBox(width: width * 0.02),
                          Icon(Icons.battery_full,
                              color: Colors.white, size: width * 0.05),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(height: height * 0.04),
              Column(
                children: [
                  CircleAvatar(
                    radius: width * 0.12,
                    backgroundColor: Color(0xFFD9D9D9),
                    backgroundImage: AssetImage("assets/Boy.png"),
                  ),
                  SizedBox(height: height * 0.02),
                  Text(
                    'Pranav Thamban',
                    style: TextStyle(
                      fontSize: width * 0.05,
                      fontWeight: FontWeight.w500,
                    ),
                    textAlign: TextAlign.center,
                  ),
                  SizedBox(height: height * 0.04),
                ],
              ),
              DeactivateDialog(width: width, height: height),
              SizedBox(height: height * 0.04),
              BirthdaySection(width: width, height: height),
              SizedBox(height: height * 0.04),
              Align(
                alignment: Alignment.centerRight,
                child: GestureDetector(
                  onTap: () {
                    // Handle deactivate account link tap
                  },
                  child: Padding(
                    padding: EdgeInsets.only(right: width * 0.05),
                    child: Text(
                      'Deactivate Account',
                      style: TextStyle(
                        fontSize: width * 0.035,
                        fontWeight: FontWeight.w500,
                        color: Color(0xFFCE1126),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class DeactivateDialog extends StatelessWidget {
  final double width;
  final double height;

  const DeactivateDialog({Key? key, required this.width, required this.height})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: width * 0.05),
      padding: EdgeInsets.all(width * 0.04),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(15),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.1),
            blurRadius: 10,
            offset: Offset(0, 5),
          ),
        ],
      ),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Deactivate Account',
                style: TextStyle(
                  fontSize: width * 0.045,
                  fontWeight: FontWeight.w500,
                  color: Color(0xFFCE1126),
                ),
              ),
              Image.asset(
                "assets/personalinformation.png",
                height: width * 0.07,
              ),
            ],
          ),
          SizedBox(height: height * 0.02),
          Text(
            'All your orders, personal data and other information related to your account or purchases will be lost. You will not be able to restore access to your account after we approve your removal request.',
            style: TextStyle(
              fontSize: width * 0.035,
              fontWeight: FontWeight.normal,
            ),
            textAlign: TextAlign.center,
          ),
          SizedBox(height: height * 0.03),
          CheckboxListTile(
            controlAffinity: ListTileControlAffinity.leading,
            title: Text(
              'I understand and I want to delete my account',
              style: TextStyle(
                fontSize: width * 0.035,
                fontWeight: FontWeight.normal,
              ),
            ),
            value: false,
            onChanged: (bool? value) {},
          ),
          SizedBox(height: height * 0.02),
          SizedBox(
            width: double.infinity,
            child: TextButton(
              onPressed: () {},
              style: TextButton.styleFrom(
                backgroundColor: Colors.white,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(5),
                  side: BorderSide(color: Colors.black),
                ),
                padding: EdgeInsets.symmetric(vertical: height * 0.015),
              ),
              child: Text(
                'Submit Request',
                style: TextStyle(
                  color: Colors.black,
                  fontSize: width * 0.04,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
          ),
          SizedBox(height: height * 0.02),
          SizedBox(
            width: double.infinity,
            child: TextButton(
              onPressed: () {},
              style: TextButton.styleFrom(
                backgroundColor: Color(0xFFCE1126),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(5),
                ),
                padding: EdgeInsets.symmetric(vertical: height * 0.015),
              ),
              child: Text(
                'Cancel',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: width * 0.04,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class BirthdaySection extends StatelessWidget {
  final double width;
  final double height;

  const BirthdaySection({Key? key, required this.width, required this.height})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: EdgeInsets.symmetric(horizontal: width * 0.05),
          child: Text(
            'My Birthday is on',
            style: TextStyle(
              fontSize: width * 0.035,
              fontWeight: FontWeight.w500,
            ),
          ),
        ),
        SizedBox(height: height * 0.01),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: width * 0.05),
          child: TextFormField(
            initialValue: '08-09-1990',
            decoration: InputDecoration(
              contentPadding: EdgeInsets.symmetric(horizontal: width * 0.03),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
                borderSide: BorderSide(color: Color(0xFFBCBCBC)),
              ),
            ),
            style: TextStyle(
              fontSize: width * 0.04,
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
      ],
    );
  }
}
