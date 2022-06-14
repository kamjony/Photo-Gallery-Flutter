import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:photogallery/pages/details/details_controller.dart';

class DetailsView extends StatelessWidget {
  final DetailsController _controller = Get.put(DetailsController());
  DetailsView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 5,
        title: Text(_controller.imageId!),
      ),
      body: Stack(
        alignment: Alignment.bottomCenter,
        children: [
          Image.network(
            _controller.imgUrl!,
            fit: BoxFit.contain,
            height: double.infinity,
            width: double.infinity,
            alignment: Alignment.center,
          ),
          Padding(
            padding: const EdgeInsets.only(bottom: 20),
            child: GestureDetector(
              onTap: () {
                Get.snackbar('Image Download', 'Image Downloading in progres..', snackPosition: SnackPosition.BOTTOM);
                _controller.downloadImage();
              },
              child: Row(
                mainAxisSize: MainAxisSize.max,
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: const [
                  Icon(Icons.download),
                  SizedBox(width: 5,),
                  Text('Download'),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
