import 'package:courier_app/src/components/custom_divider.dart';
import 'package:courier_app/src/components/custom_text.dart';
import 'package:courier_app/src/core/constants/assets.dart';
import 'package:courier_app/src/core/constants/dimensions.dart';
import 'package:courier_app/src/core/constants/font_weight.dart';
import 'package:courier_app/src/core/constants/strings.dart';
import 'package:flutter/material.dart';

import '../core/constants/palette.dart';

class CustomHeadCard extends StatelessWidget {
  final Function()? onTap;
  final Function(String)? onChanged;
  final TextEditingController? controller;

  const CustomHeadCard({super.key, this.onTap, this.onChanged, this.controller});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height_200,
      width: width_300,
      decoration: BoxDecoration(color: AppColors.white.withOpacity(.1), borderRadius: BorderRadius.circular(radius_15)),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 18.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [

            Container(
              child: SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: [
                  CustomText(text: strTrackPack, color1: AppColors.white, fontWeight: fontWeight600, fontSize: font_19),
                  Container(
                    height: 25, // Change this to your desired image height
                    width: 25,
                    child: Wrap(
                        crossAxisAlignment: WrapCrossAlignment.center,
                        alignment: WrapAlignment.spaceAround,
                        children: [Image.asset(ImgAssets.boxTrack, height: height_25,)]), // Replace with your image path
                  ),
                ],),
              ),
            ),

            CustomText(text: strTrackId, color1: AppColors.textWhite, fontWeight: fontWeight500, fontSize: font_12),
            CustomDivider(
              height: height_10,
              isDivider: false,
            ),
            CustomDivider(
              height: 10,
            ),
            searchF(suffix: ImgAssets.searchIcon, onChanged: onChanged, onTap: onTap, controller: controller)
          ],
        ),
      ),
    );
  }
}

Widget searchF(
    {double? width, required String suffix, TextEditingController? controller, Function()? onTap, Function(String)? onChanged}) {
  return SizedBox(
    height: 55,
    width: width,
    child: TextFormField(
      onChanged: onChanged,
      style: const TextStyle(color: AppColors.orange),
      decoration: InputDecoration(
        labelText: strShippingUID,
        labelStyle: TextStyle(fontSize: font_12),
        fillColor: AppColors.white,
        suffixIcon: InkWell(
          onTap: onTap,
          child: Image(alignment: Alignment.bottomRight,image: AssetImage(suffix), width: width_80),
        ),
        filled: true,
        enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(radius_8), borderSide: BorderSide(color: AppColors.transparent)),
        focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(radius_8), borderSide: BorderSide(color: AppColors.transparent)),
      ),
      controller: controller,
    ),
  );
}
