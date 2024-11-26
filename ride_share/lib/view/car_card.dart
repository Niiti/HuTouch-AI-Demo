import 'package:flutter/material.dart';
import 'package:ride_share/model/car_model.dart';
import 'package:ride_share/view/car_details_view.dart';
import '../utils/styles.dart';

class CarCard extends StatelessWidget {
  final Car car;
  final VoidCallback onTap;

  const CarCard({
    required Key key,
    required this.car,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 8.0, horizontal: 8.0),
      decoration: BoxDecoration(
        border: Border.all(
          color: Color(0xFF12D39D),
          width: 1.0,
        ),
        borderRadius: BorderRadius.circular(8.0),
      ),
      padding: EdgeInsets.all(12.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(car.name, style: AppStyles.cardTitleStyle),
                    SizedBox(height: 4.0),
                    Text(car.details, style: AppStyles.cardDetailStyle),
                    SizedBox(height: 8.0),
                    Row(
                      children: [
                        Icon(
                          Icons.location_on_outlined,
                          color: Color(0xFF414141),
                          size: 16.0,
                        ),
                        SizedBox(width: 4.0),
                        Text(car.distance, style: AppStyles.cardDetailStyle),
                      ],
                    ),
                  ],
                ),
              ),
              Image.asset(
                car.imagePath,
                width: 80,
                height: 80,
              ),
            ],
          ),
          SizedBox(height: 12.0),
          Align(
            alignment: Alignment.center,
            child: OutlinedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => CarDetailsView(carName: car.name),
                  ),
                );
              },
              style: OutlinedButton.styleFrom(
                side: BorderSide(color: Color(0xFF12D39D)),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8.0),
                ),
                padding: EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
              ),
              child: Text('View car list', style: AppStyles.buttonStyle),
            ),
          ),
        ],
      ),
    );
  }
}
