import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:safebox/core/app_export.dart';

// ignore: must_be_immutable
class Imageslide extends StatelessWidget {
  Imageslide({super.key});
  List<String> imgList = [
    ImageConstant.imgSlider1,
    ImageConstant.imgSlider2,
    ImageConstant.imgSlider3,
  ];

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 15.0, right: 15.0),
      child: CarouselSlider(
        options: CarouselOptions(
            autoPlay: true,
            aspectRatio: 16 / 6,
            padEnds: false,
            viewportFraction: 1,
            clipBehavior: Clip.antiAlias),
        items: imgList
            .map((item) => SvgPicture.asset(
                  item,
                  width: MediaQuery.of(context).size.width,
                ))
            .toList(),
      ),
    );
  }
}
