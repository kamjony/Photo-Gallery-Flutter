import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:image_downloader/image_downloader.dart';
import 'dart:developer' as developer;

class DetailsController extends GetxController{

  String? imageId;
  String? imgUrl;
  String? imgDl;

  @override
  void onInit() {
    imageId = Get.arguments[0];
    imgUrl = Get.arguments[1];
    imgDl = Get.arguments[2];
    super.onInit();
  }

  void downloadImage() async {
    try {
      // Saved with this method.
      var imageId = await ImageDownloader.downloadImage(imgDl!);
      if (imageId == null) {
        return;
      }

      // Below is a method of obtaining saved image information.
      var fileName = await ImageDownloader.findName(imageId);
      var path = await ImageDownloader.findPath(imageId);
      var size = await ImageDownloader.findByteSize(imageId);
      var mimeType = await ImageDownloader.findMimeType(imageId);

      developer.log('file: $fileName, $path, $size, $mimeType');

      Get.snackbar('Success', 'Image Download Complete. Please check gallery app.', snackPosition: SnackPosition.BOTTOM);

    } on PlatformException catch (e) {
      developer.log(e.toString());
    }
  }

}