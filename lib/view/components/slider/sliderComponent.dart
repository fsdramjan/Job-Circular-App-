import 'package:carousel_slider/carousel_slider.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:job_circular_app/service/controllerService.dart';
import 'package:job_circular_app/view/widgets/text/kText.dart';

import '../../../service/configs/appColors.dart';

class SliderComponent extends StatelessWidget with AllController {
  final double? height;
  SliderComponent({this.height});

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      stream: FirebaseFirestore.instance
          .collection('homeStaticNotifications')
          .snapshots(),
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          return CarouselSlider.builder(
            itemCount: snapshot.data!.size,
            itemBuilder: (
              BuildContext context,
              int itemIndex,
              int pageViewIndex,
            ) {
              final item = snapshot.data!.docs[itemIndex];
              return Container(
                height: height ?? 40,
                width: Get.width,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  // color: red,
                ),
                alignment: Alignment.centerRight,
                child: KText(
                  text: item['title'],
                  color: green,
                ),
              );
            },
            options: CarouselOptions(
              height: height ?? 40,
              // aspectRatio: 16 / 9,
              viewportFraction: 1,
              pageSnapping: true,
              initialPage: 0,
              // enableInfiniteScroll: true,
              reverse: true,
              autoPlay: true,

              autoPlayInterval: Duration(seconds: 3),
              autoPlayAnimationDuration: Duration(milliseconds: 800),
              autoPlayCurve: Curves.fastOutSlowIn,
              enlargeCenterPage: false,
              // onPageChanged: callbackFunction,
              scrollDirection: Axis.vertical,
            ),
          );
        } else if (snapshot.hasError) {
          return Text('Error: ${snapshot.error}');
        } else {
          return CircularProgressIndicator();
        }
      },
    );
  }
}
