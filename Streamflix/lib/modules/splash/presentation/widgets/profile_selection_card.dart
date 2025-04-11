// import 'package:flutter/material.dart';
// import 'package:my_project/modules/splash/presentation/widgets/user_avatar.dart';
// import 'package:my_project/modules/splash/presentation/widgets/user_name_label.dart';
// import 'package:my_project/modules/splash/presentation/screens/user_home_page.dart';

// class ProfileSelectionCard extends StatelessWidget {
//   final String imageAsset;
//   final String userName;
//   const ProfileSelectionCard({
//     super.key,
//     required this.imageAsset,
//     required this.userName,
//   });

//   @override
//   Widget build(BuildContext context) {
//     final screenHeight = MediaQuery.sizeOf(context).height;
//     return GestureDetector(
//       onTap: () {
//         Navigator.push(
//           context,
//           MaterialPageRoute(
//             builder: (context) => UserHomePage(userName: userName),
//           ),
//         );
//       },
//       child: Column(
//         children: [
//           UserAvatar(imageAsset: imageAsset),
//           SizedBox(height: screenHeight * 0.02),
//           UserNameLabel(userName: userName),
//         ],
//       ),
//     );
//   }
// }

import 'package:flutter/material.dart';
import 'package:my_project/modules/home/presentation/screens/home_screen.dart';
import 'package:my_project/modules/splash/presentation/widgets/user_avatar.dart';
import 'package:my_project/modules/splash/presentation/widgets/user_name_label.dart';
import 'package:my_project/modules/splash/presentation/screens/user_home_page.dart';

class ProfileSelectionCard extends StatelessWidget {
  final String imageAsset;
  final String userName;
  const ProfileSelectionCard({
    super.key,
    required this.imageAsset,
    required this.userName,
  });

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.sizeOf(context).height;
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => const HomeScreen()),
        );
      },
      child: Column(
        children: [
          UserAvatar(imageAsset: imageAsset),
          SizedBox(height: screenHeight * 0.02),
          UserNameLabel(userName: userName),
        ],
      ),
    );
  }
}
