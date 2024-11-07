import 'package:flutter/material.dart';

const Color kPrimaryColor = Color.fromRGBO(75, 22, 76, 1);
const Color kAccentColor = Color.fromRGBO(220, 136, 208, 1);
const Color kTextColor = Color.fromRGBO(34, 23, 42, 1);
const Color kBackgroundColor = Color(0xFFFFFFFF);
const Color kTabBackgroundColor = Color.fromRGBO(248, 245, 250, 1);
const Color kWhiteColor = Color.fromRGBO(255, 255, 255, 1);
const kSoftPurple = Color(0xFFEA87CE);
const kIconColor = Color(0xFF4B164C);
const kOverlayColor = Color(0xFF4B164C);
const kMatchColor = Color(0xFFEA87CE);

const double kDefaultPadding = 16.0;
const double defaultPadding = 24.0;
const double elementSpacing = 16.0;

// Images
const String defaultProfileImage = 'assets/default_profile.png';

const Color primaryColor = Color(0xFFDA85CE);
const Color secondaryColor = Color(0xFFDC7AD1);
const Color textColor = Color(0xFF22172A);
const Color backgroundColor = Colors.white;
const Color purpleColor = Color(0xFF4B164C);
const Color greenDotColor = Color(0xFF13E398);

const BoxShadow kDefaultShadow = BoxShadow(
  color: Color(0x26DD88CF),
  offset: Offset(8, 0),
  blurRadius: 40,
);

// Text Styles
const TextStyle headingTextStyle = TextStyle(
  fontFamily: 'Hellix',
  color: textColor,
  fontWeight: FontWeight.w700,
  fontSize: 24,
  letterSpacing: 0,
  height: 1.25,
);

const TextStyle sectionTitleTextStyle = TextStyle(
  fontFamily: 'Hellix',
  fontSize: 20,
  fontWeight: FontWeight.w700,
  color: purpleColor,
  letterSpacing: 0,
  height: 1.2,
);

const TextStyle labelTextStyle = TextStyle(
  fontFamily: 'Hellix',
  color: textColor,
  fontSize: 14,
  fontWeight: FontWeight.w400,
  letterSpacing: 0,
  height: 1.4,
);

const TextStyle matchPercentageTextStyle = TextStyle(
  fontFamily: 'Hellix',
  color: Colors.white,
  fontSize: 12,
  fontWeight: FontWeight.w600,
  letterSpacing: 0,
  height: 1.35,
);

const TextStyle nameAgeTextStyle = TextStyle(
  fontFamily: 'Hellix',
  color: Colors.white,
  fontWeight: FontWeight.w700,
  fontSize: 18,
  letterSpacing: 0,
  height: 1.35,
);

const TextStyle locationTextStyle = TextStyle(
  fontFamily: 'Hellix',
  color: Colors.white70,
  fontSize: 11,
  fontWeight: FontWeight.w400,
  letterSpacing: 2,
  height: 1.27,
);

const TextStyle distanceTextStyle = TextStyle(
  fontFamily: 'Hellix',
  color: Colors.white,
  fontSize: 11,
  fontWeight: FontWeight.w500,
  letterSpacing: 0,
  height: 1.27,
);

// Text Styles
const TextStyle kHeaderTextStyle = TextStyle(
  fontFamily: 'Hellix',
  fontSize: 32,
  fontWeight: FontWeight.bold,
  color: kTextColor,
);

const TextStyle kSectionTitleTextStyle = TextStyle(
  fontFamily: 'Hellix',
  fontSize: 20,
  fontWeight: FontWeight.bold,
  color: kTextColor,
);

const TextStyle kMatchPercentageTextStyle = TextStyle(
  fontFamily: 'Hellix',
  color: Colors.white,
  fontSize: 12,
  fontWeight: FontWeight.w600,
);

const TextStyle kDistanceTextStyle = TextStyle(
  fontFamily: 'Hellix',
  color: Colors.white70,
  fontSize: 14,
  fontWeight: FontWeight.w400,
);

const TextStyle kNameAgeTextStyle = TextStyle(
  fontFamily: 'Hellix',
  color: Colors.white,
  fontSize: 24,
  fontWeight: FontWeight.bold,
);

const TextStyle kLocationTextStyle = TextStyle(
  fontFamily: 'Hellix',
  color: Colors.white70,
  fontSize: 14,
  fontWeight: FontWeight.w400,
  letterSpacing: 2,
);

class AppColors {
  static const Color primaryColor = Color(0xFF4B164C); // rgba(75,22,76,1)
  static const Color accentColor = Color(0xFFDD88CF); // rgba(221,136,207,1)
  static const Color textColor = Color(0xFFFFFFFF); // rgba(255,255,255,1)
  static const Color greyTextColor = Color(0xFF22232A); // rgba(34,23,42,1)
  static const Color lightGreyColor = Color(0xFFE5E6EB); // rgba(229,230,235,1)
  static const Color darkTextColor = Color(0xFF22172A); // rgba(34, 23, 42, 1)
  static const Color lightTextColor =Color(0xFF6C727F); // rgba(108, 114, 127, 1)
  static const Color purpleColor = Color(0xFFDD88CF); // rgba(221, 136, 207, 1)
  static const Color greyColor = Color(0xFF9EA3AE); // rgba(158, 163, 174, 1)
  static const Color dividerColor = Color(0xFF22172A);
  static const Color backgroundColor = Colors.white;
  static const Color appBarColor = Color(0xFF100F0F);
}

class AppFonts {
  static const String primaryFont = 'Hellix';
}

class AppSizes {
  static const double appBarHeight = 92.0;
  static const double bottomNavBarHeight = 64.0;
}

class AppConstants {
  static const double avatarSize = 80.0;
  static const double avatarRadius = 10.0;
}

class AppTextStyles {
  static const TextStyle headline = TextStyle(
    color: AppColors.textColor,
    fontFamily: 'Hellix',
    fontSize: 32,
    fontWeight: FontWeight.w700,
    height: 1.25, // Line height = 40 / font size 32
  );

  static TextStyle subhead = TextStyle(
    color: AppColors.textColor.withOpacity(0.7),
    fontFamily: 'Hellix',
    fontSize: 14,
    fontWeight: FontWeight.w400,
    letterSpacing: 2,
    height: 1.4, // Line height = 19.6 / font size 14
  );

  static TextStyle bodyText = TextStyle(
    color: AppColors.greyTextColor,
    fontFamily: 'Hellix',
    fontSize: 16,
    fontWeight: FontWeight.w400,
    height: 1.5, // Line height = 24 / font size 16
  );

  static TextStyle bodyTextGrey = TextStyle(
    color: AppColors.greyTextColor.withOpacity(0.5),
    fontFamily: 'Hellix',
    fontSize: 16,
    fontWeight: FontWeight.w400,
    height: 1.5,
  );

  static const TextStyle buttonText = TextStyle(
    color: AppColors.textColor,
    fontFamily: 'Hellix',
    fontSize: 20,
    fontWeight: FontWeight.w600,
    height: 1.2, // Line height = 24 / font size 20
  );

  static const TextStyle badgeText = TextStyle(
    color: AppColors.primaryColor,
    fontFamily: 'Hellix',
    fontSize: 16,
    fontWeight: FontWeight.w500,
    height: 1.5, // Line height = 24 / font size 16
  );
}
