
// import 'package:flutter/material.dart';
// import '../../models/feature_item.dart';
// import '../data/featuring_today_repository.dart';
// import 'sections.dart';


// class FeaturingTodaySection extends StatefulWidget {
//   @override
//   _FeaturingTodaySectionState createState() => _FeaturingTodaySectionState();
// }

// class _FeaturingTodaySectionState extends State<FeaturingTodaySection> {
//   FeaturingTodayRepository _repository = FeaturingTodayRepository();
//   Future<List<FeatureItem>>? _featureItems;

//   @override
//   void initState() {
//     super.initState();
//     _featureItems = _repository.fetchFeaturingToday();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return SectionWithTitle(
//       title: 'Featuring Today',
//       child: FutureBuilder<List<FeatureItem>>(
//         future: _featureItems,
//         builder: (context, snapshot) {
//           if (snapshot.connectionState == ConnectionState.waiting) {
//             return Center(child: CircularProgressIndicator()); // Loading state
//           } else if (snapshot.hasError) {
//             return Center(child: Text('Failed to load data')); // Error state
//           } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
//             return Center(child: Text('No items available')); // Empty state
//           }

//           return Container(
//             height: 140,
//             child: ListView.builder(
//               scrollDirection: Axis.horizontal,
//               padding: EdgeInsets.only(left: 16.0),
//               itemCount: snapshot.data!.length,
//               itemBuilder: (context, index) {
//                 FeatureItem item = snapshot.data![index];
//                 return GestureDetector(
//                   onTap: () => _onFeaturedItemTapped(index),
//                   child: Container(
//                     margin: EdgeInsets.only(right: 16.0),
//                     child: Stack(
//                       children: [
//                         ClipRRect(
//                           borderRadius: BorderRadius.circular(8),
//                           child: Image.network(
//                             item.imageURL,
//                             width: 280,
//                             height: 140,
//                             fit: BoxFit.cover,
//                           ),
//                         ),
//                         Container(
//                           width: 280,
//                           height: 140,
//                           decoration: BoxDecoration(
//                             gradient: LinearGradient(
//                               begin: Alignment.bottomCenter,
//                               end: Alignment.topCenter,
//                               colors: [
//                                 Colors.black.withOpacity(0.75),
//                                 Colors.transparent,
//                               ],
//                             ),
//                             borderRadius: BorderRadius.circular(8),
//                           ),
//                         ),
//                         Positioned(
//                           left: 16,
//                           bottom: 16,
//                           child: Text(
//                             item.title,
//                             style: TextStyle(
//                               fontFamily: 'Inter',
//                               fontSize: 24,
//                               fontWeight: FontWeight.w700,
//                               color: Colors.white.withOpacity(0.75),
//                             ),
//                           ),
//                         ),
//                       ],
//                     ),
//                   ),
//                 );
//               },
//             ),
//           );
//         },
//       ),
//     );
//   }

//   void _onFeaturedItemTapped(int index) {
//     // Implementation for tapping on featured item (e.g., navigation)
//   }
// }