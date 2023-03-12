import 'dart:async';

import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:travel_app/core/constants/dismension_constants.dart';
import 'package:travel_app/core/constants/textstyle_constants.dart';
import 'package:travel_app/core/helpers/asset_helper.dart';
import 'package:travel_app/core/helpers/image_helper.dart';
import 'package:travel_app/representation/screen/main_screen.dart';
import 'package:travel_app/representation/widgets/button_widgets.dart';

class IntroScreen extends StatefulWidget {
  const IntroScreen({super.key});

  static const routeName = 'intro-screen';
  @override
  State<IntroScreen> createState() => _IntroScreen();
}

class _IntroScreen extends State<IntroScreen> {
  final PageController _pageController = PageController();
  final StreamController<int> _pageStreamController =
      StreamController<int>.broadcast();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _pageController.addListener(() {
      _pageStreamController.add(_pageController.page!.toInt());
    });
  }

  Widget _buildItemIntroScreen(String image, String title, String description,
      AlignmentGeometry alignment) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          alignment: alignment,
          child: ImageHelper.loadFromAsset(AssetHelper.imageIntro1,
              height: 375, fit: BoxFit.fitHeight),
        ),
        const SizedBox(
          height: kMediumPadding * 2,
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: kMediumPadding),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title,
                style: TextStyles.defaultStyle.bold,
              ),
              const SizedBox(
                height: kMediumPadding,
              ),
              Text(
                description,
                style: TextStyles.defaultStyle,
              ),
            ],
          ),
        )
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Stack(children: [
      PageView(
        controller: _pageController,
        children: [
          _buildItemIntroScreen(AssetHelper.imageIntro1, "title", "description",
              Alignment.centerRight),
          _buildItemIntroScreen(AssetHelper.imageIntro1, "title", "description",
              Alignment.centerLeft),
          _buildItemIntroScreen(AssetHelper.imageIntro1, "title", "description",
              Alignment.center),
        ],
      ),
      Positioned(
          left: kMediumPadding,
          right: kMediumPadding,
          bottom: kMediumPadding * 3,
          child: Row(
            children: [
              Expanded(
                flex: 7,
                child: SmoothPageIndicator(
                  controller: _pageController,
                  count: 3,
                  effect: const ExpandingDotsEffect(
                    dotWidth: kMinPadding,
                    dotHeight: kMinPadding,
                    activeDotColor: Colors.orange,
                  ),
                ),
              ),
              StreamBuilder(
                initialData: 0,
                stream: _pageStreamController.stream,
                builder: (context, snapshot) {
                  return Expanded(
                    flex: 3,
                    child: ButtonWidget(
                        ontap: () {
                          if (_pageController.page != 2) {
                            _pageController.nextPage(
                                duration: const Duration(milliseconds: 200),
                                curve: Curves.easeIn);
                          } else {
                            Navigator.of(context)
                                .pushNamed(MainScreen.routeName);
                          }
                        },
                        title: snapshot.data != 2 ? 'Next' : 'Get started'),
                  );
                },
              )
            ],
          ))
    ]));
  }
}
