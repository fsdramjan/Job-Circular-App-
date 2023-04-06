import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:job_circular_app/service/configs/appColors.dart';
import 'package:job_circular_app/service/configs/appUtils.dart';
import 'package:job_circular_app/service/controllerService.dart';
import 'package:job_circular_app/service/dialog/dialog.dart';
import 'package:job_circular_app/view/widgets/button/rowButtonProfile.dart';
import 'package:job_circular_app/view/widgets/text/kText.dart';

class AreaService extends GetxController {
  final _firestore = FirebaseFirestore.instance;

  Stream<QuerySnapshot<Map<String, dynamic>>> getDistricts() {
    return _firestore.collection('districts').snapshots();
  }

  Stream<QuerySnapshot<Map<String, dynamic>>> getUpazilas() {
    final _ = AllController();

    return _firestore
        .collection('upazilas')
        .where('districtsId', isEqualTo: _.jobProfileC.districtId.value)
        .snapshots();
  }

  Stream<QuerySnapshot<Map<String, dynamic>>> getUnions() {
    final _ = AllController();

    return _firestore
        .collection('unions')
        .where('upazilaId', isEqualTo: _.jobProfileC.upazilaId.value)
        .snapshots();
  }

  void districs({
    bool isParmanentAddress = false,
    required Rx<TextEditingController> controller,
  }) {
    final _ = AllController();
    dialog(
      dialogName: 'Select District',
      height: Get.height / 1.5,
      child: Padding(
        padding: paddingH20,
        child: StreamBuilder(
          stream: getDistricts(),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              return snapshot.data!.size == 0
                  ? Center(child: KText(text: 'No data'))
                  : ListView.builder(
                      shrinkWrap: true,
                      primary: false,
                      itemCount: snapshot.data!.size,
                      itemBuilder: (c, i) {
                        final item = snapshot.data!.docs[i];
                        return Padding(
                          padding: EdgeInsets.only(bottom: 10),
                          child: rowButtonProfile(
                            onTap: () {
                              if (isParmanentAddress == false) {
                                _.jobProfileC.district.value.text =
                                    item['name'];
                                _.jobProfileC.districtId.value =
                                    item['districtsId'];

                                _.jobProfileC.upazila.value.text = '';
                                _.jobProfileC.upazilaId.value = '';

                                _.jobProfileC.postOffice.value.text = '';
                                _.jobProfileC.postOfficeId.value = '';
                                Get.back();
                              } else {
                                _.jobProfileC.districtP.value.text =
                                    item['name'];
                                _.jobProfileC.districtIdP.value =
                                    item['districtsId'];

                                _.jobProfileC.upazilaP.value.text = '';
                                _.jobProfileC.upazilaIdP.value = '';

                                _.jobProfileC.postOfficeP.value.text = '';
                                _.jobProfileC.postOfficeIdP.value = '';
                                Get.back();
                              }
                            },
                            leadingText: item['name'],
                            leadingTextColor: black,
                            rightIcon: controller.value.text == item['name']
                                ? Icons.check_circle_rounded
                                : null,
                            rightIconColor: green,
                          ),
                        );
                      });
            } else if (snapshot.hasError) {
              return Text('Error: ${snapshot.error}');
            } else {
              return CircularProgressIndicator();
            }
          },
        ),
      ),
    );
  }

  void upzila({
    bool isParmanentAddress = false,
    required Rx<TextEditingController> controller,
  }) {
    final _ = AllController();
    dialog(
      dialogName: 'Select Upzila',
      height: Get.height / 1.5,
      child: Padding(
        padding: paddingH20,
        child: StreamBuilder(
          stream: getUpazilas(),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              return snapshot.data!.size == 0
                  ? Center(child: KText(text: 'No data'))
                  : ListView.builder(
                      shrinkWrap: true,
                      primary: false,
                      itemCount: snapshot.data!.size,
                      itemBuilder: (c, i) {
                        final item = snapshot.data!.docs[i];
                        return Padding(
                          padding: EdgeInsets.only(bottom: 10),
                          child: rowButtonProfile(
                            onTap: () {
                              if (isParmanentAddress == false) {
                                _.jobProfileC.upazila.value.text = item['name'];
                                _.jobProfileC.upazilaId.value =
                                    item['upazilaId'];

                                _.jobProfileC.postOffice.value.text = '';
                                _.jobProfileC.postOfficeId.value = '';
                                Get.back();
                              } else {
                                _.jobProfileC.upazilaP.value.text =
                                    item['name'];
                                _.jobProfileC.upazilaIdP.value =
                                    item['upazilaId'];

                                _.jobProfileC.postOfficeP.value.text = '';
                                _.jobProfileC.postOfficeIdP.value = '';
                                Get.back();
                              }
                            },
                            leadingText: item['name'],
                            leadingTextColor: black,
                            rightIcon: controller.value.text == item['name']
                                ? Icons.check_circle_rounded
                                : null,
                            rightIconColor: green,
                          ),
                        );
                      });
            } else if (snapshot.hasError) {
              return Text('Error: ${snapshot.error}');
            } else {
              return CircularProgressIndicator();
            }
          },
        ),
      ),
    );
  }

  void postOffice({
    bool isParmanentAddress = false,
    required Rx<TextEditingController> controller,
  }) {
    final _ = AllController();
    dialog(
      dialogName: 'Select Post Office',
      height: Get.height / 1.5,
      child: Padding(
        padding: paddingH20,
        child: StreamBuilder(
          stream: getUnions(),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              print(snapshot.data!.size);
              return ListView.builder(
                  shrinkWrap: true,
                  primary: false,
                  itemCount: snapshot.data!.size,
                  itemBuilder: (c, i) {
                    final item = snapshot.data!.docs[i];
                    return Padding(
                      padding: EdgeInsets.only(bottom: 10),
                      child: rowButtonProfile(
                        onTap: () {
                          if (isParmanentAddress == true) {
                            _.jobProfileC.postOfficeP.value.text = item['name'];
                            _.jobProfileC.postOfficeIdP.value =
                                item['postOfficeId'];
                            Get.back();
                          } else {
                            _.jobProfileC.postOffice.value.text = item['name'];
                            _.jobProfileC.postOfficeId.value =
                                item['postOfficeId'];
                            Get.back();
                          }
                        },
                        leadingText: item['name'],
                        leadingTextColor: black,
                        rightIcon: controller.value.text == item['name']
                            ? Icons.check_circle_rounded
                            : null,
                        rightIconColor: green,
                      ),
                    );
                  });
            } else if (snapshot.hasError) {
              return Text('Error: ${snapshot.error}');
            } else {
              return CircularProgressIndicator();
            }
          },
        ),
      ),
    );
  }
}
