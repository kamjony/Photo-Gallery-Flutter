import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:get/get.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'package:photogallery/pages/home/home_controller.dart';

class HomeView extends StatelessWidget {
  final HomeController _controller = Get.put(HomeController());

  HomeView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          elevation: 5,
          title: const Text('Photo Gallery'),
        ),
        body: Obx(() => !_controller.isLoading.value
          ? Stack(
            children: [
              MasonryGridView.count(
                  controller: _controller.scrollController,
                  crossAxisCount: 2,
                  mainAxisSpacing: 4,
                  crossAxisSpacing: 4,
                  itemCount: _controller.photosList.length,
                  itemBuilder: (context, index) {
                    return GestureDetector(
                        onTap: () {
                          Get.toNamed('/details', arguments: [
                            _controller.photosList[index].id,
                            _controller.photosList[index].urls!.full,
                            _controller.photosList[index].links!.download
                          ]);
                        },
                        child: CachedNetworkImage(
                          imageUrl: '${_controller.photosList[index].urls!.thumb}',
                          // placeholder: (context, url) =>
                          //     const Center(child: CircularProgressIndicator()),
                          errorWidget: (context, url, error) => const Icon(Icons.error),
                        ));
                  },
                ),
              if (_controller.bannerAd.value != null)
                Align(
                  alignment: Alignment.topCenter,
                  child: Container(
                    width: _controller.bannerAd.value!.size.width.toDouble(),
                    height: _controller.bannerAd.value!.size.height.toDouble(),
                    child: AdWidget(ad: _controller.bannerAd.value!),
                  ),
                ),
            ],
          )
          : const Center(child: CircularProgressIndicator()),
        ));
  }
}
