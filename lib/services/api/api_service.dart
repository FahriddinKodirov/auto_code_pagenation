import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:pagenation_app/data/model/techrunch_model.dart';


class MyRepository {
  static Future<List<TechrunchModel>> getOrdersList({required int size, required int page}) async {
    Dio dio = Dio();


    final Response response = await dio
        .get('https://techcrunch.com/wp-json/wp/v2/posts', queryParameters: {
      "context" : 'embed',
      "per_page": page,
      "page": size,

    });

    debugPrint('page=$page&size=$size');
    debugPrint('${response.statusCode}');

    if (response.statusCode! >= 200 && response.statusCode! < 300) {
      List<TechrunchModel> orders = (response.data as List)
          .map((data) => TechrunchModel.fromJson(data))
          .toList();
      return orders;
    } else {
      throw Exception();
    }
  }
}