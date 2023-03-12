import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:travel_app/core/constants/color_constants.dart';
import 'package:travel_app/core/constants/dismension_constants.dart';
import 'package:travel_app/core/helpers/asset_helper.dart';
import 'package:travel_app/core/helpers/image_helper.dart';

class AppBarContainerWidget extends StatelessWidget {
  const AppBarContainerWidget(
      {super.key,
      required this.chid,
      this.title,
      this.implementLeading = false,
      this.implementTraling = false,
      this.titleString});

  final Widget chid;
  final Widget? title;
  final String? titleString;
  final bool implementLeading;
  final bool implementTraling;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          SizedBox(
            height: 186,
            child: AppBar(
              centerTitle: true,
              automaticallyImplyLeading: false,
              elevation: 0,
              toolbarHeight: 190,
              backgroundColor: ColorPalette.backgroundScaffoldlColor,
              title: title ??
                  Row(
                    children: [
                      if (implementLeading)
                        Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.all(
                                Radius.circular(kDefaultPadding)),
                            color: Colors.white,
                          ),
                          child: Icon(
                            FontAwesomeIcons.arrowLeft,
                            color: Colors.black,
                            size: kDefaultIconSize,
                          ),
                          padding: EdgeInsets.all(kItemPadding),
                        ),
                      Expanded(
                          child: Center(
                        child: Column(
                          children: [
                            Text(
                              titleString ?? '',
                              style: TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 20),
                            )
                          ],
                        ),
                      )),
                      if (implementTraling)
                        Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.all(
                                Radius.circular(kDefaultPadding)),
                            color: Colors.white,
                          ),
                          child: Icon(
                            FontAwesomeIcons.bars,
                            color: Colors.black,
                            size: kDefaultIconSize,
                          ),
                          padding: EdgeInsets.all(kItemPadding),
                        ),
                    ],
                  ),
              flexibleSpace: Stack(
                children: [
                  Container(
                    decoration: BoxDecoration(
                        gradient: Gradients.defaultGradientBackground,
                        borderRadius:
                            BorderRadius.only(bottomLeft: Radius.circular(35))),
                  ),
                  Positioned(
                    top: 0,
                    left: 0,
                    child: ImageHelper.loadFromAsset(AssetHelper.icoOvalTop),
                  ),
                  Positioned(
                    bottom: 0,
                    right: 0,
                    child: ImageHelper.loadFromAsset(AssetHelper.icoOvalBottom),
                  ),
                ],
              ),
            ),
          ),
          Container(
            margin: EdgeInsets.only(top: 156),
            padding: EdgeInsets.symmetric(horizontal: kMediumPadding),
            child: chid,
          )
        ],
      ),
    );
  }
}
