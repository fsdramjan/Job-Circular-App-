import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:job_circular_app/service/configs/appColors.dart';
import 'package:job_circular_app/service/configs/appUtils.dart';
import 'package:job_circular_app/service/controllerService.dart';
import 'package:job_circular_app/view/pages/ageCalculator/ageCalculatorPage.dart';
import 'package:job_circular_app/view/pages/home/homePage.dart';
import 'package:job_circular_app/view/pages/job/categoryWiseJob/categoryWiseJobPage.dart';
import 'package:job_circular_app/view/pages/job/otherCategoryPost/otherCategoryPostPage.dart';
import 'package:job_circular_app/view/pages/saveDocument/saveCvPage.dart';
import 'package:job_circular_app/view/pages/saveDocument/savePasswordPage.dart';
import 'package:job_circular_app/view/pages/settings/privacyPolicyPage.dart';
import 'package:job_circular_app/view/pages/settings/termsConditionsPage.dart';
import 'package:job_circular_app/view/widgets/text/kText.dart';

import '../../pages/saveDocument/saveAdmiCardPage.dart';
import '../../pages/wishlist/wishlistPage.dart';

Widget sidebarComponent() {
  final allC = AllController();
  return SafeArea(
    child: Drawer(
      child: Padding(
        padding: paddingH10,
        child: ListView(
          shrinkWrap: true,
          primary: false,
          children: [
            sizeH10,
            rowButton(
              onTap: () => Get.back(),
              icons: Icons.arrow_back,
              text: 'Close Menu',
            ),
            rowButton(
              onTap: () => Get.offAll(HomePage()),
              icons: Icons.home,
              text: 'Home',
            ),
            rowButton(
              onTap: () => Get.to(WishlistPage()),
              icons: Icons.favorite,
              text: 'Favorite List',
            ),
            rowButton(
              onTap: () {},
              icons: Icons.send_sharp,
              text: 'আমাদের মাধ্যমে Apply করুন',
            ),
            Divider(),
            rowButton(
              onTap: () => Get.offAll(OtherCategoryPostPage(
                categoryName: 'Job Exam Notice',
                categoryId: 'jSo7HmNm7wCMeb5e5o75',
              )),
              icons: Icons.edit,
              text: 'Job Exam Notice',
            ),
            rowButton(
              onTap: () => Get.offAll(OtherCategoryPostPage(
                categoryName: 'Job Exam Result',
                categoryId: 'ury9SwN4JAJQRlRAFwYS',
              )),
              icons: Icons.local_fire_department,
              text: 'Job Exam Result',
            ),
            rowButton(
              onTap: () => Get.offAll(OtherCategoryPostPage(
                categoryName: 'National University News',
                categoryId: 'uT1rn9EzCva7H1wMO3y3',
              )),
              icons: Icons.school,
              text: 'National University News',
            ),
            Divider(),
            KText(
              text: 'Job Preparation',
              color: grey,
              fontWeight: FontWeight.w700,
            ),
            rowButton(
              onTap: () => Get.offAll(OtherCategoryPostPage(
                categoryName: 'Question Model',
                categoryId: 'MCGzFehf7bbf8PdmOoHb',
              )),
              icons: Icons.question_answer_outlined,
              text: 'Question Model',
            ),
            rowButton(
              onTap: () => Get.offAll(OtherCategoryPostPage(
                categoryName: 'Model Test',
                categoryId: 'wFsOV7pYaIakntbuZp8K',
              )),
              icons: Icons.text_snippet,
              text: 'Model Test',
            ),

            rowButton(
              onTap: () => Get.offAll(OtherCategoryPostPage(
                categoryName: 'ভাইভা অভিজ্ঞতা',
                categoryId: 'S2ugi2RwP0BFS897frW5',
              )),
              icons: Icons.filter_tilt_shift,
              text: 'ভাইভা অভিজ্ঞতা',
            ),
            rowButton(
              onTap: () => Get.offAll(OtherCategoryPostPage(
                categoryName: 'ডাউনলোড জোন',
                categoryId: 'i3hxQrpMyN7UiY7EseV9',
              )),
              icons: Icons.download,
              text: 'ডাউনলোড জোন',
            ),

            Divider(),
            KText(
              text: 'Job Category',
              color: grey,
              fontWeight: FontWeight.w700,
            ),
            sizeH10,

            StreamBuilder(
                stream: allC.categoryC.getAllCategory(),
                builder: (context,
                    AsyncSnapshot<QuerySnapshot<Map<String, dynamic>>>
                        snapshot) {
                  if (!snapshot.hasData) {
                    return Center(
                      child: CircularProgressIndicator(),
                    );
                  }

                  return ListView.builder(
                      shrinkWrap: true,
                      primary: false,
                      itemCount: snapshot.data!.size,
                      itemBuilder: (c, i) {
                        final item = snapshot.data!.docs[i];
                        return rowButton(
                          onTap: () => Get.offAll(
                            CategoryWiseJobPage(
                              title: item['categoryName'],
                              categoryId: item['id'],
                            ),
                          ),
                          icons: Icons.crop_free,
                          text: item['categoryName'],
                        );
                      });
                }),

            // rowButton(
            //   onTap: () => Get.to(
            //     CategoryWiseJobPage(
            //       title: 'সরকারি চাকরি',
            //     ),
            //   ),
            //   icons: Icons.crop_free,
            //   text: 'সরকারি চাকরি',
            // ),
            // rowButton(
            //   onTap: () => Get.to(
            //     CategoryWiseJobPage(
            //       title: 'ব্যাংক জবস',
            //     ),
            //   ),
            //   icons: Icons.crop_free,
            //   text: 'ব্যাংক জবস',
            // ),
            // rowButton(
            //   onTap: () => Get.to(
            //     CategoryWiseJobPage(
            //       title: 'এনজিও জবস',
            //     ),
            //   ),
            //   icons: Icons.crop_free,
            //   text: 'এনজিও জবস',
            // ),

            // rowButton(
            //   onTap: () => Get.to(
            //     CategoryWiseJobPage(
            //       title: 'বেসরকারি চাকরি',
            //     ),
            //   ),
            //   icons: Icons.crop_free,
            //   text: 'বেসরকারি চাকরি',
            // ),

            Divider(),
            KText(
              text: 'আবেদন সহায়িকা',
              color: grey,
              fontWeight: FontWeight.w500,
            ),
            rowButton(
              onTap: () => Get.offAll(OtherCategoryPostPage(
                categoryName: 'আবেদন ফরম,CV,অন্যান্য',
                categoryId: 'ThXs21Jmzwrn4exGjedH',
              )),
              icons: Icons.calendar_month,
              text: 'আবেদন ফরম,CV,অন্যান্য',
            ),
            rowButton(
              onTap: () => Get.to(AgeCalculatorPage()),
              icons: Icons.calculate_rounded,
              text: 'Age Calculator',
            ),

            Divider(),
            KText(
              text: 'Save Document',
              color: grey,
              fontWeight: FontWeight.w500,
            ),
            rowButton(
              onTap: () => Get.to(SaveCvPage()),
              icons: Icons.save,
              text: 'Save Cv',
            ),
            rowButton(
              onTap: () => Get.to(SavePasswordPage()),
              icons: Icons.vpn_lock,
              text: 'Save Password',
            ),
            rowButton(
              onTap: () => Get.to(SaveAdmitCardPage()),
              icons: Icons.save,
              text: 'Save Admit Card',
            ),
            Divider(),
            KText(
              text: 'About App',
              color: grey,
              fontWeight: FontWeight.w600,
            ),

            rowButton(
              onTap: () => Get.to(TermsConditionsPage()),
              icons: Icons.info_outlined,
              text: 'Terms-Conditions',
            ),
            rowButton(
              onTap: () => Get.to(PrivacyPolicyPage()),
              icons: Icons.privacy_tip,
              text: 'Privacy Policy',
            ),

            sizeH40,
          ],
        ),
      ),
    ),
  );
}

Widget rowButton({
  required void Function()? onTap,
  required IconData icons,
  required String text,
}) {
  return InkWell(
    onTap: onTap,
    borderRadius: BorderRadius.circular(5),
    child: Padding(
      padding: paddingAll10,
      child: Row(
        children: [
          Icon(
            icons,
            size: 20,
            color: grey,
          ),
          sizeW20,
          KText(
            text: text,
            color: black54,
            fontWeight: FontWeight.w600,
          ),
        ],
      ),
    ),
  );
}
