import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:photogallery/models/all_photos_list.dart';
import 'dart:developer' as developer;

Api api = Api();

class Api {
  Dio getDio() {
    return Dio(BaseOptions(
      baseUrl: 'https://api.unsplash.com',
      connectTimeout: 30 * 1000,
      receiveTimeout: 30 * 1000,
      headers: {'Content-Type': 'application/json'},
    ));
  }

  Future<List<AllPhotosListModel>?> getAllPhotos(Map<String, String> params) async {
    Response? _response;
    try {
      Dio dio = getDio();
      _response = await dio.get('/photos', queryParameters: params);
    } on DioError catch (e) {
      developer.log(e.toString());
    }
    if (_response != null) {
      return allPhotosListFromJson(jsonEncode(_response.data));
    }
    return null;
  }
}
