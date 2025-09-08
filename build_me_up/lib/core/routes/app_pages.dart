import 'package:get/get.dart';
import 'package:build_me_up/modules/one/views/one_view.dart';
import 'package:build_me_up/modules/sign_in/views/sign_in_view.dart';
import 'package:build_me_up/modules/sign_up/views/sign_up_view.dart';
import 'package:build_me_up/core/routes/app_routes.dart';
import 'package:build_me_up/modules/navigation/combined_screens.dart';
import 'package:build_me_up/modules/daily_challenge_home/views/daily_challenge_home_view.dart';
import 'package:build_me_up/modules/days_overview/views/days_overview_view.dart';
import 'package:build_me_up/modules/profile/views/profile_view.dart';
import 'package:build_me_up/modules/recipes_list/views/recipes_list_view.dart';
import 'package:build_me_up/modules/celebration_success/controllers/celebration_success_controller.dart';
import 'package:build_me_up/modules/celebration_success/views/celebration_success_view.dart';

class AppPages {
  static final pages = <GetPage>[
    GetPage(
      name: AppRoutes.one,
      page: () => const OneView(),
      participatesInRootNavigator: true,
    ),
    GetPage(name: AppRoutes.signIn, page: () => const SignInView()),
    GetPage(name: AppRoutes.signUp, page: () => const SignUpView()),

    // New additions merged from NEW:
    GetPage(name: AppRoutes.home, page: () => const CombinedScreens()),
    GetPage(name: AppRoutes.profile, page: () => const ProfileView()),
    GetPage(name: AppRoutes.days, page: () => const DaysOverviewView()),
    GetPage(name: AppRoutes.recipes, page: () => const RecipesListView()),
    GetPage(name: '/daily-home', page: () => const DailyChallengeHomeView()),
    GetPage<CelebrationSuccessController>(
      name: AppRoutes.celebrationSuccess,
      page: () => const CelebrationSuccessView(),
      binding: BindingsBuilder.put(() => CelebrationSuccessController()),
    ),
  ];
}
