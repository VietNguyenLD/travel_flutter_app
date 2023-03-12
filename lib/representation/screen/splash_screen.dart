import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:travel_app/core/helpers/local_storage_helper.dart';
import 'package:travel_app/representation/screen/intro_screen.dart';
import 'package:travel_app/representation/screen/main_screen.dart';

import '../../core/helpers/asset_helper.dart';
import '../../core/helpers/image_helper.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  static String routeName = '/splash_screen';

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    redirectIntroScreen();
  }

  void redirectIntroScreen() async {
    final ignoreIntroScreen =
        LocalStorageHelper.getValue('ignoreIntroScreen') as bool?;

    await Future.delayed(const Duration(seconds: 2));
    if (ignoreIntroScreen != null) {
      Navigator.of(context).pushNamed(MainScreen.routeName);
    } else {
      LocalStorageHelper.setValue('ignoreIntroScreen', true);
      Navigator.of(context).pushNamed(IntroScreen.routeName);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Positioned.fill(
          child: ImageHelper.loadFromAsset(AssetHelper.imageBackGroundSplash,
              fit: BoxFit.fitWidth),
        ),
        Positioned.fill(
            child: ImageHelper.loadFromAsset(AssetHelper.imageCircleSplash))
      ],
    );
  }
}
