import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'dart:developer';

import 'package:cached_network_image/cached_network_image.dart';

import 'package:new_app/controller/favourites_controller.dart';
import 'package:new_app/controller/headlines_controller.dart';

import '../ViewNews.dart';

class Favourites extends StatelessWidget {
  FavouritesController favouritesController = Get.put(FavouritesController());


  Favourites({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Favourites"),
        actions: [
          Padding(
              padding: const EdgeInsets.only(right: 20.0),
              child: GestureDetector(
                onTap: () {
                  favouritesController.reloadPage();
                },
                child: const Icon(Icons.refresh),
              )),
        ],
      ),
      backgroundColor: context.theme.backgroundColor,

        body:RefreshIndicator(
          child:   GetBuilder<FavouritesController>(
            builder:
                (controller) {
              return   controller.notFound.value
                  ? const Center(child: Text("Not Found", style: TextStyle(fontSize: 30)))
                  :
                controller.favouriteNewsData.isEmpty
                ? const Center(child: CircularProgressIndicator())
                : ListView.builder(
              controller: favouritesController.scrollController,
              itemCount: favouritesController.favouriteNewsData.length,
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
                              newsUrl: favouritesController
                                  .favouriteNewsData[index]
                                  .newsWebUrl)),
                          child: Container(
                            padding: const EdgeInsets.symmetric(
                                vertical: 10, horizontal: 15),
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(8)),
                            child: Column(
                              children: [
                                Stack(children: [
                                  favouritesController.favouriteNewsData[index]
                                      .newsImageUrl == null
                                      ? Container()
                                      : ClipRRect(
                                    borderRadius:
                                    BorderRadius.circular(8),
                                    child: CachedNetworkImage(
                                      placeholder: (context,
                                          url) =>
                                      const CircularProgressIndicator(),
                                      errorWidget: (context, url,
                                          error) =>
                                      const Icon(Icons.error),
                                      imageUrl: favouritesController
                                          .favouriteNewsData[
                                      index]
                                          .newsImageUrl
                                      ,
                                    ),
                                  ),
                                ]),
                                const Divider(),
                                Text(
                                    favouritesController.favouriteNewsData[index]
                                        .newsTitle,
                                    style: const TextStyle(
                                      fontFamily: 'Lexend Deca',
                                      color: Color(0xFF090F13),
                                      fontSize: 15,
                                      fontWeight: FontWeight.bold,
                                    )),
                                const Divider(),
                                Text(
                                    favouritesController.favouriteNewsData[index]
                                        .newsDescription,
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
                                      padding:
                                      const EdgeInsetsDirectional
                                          .fromSTEB(240, 0, 0, 0),
                                      child: IconButton(
                                        icon: const Icon(
                                          Icons.thumb_up_alt_outlined,
                                          color: Colors.black,
                                          size: 25,
                                        ),
                                        onPressed: () {
                                          log("clicked like button");
                                          favouritesController
                                              .deleteTask(favouritesController
                                              .favouriteNewsData[
                                          index]
                                              .newsTitle);
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
                    index == favouritesController.favouriteNewsData.length - 1 &&
                        favouritesController.isLoading == true
                        ? const Center(
                        child: CircularProgressIndicator())
                        : const SizedBox(),
                  ],
                );
              },
              physics: const AlwaysScrollableScrollPhysics(),
            );
            },
          ),
          onRefresh: () {
            return Future.delayed(
              const Duration(seconds: 1),
                  () {
                    favouritesController.reloadPage();
              },
            );
          },
        ),





        // Expanded(
        //   child:
        // )
      // body: GetBuilder<FavouritesController>(
      //   builder: (controller) {
      //     return controller.notFound.value
      //         ? const Center(
      //             child: Text("Not Found", style: TextStyle(fontSize: 30)))
      //         : controller.favouriteNewsData.isEmpty
      //             ? const Center(child: CircularProgressIndicator())
      //             : ListView.builder(
      //                 controller: controller.scrollController,
      //                 itemCount: favouritesController.favouriteNewsData.length,
      //                 itemBuilder: (context, index) {
      //                   return Column(
      //                     children: [
      //                       Padding(
      //                         padding: const EdgeInsets.all(5),
      //                         child: Card(
      //                           elevation: 5,
      //                           shape: RoundedRectangleBorder(
      //                               borderRadius: BorderRadius.circular(8)),
      //                           child: GestureDetector(
      //                             onTap: () => Get.to(ViewNews(
      //                                 newsUrl: controller
      //                                     .favouriteNewsData[index]
      //                                     .newsWebUrl)),
      //                             child: Container(
      //                               padding: const EdgeInsets.symmetric(
      //                                   vertical: 10, horizontal: 15),
      //                               decoration: BoxDecoration(
      //                                   borderRadius: BorderRadius.circular(8)),
      //                               child: Column(
      //                                 children: [
      //                                   Stack(children: [
      //                                     controller.favouriteNewsData[index]
      //                                                 .newsImageUrl == null
      //                                         ? Container()
      //                                         : ClipRRect(
      //                                             borderRadius:
      //                                                 BorderRadius.circular(8),
      //                                             child: CachedNetworkImage(
      //                                               placeholder: (context,
      //                                                       url) =>
      //                                                   const CircularProgressIndicator(),
      //                                               errorWidget: (context, url,
      //                                                       error) =>
      //                                                   const Icon(Icons.error),
      //                                               imageUrl: controller
      //                                                       .favouriteNewsData[
      //                                                           index]
      //                                                       .newsImageUrl
      //                                                   ,
      //                                             ),
      //                                           ),
      //                                   ]),
      //                                   const Divider(),
      //                                   Text(
      //                                       controller.favouriteNewsData[index]
      //                                           .newsTitle,
      //                                       style: const TextStyle(
      //                                         fontFamily: 'Lexend Deca',
      //                                         color: Color(0xFF090F13),
      //                                         fontSize: 15,
      //                                         fontWeight: FontWeight.bold,
      //                                       )),
      //                                   const Divider(),
      //                                   Text(
      //                                       controller.favouriteNewsData[index]
      //                                           .newsDescription,
      //                                       style: const TextStyle(
      //                                         fontFamily: 'Lexend Deca',
      //                                         color: Color(0xFF57636C),
      //                                         fontSize: 14,
      //                                         fontWeight: FontWeight.w500,
      //                                       )),
      //                                   Row(
      //                                     mainAxisSize: MainAxisSize.min,
      //                                     children: [
      //                                       Padding(
      //                                         padding:
      //                                             const EdgeInsetsDirectional
      //                                                 .fromSTEB(240, 0, 0, 0),
      //                                         child: IconButton(
      //                                           icon: const Icon(
      //                                             Icons.thumb_up_alt_outlined,
      //                                             color: Colors.black,
      //                                             size: 25,
      //                                           ),
      //                                           onPressed: () {
      //                                             log("clicked like button");
      //                                             favouritesController
      //                                                 .deleteTask(controller
      //                                                     .favouriteNewsData[
      //                                                         index]
      //                                                     .newsTitle);
      //                                           },
      //                                         ),
      //                                       ),
      //                                     ],
      //                                   )
      //                                 ],
      //                               ),
      //                             ),
      //                           ),
      //                         ),
      //                       ),
      //                       index == controller.favouriteNewsData.length - 1 &&
      //                               controller.isLoading == true
      //                           ? const Center(
      //                               child: CircularProgressIndicator())
      //                           : const SizedBox(),
      //                     ],
      //                   );
      //                 },
      //               );
      //   },
      //   init: FavouritesController(),
      // ),
    );
  }
}
