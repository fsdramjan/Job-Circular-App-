import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:job_circular_app/service/area/areaService.dart';
import 'package:job_circular_app/service/configs/appColors.dart';
import 'package:job_circular_app/service/configs/appUtils.dart';
import 'package:job_circular_app/service/controllerService.dart';
import 'package:job_circular_app/service/snackbar/snackbar.dart';
import 'package:job_circular_app/view/components/drawer/sidebarComponent.dart';
import 'package:job_circular_app/view/widgets/appBar/cAppBar.dart';
import 'package:job_circular_app/view/widgets/button/iconButton.dart';
import 'package:job_circular_app/view/widgets/card/customCard.dart';
import 'package:job_circular_app/view/widgets/form/cFormField.dart';
import 'package:job_circular_app/view/widgets/text/kText.dart';

class AddressPage extends StatelessWidget with AllController {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: cAppBar(title: 'Address'),
      drawer: sidebarComponent(),
      body: Form(
        key: formKey,
        child: Padding(
          padding: paddingAll10,
          child: StreamBuilder(
            stream: jobProfileC.getAddress(),
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                final item = snapshot.data!.docs;

                if (snapshot.data!.docs.isNotEmpty) {
                  WidgetsBinding.instance.addPostFrameCallback((_) {
                    jobProfileC.careOf.text = item.first['careOf'] ?? '';
                    jobProfileC.village.text = item.first['village'] ?? '';
                    jobProfileC.postCode.text = item.first['postalCode'] ?? '';
                    jobProfileC.postOffice.value.text =
                        item.first['postOffice'] ?? '';
                    jobProfileC.postOfficeId.value =
                        item.first['postOfficeId'] ?? '';

                    jobProfileC.district.value.text =
                        item.first['district'] ?? '';
                    jobProfileC.districtId.value =
                        item.first['districtId'] ?? '';

                    jobProfileC.upazila.value.text =
                        item.first['upazila'] ?? '';
                    jobProfileC.upazilaId.value = item.first['upazila'] ?? '';

                    jobProfileC.isSameAsPresentAddress.value =
                        item.first['isSameAsPresentAddress'] ?? '';

                    jobProfileC.careOfP.text = item.first['careOfP'] ?? '';
                    jobProfileC.villageP.text = item.first['villageP'] ?? '';
                    jobProfileC.postCodeP.text =
                        item.first['postalCodeP'] ?? '';
                    jobProfileC.postOfficeP.value.text =
                        item.first['postOfficeP'] ?? '';
                    jobProfileC.postOfficeIdP.value =
                        item.first['postOfficeIdP'] ?? '';

                    jobProfileC.districtP.value.text =
                        item.first['districtP'] ?? '';
                    jobProfileC.districtIdP.value =
                        item.first['districtIdP'] ?? '';

                    jobProfileC.upazilaP.value.text =
                        item.first['upazilaP'] ?? '';
                    jobProfileC.upazilaIdP.value = item.first['upazilaP'] ?? '';
                  });
                }
                return ListView(
                  children: [
                    cFormField(
                      height: 0,
                      controller: jobProfileC.careOf,
                      borderColor: grey.shade300,
                      hintText: 'Care Of',
                      fontSize: 14,
                      contentPadding: paddingH10,
                      isAutoValidateText: true,
                      isRequiredField: true,
                    ),
                    sizeH10,
                    cFormField(
                      controller: jobProfileC.village,
                      height: 0,
                      borderColor: grey.shade300,
                      hintText: 'Village / Town / Road / House / Flat',
                      fontSize: 14,
                      contentPadding: paddingH10,
                      isAutoValidateText: true,
                      isRequiredField: true,
                    ),
                    sizeH10,
                    cFormField(
                      height: 0,
                      controller: jobProfileC.district.value,
                      borderColor: grey.shade300,
                      hintText: 'District',
                      fontSize: 14,
                      contentPadding: paddingH10,
                      readOnly: true,
                      isAutoValidateText: true,
                      isRequiredField: true,
                      suffixIcon: iconButton(
                        onTap: () => AreaService()
                            .districs(controller: jobProfileC.district),
                        icons: Icons.arrow_drop_down,
                      ),
                    ),
                    sizeH10,
                    cFormField(
                      height: 0,
                      controller: jobProfileC.upazila.value,
                      borderColor: grey.shade300,
                      hintText: 'Upazila',
                      fontSize: 14,
                      contentPadding: paddingH10,
                      readOnly: true,
                      isAutoValidateText: true,
                      isRequiredField: true,
                      suffixIcon: iconButton(
                        onTap: () => jobProfileC.district.value.text.isEmpty
                            ? snackbar('Please select a district!!',
                                bgColor: red)
                            : AreaService()
                                .upzila(controller: jobProfileC.upazila),
                        icons: Icons.arrow_drop_down,
                      ),
                    ),
                    sizeH10,
                    cFormField(
                      height: 0,
                      controller: jobProfileC.postOffice.value,
                      borderColor: grey.shade300,
                      hintText: 'Post Office',
                      fontSize: 14,
                      contentPadding: paddingH10,
                      readOnly: true,
                      isAutoValidateText: true,
                      isRequiredField: true,
                      suffixIcon: iconButton(
                        onTap: () => jobProfileC.upazila.value.text.isEmpty
                            ? snackbar('Please select a upazila!!',
                                bgColor: red)
                            : AreaService()
                                .postOffice(controller: jobProfileC.postOffice),
                        icons: Icons.arrow_drop_down,
                      ),
                    ),
                    sizeH10,
                    cFormField(
                      controller: jobProfileC.postCode,
                      height: 0,
                      borderColor: grey.shade300,
                      hintText: 'Postal Code',
                      fontSize: 14,
                      isAutoValidateText: true,
                      isRequiredField: true,
                      textInputType: TextInputType.number,
                      contentPadding: paddingH10,
                    ),
                    sizeH10,
                    Obx(
                      () => Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              KText(
                                text: 'Permanent Address',
                                color: green,
                                fontSize: 14,
                                fontWeight: FontWeight.w600,
                                decoration: TextDecoration.underline,
                              ),
                              Spacer(),
                              Checkbox(
                                value: jobProfileC.isSameAsPresentAddress.value,
                                onChanged: (bool? _) {
                                  jobProfileC.isSameAsPresentAddress.value =
                                      _ as bool;
                                  jobProfileC.careOfP.clear();
                                  jobProfileC.villageP.clear();
                                  jobProfileC.districtP.value.clear();
                                  jobProfileC.upazilaP.value.clear();
                                  jobProfileC.postOfficeP.value.clear();

                                  jobProfileC.districtIdP.value = '';
                                  jobProfileC.upazilaIdP.value = '';
                                  jobProfileC.postOfficeIdP.value = '';

                                  jobProfileC.postCodeP.clear();
                                },
                              ),
                              KText(
                                text: 'Same as Present Address',
                                color: black54,
                              ),
                            ],
                          ),
                          sizeH10,
                          cFormField(
                            height: 0,
                            borderColor: grey.shade300,
                            hintText: 'Care Of',
                            fontSize: 14,
                            contentPadding: paddingH10,
                            readOnly: jobProfileC.isSameAsPresentAddress.value,
                            controller: jobProfileC.careOfP,
                          ),
                          sizeH10,
                          cFormField(
                            height: 0,
                            borderColor: grey.shade300,
                            hintText: 'Village / Town / Road / House / Flat',
                            fontSize: 14,
                            contentPadding: paddingH10,
                            readOnly: jobProfileC.isSameAsPresentAddress.value,
                            controller: jobProfileC.villageP,
                          ),
                          sizeH10,
                          cFormField(
                            height: 0,
                            borderColor: grey.shade300,
                            hintText: 'District',
                            fontSize: 14,
                            contentPadding: paddingH10,
                            readOnly: true,
                            controller: jobProfileC.districtP.value,
                            suffixIcon: iconButton(
                              onTap: jobProfileC.isSameAsPresentAddress.value
                                  ? null
                                  : () => AreaService().districs(
                                      isParmanentAddress: true,
                                      controller: jobProfileC.districtP),
                              icons: Icons.arrow_drop_down,
                            ),
                          ),
                          sizeH10,
                          cFormField(
                            height: 0,
                            borderColor: grey.shade300,
                            hintText: 'Upazila',
                            fontSize: 14,
                            contentPadding: paddingH10,
                            readOnly: true,
                            controller: jobProfileC.upazilaP.value,
                            suffixIcon: iconButton(
                              onTap: jobProfileC.isSameAsPresentAddress.value
                                  ? null
                                  : () => jobProfileC
                                          .districtP.value.text.isEmpty
                                      ? snackbar('Please select a district!!',
                                          bgColor: red)
                                      : AreaService().upzila(
                                          isParmanentAddress: true,
                                          controller: jobProfileC.upazilaP,
                                        ),
                              icons: Icons.arrow_drop_down,
                            ),
                          ),
                          sizeH10,
                          cFormField(
                            height: 0,
                            borderColor: grey.shade300,
                            hintText: 'Post Office',
                            fontSize: 14,
                            controller: jobProfileC.postOfficeP.value,
                            contentPadding: paddingH10,
                            readOnly: true,
                            suffixIcon: iconButton(
                              onTap: jobProfileC.isSameAsPresentAddress.value
                                  ? null
                                  : () => jobProfileC
                                          .upazilaP.value.text.isEmpty
                                      ? snackbar('Please select a upazila!!',
                                          bgColor: red)
                                      : AreaService().postOffice(
                                          isParmanentAddress: true,
                                          controller: jobProfileC.postOfficeP,
                                        ),
                              icons: Icons.arrow_drop_down,
                            ),
                          ),
                          sizeH10,
                          cFormField(
                            height: 0,
                            borderColor: grey.shade300,
                            hintText: 'Postal Code',
                            controller: jobProfileC.postCodeP,
                            textInputType: TextInputType.number,
                            fontSize: 14,
                            contentPadding: paddingH10,
                            readOnly: jobProfileC.isSameAsPresentAddress.value,
                          ),
                          sizeH20,
                          customCard(
                            onTap: () {
                              if (formKey.currentState!.validate()) {
                                jobProfileC.addAddress();
                              }
                            },
                            color: green,
                            height: 40,
                            borderRadiusC: 5,
                            child: Center(
                              child: KText(
                                text: 'Next',
                                fontSize: 14,
                                color: white,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    sizeH40,
                  ],
                );
              } else if (snapshot.hasError) {
                return Text('Error: ${snapshot.error}');
              } else {
                return CircularProgressIndicator();
              }
            },
          ),
        ),
      ),
    );
  }
}
