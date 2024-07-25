import 'package:flutter/material.dart';
import 'package:ppui_demo/utils/extensions.dart';
import 'package:ppui_demo/values/app_number_constants.dart';

class CfProfile extends StatelessWidget {
  const CfProfile(this.photo, {super.key});

  final String photo;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: AppNumberConstants.profilePhotoWidth,
      margin: const EdgeInsets.all(12),
      padding: const EdgeInsets.only(top: 9.06),
      decoration: BoxDecoration(
        color: context.appColor.profileBg,
        shape: BoxShape.circle,
        border: Border.all(
          color: context.appColor.profileBorder,
          width: AppNumberConstants.profileBorderWidth,
        ),
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(
          AppNumberConstants.profilePhotoWidth,
        ),
        child: Image.asset(photo, fit: BoxFit.cover),
      ),
    );
  }
}
