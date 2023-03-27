import 'package:flutter/material.dart';
import 'package:job_circular_app/service/configs/appUtils.dart';
import 'package:job_circular_app/service/controllerService.dart';
import 'package:job_circular_app/service/snackbar/snackbar.dart';
import 'package:job_circular_app/view/components/drawer/sidebarComponent.dart';
import 'package:job_circular_app/view/widgets/card/customCard.dart';
import 'package:job_circular_app/view/widgets/form/cFormField.dart';
import '../../../controller/auth/authController.dart';
import '../../../service/configs/appColors.dart';
import '../../../service/datetime/datetimeFormat.dart';
import '../../widgets/appBar/cAppBar.dart';
import '../../widgets/text/kText.dart';

class SavePasswordPage extends StatelessWidget with AllController {
  @override
  Widget build(BuildContext context) {
    authC.getProfileInfo().then((_) {
      _.map((e) {
        authC.name.value.text = e.name ?? '';
        fileUploadC.selectedImage.value = e.image ?? '';
      }).toList();
    });
    print(userId().toString());
    return Scaffold(
      appBar: cAppBar(title: 'Save Password'),
      drawer: sidebarComponent(),
      body: Padding(
        padding: paddingAll10,
        child: ListView(
          children: [
            cFormField(
              height: 40,
              borderColor: grey,
              hintText: 'Title',
              fontSize: 16,
              contentPadding: paddingH10,
              controller: saveDocumentC.title,
            ),
            sizeH10,
            cFormField(
              height: 40,
              borderColor: grey,
              hintText: 'Password',
              fontSize: 16,
              controller: saveDocumentC.password,
              contentPadding: paddingH10,
            ),
            sizeH20,
            customCard(
              onTap: () {
                if (saveDocumentC.password.text.isEmpty ||
                    saveDocumentC.title.text.isEmpty) {
                  snackbar('Field Empty!!', bgColor: red);
                } else {
                  fileUploadC.selectedFile.value = saveDocumentC.password.text;
                  fileUploadC.selectedFileName.value = saveDocumentC.title.text;
                  saveDocumentC.addCv(
                    'Password',
                    successMessage: 'Password saved!!',
                  );
                }
              },
              borderRadiusC: 10,
              color: green,
              height: 35,
              child: Center(
                child: KText(
                  text: 'Save',
                  color: white,
                ),
              ),
            ),
            sizeH10,
            KText(
              text: 'All Your Password',
              fontSize: 16,
              fontWeight: FontWeight.bold,
            ),
            sizeH10,
            StreamBuilder(
              stream: saveDocumentC.getSavePassword(),
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  return ListView.builder(
                    shrinkWrap: true,
                    primary: false,
                    itemCount: snapshot.data!.size,
                    itemBuilder: (context, index) {
                      print('Size: ${snapshot.data!.size}');
                      final item = snapshot.data!.docs[index].data();
                      return Padding(
                        padding: EdgeInsets.only(bottom: 10),
                        child: customCard(
                          borderRadiusC: 5,
                          // height: 50,
                          child: Padding(
                            padding: paddingAll10,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                sizeH5,
                                Row(
                                  children: [
                                    KText(
                                      text: 'type:',
                                      color: black54,
                                      fontSize: 12,
                                    ),
                                    sizeW10,
                                    KText(
                                      text: item['fileName'],
                                    ),
                                  ],
                                ),
                                sizeH5,
                                Row(
                                  children: [
                                    KText(
                                      text: 'password:',
                                      color: black54,
                                      fontSize: 12,
                                    ),
                                    sizeW10,
                                    KText(
                                      text: item['file'],
                                    ),
                                  ],
                                ),
                                Divider(),
                                sizeH10,
                                Row(
                                  children: [
                                    CircleAvatar(
                                      radius: 8,
                                      backgroundImage: item['profilePic'] == ''
                                          ? null
                                          : NetworkImage(
                                              item['profilePic'],
                                            ),
                                      child: item['profilePic'] != ''
                                          ? null
                                          : Icon(
                                              Icons.person,
                                              size: 15,
                                            ),
                                    ),
                                    sizeW10,
                                    KText(
                                      text: item['userName'],
                                      fontSize: 12,
                                    ),
                                    Spacer(),
                                    KText(
                                      text: datetimeFormat(
                                        item['time'],
                                      ),
                                      fontSize: 12,
                                    ),
                                    sizeW20,
                                    customCard(
                                      onTap: () =>
                                          saveDocumentC.deleteSavedFile(
                                        item['id'],
                                        successMessage: 'Password removed!!',
                                      ),
                                      color: red,
                                      borderRadiusC: 10,
                                      child: Padding(
                                        padding: paddingAll5,
                                        child: Row(
                                          children: [
                                            KText(
                                              text: 'Delete',
                                              fontSize: 13,
                                              color: white,
                                            ),
                                            Icon(
                                              Icons.delete,
                                              size: 15,
                                              color: white,
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ),
                      );
                    },
                  );
                } else if (snapshot.hasError) {
                  return Text('Error: ${snapshot.error}');
                } else {
                  return CircularProgressIndicator();
                }
              },
            ),
          ],
        ),
      ),
    );
  }
}
