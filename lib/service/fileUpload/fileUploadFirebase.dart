import 'dart:io';
import 'dart:typed_data';

import 'package:file_picker/file_picker.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

import '../dialog/loadingDialog.dart';

class FirebaseFileUploadController extends GetxController {
  var selectedImage = RxString('');
  var selectedFile = RxString('');
  var selectedFileName = RxString(''); 

  pickImage({
    required uploadCategory,
  }) async {
    var image = await ImagePicker().pickImage(source: ImageSource.gallery);

    if (image != null) {
      loadingDialog(loadingText: 'Uploading Image...');
      Uint8List? uploadFile = await image.readAsBytes();

      Reference reference = FirebaseStorage.instance
          .ref()
          .child('images/$uploadCategory/${image.name}');

      SettableMetadata settableMetadata = SettableMetadata(customMetadata: {});

      final UploadTask uploadTask =
          reference.putData(uploadFile, settableMetadata);

      uploadTask.whenComplete(() async {
        var downloadUrl = await uploadTask.snapshot.ref.getDownloadURL();

        selectedImage.value = downloadUrl;

        if (downloadUrl != '') {
          Get.back();
        }
      });
    }
  }

  pickFile({
    required uploadCategory,
    List<String>? extensions,
  }) async {
    FilePickerResult? result = await FilePicker.platform.pickFiles(
      type: FileType.custom,
      allowedExtensions: extensions ?? ['jpg', 'pdf', 'png'],
    );

    if (result != null) {
      File file = File(result.files.single.path.toString());
      loadingDialog(loadingText: 'Uploading File...');
      Uint8List? uploadFile = await file.readAsBytes();

      Reference reference = FirebaseStorage.instance.ref().child(
            'files/$uploadCategory/${result.files.single.name.toString()}.${result.files.single.extension}',
          );

      SettableMetadata settableMetadata = SettableMetadata(customMetadata: {});

      final UploadTask uploadTask =
          reference.putData(uploadFile, settableMetadata);

      uploadTask.whenComplete(() async {
        var downloadUrl = await uploadTask.snapshot.ref.getDownloadURL();
        selectedFileName.value = result.files.single.name.toString();
        selectedFile.value = downloadUrl;

        if (downloadUrl != '') {
          Get.back();
          // selectedFile.value = '';
        }
      });
    } else {
      // User canceled the picker
    }
  }
  // Future<void> deleteImage() async {
  //   FirebaseStorage storage = FirebaseStorage.instance;
  //   Reference storageRef = storage.refFromURL(selectedImage.value);
  //   await storageRef.delete();
  // }
}
