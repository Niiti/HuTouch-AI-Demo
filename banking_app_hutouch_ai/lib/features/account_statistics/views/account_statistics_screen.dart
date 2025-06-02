import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:banking_app_hutouch_ai/features/account_statistics/widgets/screen_header.dart';
import 'package:banking_app_hutouch_ai/features/account_statistics/widgets/balance_section.dart';
import 'package:banking_app_hutouch_ai/features/account_statistics/widgets/graph_section.dart';
import 'package:banking_app_hutouch_ai/features/account_statistics/widgets/transaction_header.dart';
import 'package:banking_app_hutouch_ai/features/account_statistics/widgets/transaction_list.dart';
import 'package:get/get_core/src/get_main.dart';

import '../../../core/constants/color_config.dart';
import '../../../core/constants/text_style.dart';

class AccountStatisticsScreen extends ConsumerWidget {
  const AccountStatisticsScreen({super.key});
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        actions: [
          Padding(
            padding: const EdgeInsets.only(left: 18.0),
            child: InkWell(
              borderRadius: BorderRadius.circular(30),
              onTap: () {},
              child: Container(
                height: 40,
                width: 40,
                decoration: const BoxDecoration(
                  shape: BoxShape.circle,
                  color: kSurfaceColor,
                  image: DecorationImage(
                    image: AssetImage('assets/images/arrow.png'),
                    // fit: BoxFit.cover,
                  ),
                ),
              ),
            ),
          ),
         const Expanded(
            child: Center(
              child: Text(
                "Statistics",
                style: AppTextStyles.title,
                textAlign: TextAlign.center,
              ),
            ),
          ),

            Padding(
              padding: const EdgeInsets.only(right: 18.0),
              child: InkWell(
                borderRadius: BorderRadius.circular(30),
                onTap: (){},
                child: Container(
                  height: 40,
                  width: 40,
                  decoration: const BoxDecoration(
                    shape: BoxShape.circle,
                    color: kSurfaceColor,
                    image: const DecorationImage(
                      image: AssetImage('assets/images/notification_icon.png'),
                      // fit: BoxFit.cover,
                    ),
                  ),
                ),
              ),
            ),
        ],
      ),
      backgroundColor: Theme.of(context).colorScheme.background,
      body: Column(
        children: [
          // const ScreenHeader(
          //   title: 'account_statistics_title',
          //   leftIcon: Icons.arrow_back,
          //   rightIcon: Icons.notifications_none,
          //   onLeftPressed: null,
          //   onRightPressed: null,
          // ),
          const BalanceSection(),
          const Expanded(child: GraphSection()),
          const TransactionHeader(),
          const Expanded(child: TransactionList()),
          /* SELECTED CODE START */
          BottomNavigationBar(
            items: const <BottomNavigationBarItem>[
              // Add items parameter with a list of BottomNavigationBarItem
              BottomNavigationBarItem(
                icon: Icon(Icons.home),
                label: 'Home',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.business),
                label: 'Business',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.school),
                label: 'School',
              ),

            ],
            currentIndex: 0, // Add currentIndex parameter to specify the selected tab
            selectedItemColor: Colors.amber[800], // Add selectedItemColor to define the color of the selected icon
            onTap: (index) {
              // Add onTap parameter to handle the tap on the bottom navigation bar items
              // Handle tap
            },
          )
        ],
      ),
    );
  }
}
