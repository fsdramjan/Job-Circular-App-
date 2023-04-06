import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:job_circular_app/service/configs/appUtils.dart';
import 'package:job_circular_app/service/controllerService.dart';
import 'package:job_circular_app/view/components/drawer/sidebarComponent.dart';
import 'package:job_circular_app/view/widgets/appBar/cAppBar.dart';

import '../../../service/configs/appColors.dart';
import '../../widgets/card/customCard.dart';
import '../../widgets/form/cFormField.dart';
import '../../widgets/text/kText.dart';

class ProfilePage extends StatelessWidget with AllController {
  @override
  Widget build(BuildContext context) {
    final _auth = FirebaseAuth.instance;

    authC.phoneController.text = _auth.currentUser!.phoneNumber ?? '';

    authC.getProfileInfo().then((_) {
      _.map((e) {
        fileUploadC.selectedImage.value = e.image ?? '';
        authC.name.value.text = e.name ?? '';
        authC.email.value.text = e.email ?? '';
      }).toList();
    });
    return Scaffold(
      drawer: sidebarComponent(),
      appBar: cAppBar(title: 'My Account'),
      body: Padding(
        padding: paddingAll10,
        child: ListView(
          children: [
            Obx(
              () => GestureDetector(
                onTap: () {
                  fileUploadC.pickImage(uploadCategory: 'users');
                },
                child: CircleAvatar(
                  radius: 40,
                  child: CircleAvatar(
                    radius: 38,
                    backgroundColor: white,
                    backgroundImage: fileUploadC.selectedImage.value != ''
                        ? NetworkImage(fileUploadC.selectedImage.value)
                        : null,
                    child: Icon(
                      Icons.add_a_photo,
                    ),
                  ),
                ),
              ),
            ),
            sizeH5,
            Center(
              child: KText(
                text: 'Add Profile Picture',
                fontSize: 12,
                color: black54,
              ),
            ),
            sizeH10,
            KText(
              text: 'Name',
            ),
            sizeH10,
            cFormField(
              height: 45,
              controller: authC.name.value,
              borderColor: grey,
              hintText: 'Enter your name',
              fontSize: 16,
              contentPadding: paddingH10,
            ),
            sizeH10,
            KText(
              text: 'Email',
            ),
            sizeH10,
            cFormField(
              height: 45,
              controller: authC.email.value,
              borderColor: grey,
              hintText: 'Enter your email',
              fontSize: 16,
              contentPadding: paddingH10,
            ),
            sizeH10,
            KText(
              text: 'Phone',
            ),
            sizeH10,
            cFormField(
              height: 45,
              borderColor: grey,
              controller: authC.phoneController,
              hintText: 'Enter your phone',
              readOnly: true,
              fontSize: 16,
              contentPadding: paddingH10,
              suffixIcon: Icon(
                Icons.lock,
                size: 15,
              ),
            ),
            sizeH5,
            Align(
              alignment: Alignment.centerRight,
              child: KText(
                text: 'You can not update your primary phone number.',
                fontStyle: FontStyle.italic,
                color: black54,
                fontSize: 13,
              ),
            ),
            sizeH20,
            customCard(
              color: green,
              height: 40,
              borderRadiusC: 10,
              onTap: () => authC.updateProfile(),
              child: Center(
                child: KText(
                  text: 'Save',
                  fontSize: 16,
                  fontWeight: FontWeight.w700,
                  color: white,
                ),
              ),
            ),
            sizeH10,
            Divider(),
            sizeH10,
            customCard(
              color: red,
              height: 40,
              borderRadiusC: 10,
              onTap: () => authC.removeCurrentUser(),
              child: Center(
                child: KText(
                  text: 'Delete Account',
                  fontSize: 16,
                  fontWeight: FontWeight.w700,
                  color: white,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
