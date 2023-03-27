import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:job_circular_app/service/configs/appUtils.dart';
import '../../view/widgets/text/kText.dart';

dialog({
  bool barrierDismissible = true,
  required Widget child,
  double? height,
  double? width,
    
  String? dialogName,
}) {
  var context = Get.context as BuildContext;
  var _height = height ?? Get.height / 1.5;
  var _width = width ?? Get.width;
  showDialog(
      barrierDismissible: barrierDismissible,
      context: context,
      builder: (_) {
        return Dialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
          backgroundColor: Colors.white,
          child: SizedBox(
            height: _height,
            width: _width,

            //  / 1.5,
            child: Padding(
              padding: EdgeInsets.symmetric(vertical: 20),
              child: Column(
                children: [
                  dialogName == null
                      ? Container()
                      : Stack(
                          alignment: Alignment.center,
                          children: [
                            SizedBox(
                              width: Get.width,
                              child: Center(
                                child: KText(
                                  text: '$dialogName',
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                            Positioned(
                              right: 10,
                              child: IconButton(
                                splashRadius: 20,
                                onPressed: () => Get.back(),
                                icon: Icon(
                                  Icons.close,
                                  size: 20,
                                ),
                              ),
                            ),
                          ],
                        ),
                  dialogName == null ? Container() : sizeH5,
                  dialogName == null ? Container() : Divider(),
                  dialogName == null ? Container() : sizeH20,
                  SizedBox(
                    height: height ?? Get.height / 2,
                    width: _width,
                    child: ListView(
                      shrinkWrap: true,
                      primary: false,
                      children: [
                        child,
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      });
}
