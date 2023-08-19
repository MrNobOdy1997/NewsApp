
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:new_app/model/favourites_details_model.dart';
import '../api_services/api_service_call.dart';
import '../database/user_database_helper.dart';
import '../model/api_response_models/ArticalModel.dart';
import '../model/api_response_models/NewsModel.dart';
import 'favourites_controller.dart';

class HeadlinesController extends GetxController {
  List<Article> news = <Article>[];
  var userFavouriteData = <FavouriteData>[].obs;
  ScrollController scrollController = ScrollController();
  RxBool notFound = false.obs;
  RxBool isLoading = false.obs;
  RxInt pageNum = 1.obs;

  dynamic isPageLoading = false.obs;
  RxInt pageSize = 10.obs;
  String baseApi = "https://newsapi.org/v2/top-headlines?";
  final ApiServices _apiServices = ApiServices();

  @override
  void onInit() {
    scrollController = ScrollController()..addListener(_scrollListener);
    getNews();
    super.onInit();
  }

  changeTheme(value) {
    Get.changeTheme(value == true ? ThemeData.dark() : ThemeData.light());
    update();
  }

  _scrollListener() {
    if (scrollController.position.pixels ==
        scrollController.position.maxScrollExtent) {
      isLoading.value = true;
      getNews();
    }
  }

  Future<void> getNews({reload = false}) async {
    notFound.value = false;
    if (isLoading.value == true) {
      pageNum++;
    } else {
      news = [];

      pageNum.value = 1;
    }

    baseApi = "https://newsapi.org/v2/top-headlines?pageSize=10&page=$pageNum&";
    baseApi += 'country=in&';
    baseApi += 'apiKey=9842fc130c7a4c389ad53b49654f95f2';
    print(baseApi);
    getDataFromApi(baseApi);
  }

  getDataFromApi(url) async {
    // update();
    NewsModel res = await _apiServices.getMethod(url);

    if (res.status == "ok") {

      if (res.articles.isEmpty && res.totalResults == 0) {
        notFound.value = isLoading.value == true ? false : true;
        isLoading.value = false;
        update();
      } else {
        if (isLoading.value == true) {
          news = [...news, ...res.articles];
          update();
        } else {
          if (res.articles.isNotEmpty) {
            news = res.articles;
            if (scrollController.hasClients) scrollController.jumpTo(0.0);
            update();
          }
        }
        notFound.value = false;
        isLoading.value = false;
        update();
      }
    } else {
      notFound.value = true;
      update();
    }
  }
  void addData(Article article) async {

    await UserDatabaseHelper.instance
        .insertToFavourite(FavouriteData(newsId:userFavouriteData.length, newsTitle: article.title, newsDescription:article.description!, newsImageUrl:article.urlToImage!, newsWebUrl:article.url));
    userFavouriteData.insert(
        0, FavouriteData( newsId:userFavouriteData.length, newsTitle: article.title, newsDescription:article.description!, newsImageUrl:article.urlToImage!, newsWebUrl:article.url));
    showToast("Data added successfully");
    //addTaskController.clear();
  }
  void showToast(message) {
    Fluttertoast.showToast(
        msg: message,  // message
        toastLength: Toast.LENGTH_SHORT, // length
        gravity: ToastGravity.CENTER,    // location
        timeInSecForIosWeb: 1               // duration
    );

  }
}
