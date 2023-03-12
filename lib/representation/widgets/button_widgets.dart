import 'package:flutter/material.dart';
import 'package:travel_app/core/constants/color_constants.dart';
import 'package:travel_app/core/constants/dismension_constants.dart';
import 'package:travel_app/core/constants/textstyle_constants.dart';

class ButtonWidget extends StatelessWidget {
  const ButtonWidget({super.key, required this.title, this.ontap});

  final String title;
  final Function()? ontap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: ontap,
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: kDefaultPadding),
        alignment: Alignment.center,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(kMediumPadding),
            gradient: Gradients.defaultGradientBackground),
        child: Text(
          title,
          style: TextStyles.defaultStyle.bold.whiteTextColor,
        ),
      ),
    );
  }
}
