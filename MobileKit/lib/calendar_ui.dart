import 'package:flutter/material.dart';
import 'blog_post_ui.dart'; // Import BlogPostUI

class CalendarUI extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final double height = MediaQuery.of(context).size.height;
    final double width = MediaQuery.of(context).size.width;

    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Calendar',
          style: TextStyle(
            fontSize: width * 0.05,
            fontWeight: FontWeight.bold,
          ),
        ),
        backgroundColor: Color(0xFF69B578),
        centerTitle: true,
      ),
      body: Column(
        children: [
          // Header Section
          Container(
            height: height * 0.1,
            color: Color(0xFF69B578),
            child: Center(
              child: Text(
                'March',
                style: TextStyle(
                  fontSize: width * 0.08,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
            ),
          ),
          // Calendar Section
          Padding(
            padding: EdgeInsets.symmetric(horizontal: width * 0.05),
            child: Column(
              children: [
                Padding(
                  padding: EdgeInsets.symmetric(vertical: height * 0.02),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: ['Mo', 'Tu', 'We', 'Th', 'Fr', 'Sa', 'Su']
                        .map((day) => Expanded(
                              child: Center(
                                child: Text(
                                  day,
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                            ))
                        .toList(),
                  ),
                ),
                GridView.builder(
                  shrinkWrap: true,
                  physics: NeverScrollableScrollPhysics(),
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 7,
                    childAspectRatio: 1.0,
                  ),
                  itemCount: 35, // 5 weeks
                  itemBuilder: (context, index) {
                    List<List<String>> weeks = [
                      ['29', '30', '31', '1', '2', '3', '4'],
                      ['5', '6', '7', '8', '9', '10', '11'],
                      ['12', '13', '14', '15', '16', '17', '18'],
                      ['19', '20', '21', '22', '23', '24', '25'],
                      ['26', '27', '28', '29', '30', '31', '1']
                    ];
                    int weekIndex = index ~/ 7;
                    int dayIndex = index % 7;
                    String day = weeks[weekIndex][dayIndex];
                    return Center(
                      child: Text(
                        day,
                        style: TextStyle(
                          color: (weekIndex == 0 && int.parse(day) > 7 ||
                                  weekIndex == 4 && int.parse(day) < 7)
                              ? Colors.grey
                              : int.parse(day) == 7
                                  ? Color(0xFF69B578)
                                  : Colors.black,
                          fontWeight: int.parse(day) == 7
                              ? FontWeight.bold
                              : FontWeight.normal,
                        ),
                      ),
                    );
                  },
                ),
              ],
            ),
          ),
          // List Section
          Padding(
            padding: EdgeInsets.symmetric(horizontal: width * 0.05),
            child: ListView.separated(
              shrinkWrap: true,
              physics: NeverScrollableScrollPhysics(),
              itemCount: 4,
              itemBuilder: (context, index) {
                final durations = ['30min.', '60min.', '30min.', '15min.'];
                return Padding(
                  padding: EdgeInsets.symmetric(vertical: height * 0.015),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          CircleAvatar(
                            radius: width * 0.015,
                            backgroundColor: Color(0xFF69B578),
                          ),
                          SizedBox(width: width * 0.02),
                          Text(
                            'Item',
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                        ],
                      ),
                      Text(durations[index]),
                    ],
                  ),
                );
              },
              separatorBuilder: (context, index) => Divider(),
            ),
          ),
          // Footer Section
          Padding(
            padding: EdgeInsets.only(bottom: height * 0.03),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: List.generate(5, (index) {
                return Padding(
                  padding: EdgeInsets.symmetric(horizontal: width * 0.02),
                  child: GestureDetector(
                    onTap: () {
                      if (index == 0) {
                        // Navigate to BlogPostUI when green circle is tapped
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => BlogPostUI(),
                          ),
                        );
                      } else {
                        // Optionally handle taps on other circles
                        // For now, do nothing or add your logic
                      }
                    },
                    child: Container(
                      width: width * 0.03,
                      height: width * 0.03,
                      decoration: BoxDecoration(
                        color:
                            index == 0 ? Color(0xFF69B578) : Colors.grey,
                        shape: BoxShape.circle,
                      ),
                    ),
                  ),
                );
              }),
            ),
          ),
        ],
      ));
    }
}
