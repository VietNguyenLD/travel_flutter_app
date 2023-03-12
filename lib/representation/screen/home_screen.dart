import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:travel_app/core/constants/color_constants.dart';
import 'package:travel_app/core/constants/dismension_constants.dart';
import 'package:travel_app/core/helpers/asset_helper.dart';
import 'package:travel_app/core/helpers/image_helper.dart';
import 'package:travel_app/representation/screen/hotel_screen.dart';
import 'package:travel_app/representation/widgets/app_bar_container.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  Widget _buildItemCategory(
      Widget icon, Color color, Function() onTap, String title) {
    return GestureDetector(
      onTap: onTap,
      child: Column(children: [
        Container(
          width: double.infinity,
          padding: EdgeInsets.symmetric(vertical: kMediumPadding),
          decoration: BoxDecoration(
              color: color.withOpacity(0.2),
              borderRadius: BorderRadius.circular(kItemPadding)),
          child: icon,
        ),
        SizedBox(
          height: kItemPadding,
        ),
        Text(title)
      ]),
    );
  }

  @override
  Widget build(BuildContext context) {
    return AppBarContainerWidget(
      title: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: kDefaultPadding,
        ),
        child: Row(
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Hi Jame!',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                ),
                SizedBox(
                  height: kMediumPadding,
                ),
                Text(
                  'Where are you going next',
                  style: TextStyle(
                    fontSize: 14,
                  ),
                )
              ],
            ),
            Spacer(),
            Icon(
              FontAwesomeIcons.bell,
              size: kDefaultIconSize,
              color: Colors.white,
            ),
            SizedBox(
              width: kMinPadding,
            ),
            Container(
              width: 40,
              height: 40,
              child: ImageHelper.loadFromAsset(AssetHelper.person),
              padding: EdgeInsets.all(kItemPadding),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(kItemPadding)),
            )
          ],
        ),
      ),
      // titleString: 'Home',
      // implementTraling: true,
      // implementLeading: true,
      chid: Column(
        children: [
          TextField(
            decoration: InputDecoration(
                border: OutlineInputBorder(
                    borderSide: BorderSide.none,
                    borderRadius:
                        BorderRadius.all(Radius.circular(kItemPadding))),
                hintText: 'Search your deacription',
                prefixIcon: Padding(
                  padding: EdgeInsets.all(kTopPadding),
                  child: Icon(
                    FontAwesomeIcons.magnifyingGlass,
                    color: Colors.black,
                    size: kDefaultPadding,
                  ),
                ),
                contentPadding: EdgeInsets.symmetric(horizontal: kItemPadding),
                filled: true,
                fillColor: Colors.white),
          ),
          SizedBox(
            height: kDefaultPadding,
          ),
          Row(
            children: [
              Expanded(
                  child: _buildItemCategory(
                      ImageHelper.loadFromAsset(AssetHelper.icoHotel,
                          width: kBottomBarIconSize,
                          height: kBottomBarIconSize),
                      Color(0xffFE9C5E), () {
                Navigator.of(context).pushNamed(HotelScreen.routeName);
              }, 'Hotels')),
              SizedBox(
                width: kDefaultPadding,
              ),
              Expanded(
                  child: _buildItemCategory(
                      ImageHelper.loadFromAsset(AssetHelper.icoPlane,
                          width: kBottomBarIconSize,
                          height: kBottomBarIconSize),
                      Color(0xffF77777),
                      () => null,
                      'Flights')),
              SizedBox(
                width: kDefaultPadding,
              ),
              Expanded(
                  child: _buildItemCategory(
                      ImageHelper.loadFromAsset(AssetHelper.icoHotelPlane,
                          width: kBottomBarIconSize,
                          height: kBottomBarIconSize),
                      Color(0xff3ECBBC),
                      () => null,
                      'All')),
            ],
          )
        ],
      ),
    );
  }
}
