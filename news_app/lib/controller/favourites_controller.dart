import 'dart:developer';

import 'package:flutter/cupertino.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';
import 'package:new_app/controller/headlines_controller.dart';

import '../database/user_database_helper.dart';
import '../model/favourites_details_model.dart';

class FavouritesController extends GetxController {
  var favouriteNewsData = <FavouriteData>[].obs;
  List<FavouriteData> news = <FavouriteData>[];
  ScrollController scrollController = ScrollController();
  RxBool notFound = false.obs;
  RxBool isLoading = false.obs;
  RxInt offSet = 0.obs;
  RxInt limit = 3.obs;

  @override
  void onInit() {
    getData();
    scrollController = ScrollController()..addListener(_scrollListener);
    super.onInit();
  }

  _scrollListener() {
    if (scrollController.position.pixels ==
        scrollController.position.maxScrollExtent) {
      isLoading.value = true;
      getData();
    }
  }
  reloadPage(){
    favouriteNewsData.clear();
    news.clear();
    getData();
  }

  Future<void> getData() async {
    notFound.value = false;
    if (isLoading.value == true) {
      news.clear();
      offSet+=3 ;
    } else {
      news = [];

      offSet.value = 0;
    }
    // var dataFetched = ;
    //  if (news.isEmpty) {
     await UserDatabaseHelper.instance.queryFavouriteNews(isLoading,limit,offSet).then((value) {
      for (var element in value) {
        news.add(FavouriteData(
            newsId: element["newsId"],
            newsTitle: element["newsTitle"],
            newsDescription: element["newsDescription"],
            newsImageUrl: element["newsImageUrl"],
            newsWebUrl: element["newsWebUrl"]));
      }

    });

    if (news.isEmpty) {
      notFound.value = isLoading.value == true ? false : true;
      isLoading.value = false;
      update();

    } else {

      if (isLoading.value == true) {

        favouriteNewsData.addAll(news);
        // news = [...news, ...res.articles];//// load more
        update();

      } else {
        if (news.isNotEmpty) {

          favouriteNewsData.addAll(news);


          if (scrollController.hasClients) scrollController.jumpTo(0.0);
          update();
        }
      }
      notFound.value = false;
      isLoading.value = false;
      update();
    }

  }

  void deleteTask(String id) async {
    await UserDatabaseHelper.instance.delete(id);
    favouriteNewsData.removeWhere((element) => element.newsTitle == id);
    update();
  }

  void showToast(message) {
    Fluttertoast.showToast(
        msg: message, // message
        toastLength: Toast.LENGTH_SHORT, // length
        gravity: ToastGravity.CENTER, // location
        timeInSecForIosWeb: 1 // duration
        );
  }
}
