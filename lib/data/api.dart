import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:dio_http_cache/dio_http_cache.dart';
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
      dio.interceptors.add(DioCacheManager(CacheConfig(baseUrl: 'https://api.unsplash.com')).interceptor);
      _response = await dio.get('/photos', queryParameters: params, options: buildCacheOptions(
        const Duration(days: 7), //duration of cache
        forceRefresh: false, //to force refresh
        maxStale: const Duration(days: 10), //before this time, if error like
        //500, 500 happens, it will return cache
      ));
    } on DioError catch (e) {
      developer.log(e.toString());
    }
    if (_response != null) {
      return allPhotosListFromJson(jsonEncode(_response.data));
    }
    return null;
  }
}
