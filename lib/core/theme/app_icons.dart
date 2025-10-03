import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class AppIcons {
  static Widget get agreement => buildSvg('undraw_agreement_aajr');

  static Widget get businessDeal => buildSvg('undraw_business_deal');
  static Widget get jobOffers => buildSvg('undraw_job_offers');
  // SVG Icons
  static Widget get profileData => buildSvg('undraw_Profile_data');
  static Widget buildSvg(String name,
      {double? width, double? height, Color? color}) {
    return SvgPicture.asset(
      'assets/svg/$name.svg',
      width: width,
      height: height,
      colorFilter:
          color != null ? ColorFilter.mode(color, BlendMode.srcIn) : null,
    );
  }
}
