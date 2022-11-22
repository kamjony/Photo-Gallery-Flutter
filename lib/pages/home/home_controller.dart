import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:photogallery/data/api.dart';
import 'dart:developer' as developer;
import 'package:photogallery/models/all_photos_list.dart';

class HomeController extends GetxController {
  RxList<AllPhotosListModel> photosList = RxList();
  var isLoading = false.obs;
  int currentPage = 1;
  ScrollController scrollController = ScrollController();

  @override
  void onInit() {
    getAllPhotos();
    scrollController.addListener(() {
      if (scrollController.position.pixels ==
          scrollController.position.maxScrollExtent) {
        loadMorePhotos();
      }
    });
    super.onInit();
  }

  Future<void> getAllPhotos() async {
    isLoading.value = true;
    Map<String, String> params = {};
    params['client_id'] = 'CWkDY_ymxHWJYtU121tcXh6SgKS1PSIum3g4obzZKlU';
    params['page'] = currentPage.toString();
    var result = await api.getAllPhotos(params);

    developer.log('cached: $result');

    if (result != null) {
      photosList.value = result;
      isLoading.value = false;
    }
  }

  void loadMorePhotos() async {
    currentPage++;
    developer.log('$currentPage');
    Map<String, String> params = {};
    params['client_id'] = 'CWkDY_ymxHWJYtU121tcXh6SgKS1PSIum3g4obzZKlU';
    params['page'] = currentPage.toString();

    var result = await api.getAllPhotos(params);

    if (result != null) {
      for (var elements in result) {
        photosList.add(elements);
      }
      developer.log('${photosList.length}');
    }
  }
}
