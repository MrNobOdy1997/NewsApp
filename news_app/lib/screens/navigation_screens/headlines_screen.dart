import 'dart:developer';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../controller/headlines_controller.dart';
import '../ViewNews.dart';
class Headlines extends GetView<HeadlinesController> {
  HeadlinesController newsController = Get.put(HeadlinesController());

  Headlines({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("HeadLines"),
      ),
      backgroundColor: context.theme.backgroundColor,
      body: GetBuilder<HeadlinesController>(
        builder: (controller) {
          return
            controller.notFound.value
              ? const Center(child: Text("Not Found", style: TextStyle(fontSize: 30)))
              : controller.news.isEmpty
              ? const Center(child: CircularProgressIndicator())
              : ListView.builder(
            controller: controller.scrollController,
            itemBuilder: (context, index) {
              return Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(5),
                    child: Card(
                      elevation: 5,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8)),
                      child: GestureDetector(
                        onTap: () => Get.to(ViewNews(
                            newsUrl: controller.news[index].url)),
                        child: Container(
                          padding: const EdgeInsets.symmetric(
                              vertical: 10, horizontal: 15),
                          decoration: BoxDecoration(
                              borderRadius:
                              BorderRadius.circular(8)),
                          child: Column(
                            children: [
                              Stack(children: [
                                controller.news[index].urlToImage ==
                                    null
                                    ? Container()
                                    : ClipRRect(
                                  borderRadius:
                                  BorderRadius.circular(8),
                                  child: CachedNetworkImage(
                                    placeholder: (context,
                                        url) =>
                                        const CircularProgressIndicator(),
                                    errorWidget:
                                        (context, url, error) =>
                                    const Icon(Icons.error),
                                    imageUrl: controller
                                        .news[index]
                                        .urlToImage ??
                                        '',
                                  ),
                                ),
                              ]),
                              const Divider(),
                              Text(controller.news[index].title,
                                  style: const TextStyle(
                                    fontFamily: 'Lexend Deca',
                                    color: Color(0xFF090F13),
                                    fontSize: 15,
                                    fontWeight: FontWeight.bold,
                                  )),
                              const Divider(),
                              Text("${controller.news[index].description}",
                                  style: const TextStyle(
                                    fontFamily: 'Lexend Deca',
                                    color: Color(0xFF57636C),
                                    fontSize: 14,
                                    fontWeight: FontWeight.w500,
                                  )),
                              Row(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  Padding(
                                    padding: const EdgeInsetsDirectional.fromSTEB(
                                        240, 0, 0, 0),
                                    child: IconButton(
                                      icon: const Icon(
                                        Icons.thumb_up_alt_outlined,
                                        color: Colors.black,
                                        size: 25,
                                      ),
                                      onPressed: () {
                                        log("clicked like button");
                                        newsController.addData(controller.news[index]);
                                      },
                                    ),
                                  ),
                                ],
                              )
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                  index == controller.news.length - 1 &&
                      controller.isLoading == true
                      ? const Center(child: CircularProgressIndicator())
                      : const SizedBox(),
                ],
              );
            },
            itemCount: controller.news.length,
          );
        },

      ),
    );
  }
}
