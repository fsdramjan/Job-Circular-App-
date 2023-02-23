import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:job_circular_app/service/configs/appColors.dart';
import 'package:job_circular_app/service/configs/appUtils.dart';
import 'package:job_circular_app/view/pages/ageCalculator/ageCalculatorPage.dart';
import 'package:job_circular_app/view/pages/home/homePage.dart';
import 'package:job_circular_app/view/pages/job/categoryWiseJob/categoryWiseJobPage.dart';
import 'package:job_circular_app/view/widgets/text/kText.dart';

Widget sidebarComponent() {
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
              onTap: () {},
              icons: Icons.favorite,
              text: 'Favorite List',
            ),
            Divider(),
            rowButton(
              onTap: () => Get.to(CategoryWiseJobPage(
                title: 'Job Exam Notice',
              )),
              icons: Icons.edit,
              text: 'Job Exam Notice',
            ),
            rowButton(
              onTap: () {},
              icons: Icons.local_fire_department,
              text: 'Exclusive News',
            ),
            rowButton(
              onTap: () {},
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
              onTap: () => Get.to(
                CategoryWiseJobPage(
                  title: 'ক্যরিয়ার গাইড',
                ),
              ),
              icons: Icons.local_library,
              text: 'ক্যরিয়ার গাইড',
            ),
            rowButton(
              onTap: () => Get.to(
                CategoryWiseJobPage(
                  title: 'প্রতিদিনের তথ্য',
                ),
              ),
              icons: Icons.calendar_month,
              text: 'প্রতিদিনের তথ্য',
            ),
            rowButton(
              onTap: () => Get.to(
                CategoryWiseJobPage(
                  title: 'প্রতিদিনের তথ্য',
                ),
              ),
              icons: Icons.info_rounded,
              text: 'সাম্প্রতিক তথ্য',
            ),
            rowButton(
              onTap: () => Get.to(
                CategoryWiseJobPage(
                  title: 'অনুবাদ চর্চা',
                ),
              ),
              icons: Icons.g_translate,
              text: 'অনুবাদ চর্চা',
            ),
            rowButton(
              onTap: () => Get.to(
                CategoryWiseJobPage(
                  title: 'প্রিলিমিনারি প্রস্তুতি',
                ),
              ),
              icons: Icons.check_box,
              text: 'প্রিলিমিনারি প্রস্তুতি',
            ),
            rowButton(
              onTap: () => Get.to(
                CategoryWiseJobPage(
                  title: 'লিখিত প্রস্তুতি',
                ),
              ),
              icons: Icons.assignment,
              text: 'লিখিত প্রস্তুতি',
            ),
            rowButton(
              onTap: () => Get.to(
                CategoryWiseJobPage(
                  title: 'ইন্টারভিউ টিপস',
                ),
              ),
              icons: Icons.center_focus_strong,
              text: 'ইন্টারভিউ টিপস',
            ),
            rowButton(
              onTap: () => Get.to(
                CategoryWiseJobPage(
                  title: 'ভাইভা অভিজ্ঞতা',
                ),
              ),
              icons: Icons.filter_tilt_shift,
              text: 'ভাইভা অভিজ্ঞতা',
            ),
            rowButton(
              onTap: () => Get.to(
                CategoryWiseJobPage(
                  title: 'ডাউনলোড জোন',
                ),
              ),
              icons: Icons.download,
              text: 'ডাউনলোড জোন',
            ),
            rowButton(
              onTap: () {},
              icons: Icons.radio_button_checked,
              text: 'Model Test',
            ),
            Divider(),
            KText(
              text: 'Job Category',
              color: grey,
              fontWeight: FontWeight.w700,
            ),
            rowButton(
              onTap: () => Get.to(
                CategoryWiseJobPage(
                  title: 'সরকারি চাকরি',
                ),
              ),
              icons: Icons.crop_free,
              text: 'সরকারি চাকরি',
            ),
            rowButton(
              onTap: () => Get.to(
                CategoryWiseJobPage(
                  title: 'ব্যাংক জবস',
                ),
              ),
              icons: Icons.crop_free,
              text: 'ব্যাংক জবস',
            ),
            rowButton(
              onTap: () => Get.to(
                CategoryWiseJobPage(
                  title: 'এনজিও জবস',
                ),
              ),
              icons: Icons.crop_free,
              text: 'এনজিও জবস',
            ),
            rowButton(
              onTap: () => Get.to(
                CategoryWiseJobPage(
                  title: 'শিক্ষক নিয়োগ',
                ),
              ),
              icons: Icons.crop_free,
              text: 'শিক্ষক নিয়োগ',
            ),
            rowButton(
              onTap: () => Get.to(
                CategoryWiseJobPage(
                  title: 'সেলস/মার্কেটিং',
                ),
              ),
              icons: Icons.crop_free,
              text: 'সেলস/মার্কেটিং',
            ),
            rowButton(
              onTap: () {},
              icons: Icons.crop_free,
              text: 'রেলওয়ে জবস',
            ),
            rowButton(
              onTap: () => Get.to(
                CategoryWiseJobPage(
                  title: 'ডিফেন্স জবস',
                ),
              ),
              icons: Icons.crop_free,
              text: 'ডিফেন্স জবস',
            ),
            rowButton(
              onTap: () => Get.to(
                CategoryWiseJobPage(
                  title: 'হেলথ/মেডিক্যাল',
                ),
              ),
              icons: Icons.crop_free,
              text: 'হেলথ/মেডিক্যাল',
            ),
            rowButton(
              onTap: () => Get.to(
                CategoryWiseJobPage(
                  title: 'চাকরির পত্রিকা',
                ),
              ),
              icons: Icons.crop_free,
              text: 'চাকরির পত্রিকা',
            ),
            rowButton(
              onTap: () => Get.to(
                CategoryWiseJobPage(
                  title: 'বেসরকারি চাকরি',
                ),
              ),
              icons: Icons.crop_free,
              text: 'বেসরকারি চাকরি',
            ),
            Divider(),
            KText(
              text: 'Special Job Category',
              color: grey,
              fontWeight: FontWeight.w700,
            ),
            rowButton(
              onTap: () {},
              icons: Icons.check_box,
              text: 'Hot Jobs',
            ),
            rowButton(
              onTap: () {},
              icons: Icons.check_box,
              text: 'Date Wise Jobs',
            ),
            rowButton(
              onTap: () {},
              icons: Icons.check_box,
              text: 'Part Time Jobs',
            ),
            rowButton(
              onTap: () {},
              icons: Icons.check_box,
              text: 'Class 5 to HSC',
            ),
            rowButton(
              onTap: () {},
              icons: Icons.check_box,
              text: 'Hons./Degree Pass',
            ),
            rowButton(
              onTap: () {},
              icons: Icons.check_box,
              text: 'Masters Degree',
            ),
            rowButton(
              onTap: () {},
              icons: Icons.check_box,
              text: 'Diploma/Engineering',
            ),
            // Divider(),
            // KText(
            //   text: 'Job Question Bank',
            //   color: grey,
            //   fontWeight: FontWeight.w700,
            // ),
            // rowButton(
            //   onTap: () {},
            //   icons: Icons.check_circle,
            //   text: 'Recent Job Question',
            // ),
            // rowButton(
            //   onTap: () {},
            //   icons: Icons.check_circle,
            //   text: 'BCS Question',
            // ),
            // rowButton(
            //   onTap: () {},
            //   icons: Icons.check_circle,
            //   text: 'NTRCA Question',
            // ),
            // rowButton(
            //   onTap: () {},
            //   icons: Icons.check_circle,
            //   text: 'Primary Question',
            // ),
            Divider(),
            KText(
              text: 'আবেদন সহায়িকা',
              color: grey,
              fontWeight: FontWeight.w500,
            ),
            rowButton(
              onTap: () {},
              icons: Icons.calendar_month,
              text: 'আবেদন ফরম,CV,অন্যান্য',
            ),
            rowButton(
              onTap: () => Get.to(AgeCalculatorPage()),
              icons: Icons.calculate_rounded,
              text: 'Age Calculator',
            ),
            // Divider(),
            // KText(
            //   text: 'Career Forum',
            //   color: grey,
            //   fontWeight: FontWeight.w500,
            // ),
            // rowButton(
            //   onTap: () {},
            //   icons: Icons.message,
            //   text: 'প্রশ্নোত্তোর সেকশন',
            // ),
            // rowButton(
            //   onTap: () {},
            //   icons: Icons.help,
            //   text: 'সচারচর জিজ্ঞাসিত(FAQ)',
            // ),
            // Divider(),
            // rowButton(
            //   onTap: () {},
            //   icons: Icons.help,
            //   text: 'Notification Setting',
            // ),
            Divider(),
            KText(
              text: 'About App',
              color: grey,
              fontWeight: FontWeight.w600,
            ),
            // rowButton(
            //   onTap: () {},
            //   icons: Icons.android,
            //   text: 'More Apps',
            // ),
            rowButton(
              onTap: () {},
              icons: Icons.info_outlined,
              text: 'Terms-Conditions',
            ),
            rowButton(
              onTap: () {},
              icons: Icons.privacy_tip,
              text: 'Privacy Policy',
            ),
            // rowButton(
            //   onTap: () {},
            //   icons: Icons.system_update,
            //   text: 'Check for update',
            // ),
            // rowButton(
            //   onTap: () {},
            //   icons: Icons.info,
            //   text: 'About Us',
            // ),
            // rowButton(
            //   onTap: () {},
            //   icons: Icons.email,
            //   text: 'Contact Us',
            // ),
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
