import 'package:get/get.dart';
import 'dart:developer';

import '../model/api_response_models/NewsModel.dart';

class ApiServices extends GetConnect {

  Future<NewsModel> getMethod(String url) async {
    log( "URL  $url");
    //https://newsapi.org/v2/top-headlines?country=in&page=2&pageSize=5&apiKey=9842fc130c7a4c389ad53b49654f95f2
    Response response = await get(url);
    if (response.statusCode == 200) {
      final result = response.body;

      var datafetched = NewsModel.fromJson(result);

      return datafetched;
    } else {
      throw Exception("Failed to get top news");
    }
  }
}

