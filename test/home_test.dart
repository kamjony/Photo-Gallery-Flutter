import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:get/get.dart';
import 'package:mocktail/mocktail.dart';
import 'package:photogallery/models/all_photos_list.dart';
import 'package:photogallery/pages/home/home_controller.dart';

class MockHomeController extends GetxController with Mock implements HomeController{}

void main() {
  late HomeController sut;
  late MockHomeController mockHomeController;

  setUp((){
    TestWidgetsFlutterBinding.ensureInitialized();
    mockHomeController = MockHomeController();
    sut = HomeController();
  });

  test(
    "inital values are correct",
      () {
        expect(sut.photosList, []);
        expect(sut.isLoading.value, false);
      }
  );

  group('getPhotos', () {
    final RxList<AllPhotosListModel> photosFromService = RxList([
      AllPhotosListModel(
          id: '1',
          createdAt: null,
          updatedAt: null,
          promotedAt: null,
          width: 50,
          height: 50,
          color: 'Yellow',
          blurHash: 'Yes',
          description: ' des ',
          altDescription: 'alt',
          urls: null,
          links: null,
          categories: null,
          likes: 200,
          likedByUser: true,
          currentUserCollections: null,
          sponsorship: null,
          topicSubmissions: null,
          user: null
      ),
      AllPhotosListModel(
          id: '3',
          createdAt: null,
          updatedAt: null,
          promotedAt: null,
          width: 50,
          height: 50,
          color: 'Yellow',
          blurHash: 'Yes',
          description: ' des ',
          altDescription: 'alt',
          urls: null,
          links: null,
          categories: null,
          likes: 200,
          likedByUser: true,
          currentUserCollections: null,
          sponsorship: null,
          topicSubmissions: null,
          user: null
      ),
      AllPhotosListModel(
          id: '3',
          createdAt: null,
          updatedAt: null,
          promotedAt: null,
          width: 50,
          height: 50,
          color: 'Yellow',
          blurHash: 'Yes',
          description: ' des ',
          altDescription: 'alt',
          urls: null,
          links: null,
          categories: null,
          likes: 200,
          likedByUser: true,
          currentUserCollections: null,
          sponsorship: null,
          topicSubmissions: null,
          user: null
      )
    ]);
    void arrangePhotoReturns3Photos() {
      when(() => mockHomeController.getAllPhotos()).thenAnswer((_) async => photosFromService);
    }

    void arrangeP () {
      when(() => mockHomeController.photosList).thenAnswer((_) => photosFromService);
    }


    test('gets photos using api', () async {
      // when(() => mockHomeController.getAllPhotos()).thenAnswer((_) async => null);
      Get.put<HomeController>(mockHomeController, tag: "");
      arrangePhotoReturns3Photos();
      await mockHomeController.getAllPhotos();
      verify(()=> mockHomeController.getAllPhotos()).called(1);
      // await Future.delayed(Duration(seconds: 1)).then((_) => verify(()=> mockHomeController.getAllPhotos()).called(5));

    });

    test("""indicates loading of data,
    sets articles to the ones from the service,
    indicates that data is not being loaded anymore""", () async {
      Get.put<HomeController>(mockHomeController, tag: "");
      arrangeP();
      // expect(mockHomeController.isLoading.value, false);
      await mockHomeController.getAllPhotos();
      // expect(mockHomeController.photosList, photosFromService);
      expect(mockHomeController.isLoading.value, false);

    });
  });
}