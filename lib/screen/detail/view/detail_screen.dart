import 'dart:io';
import 'dart:ui' as ui;
import 'package:db_miner/screen/detail/controller/detail_controller.dart';
import 'package:db_miner/screen/quotes/controller/quotes_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/services.dart';

import 'package:get/get.dart';
import 'package:image_gallery_saver/image_gallery_saver.dart';
import 'package:path_provider/path_provider.dart';
import 'package:share_plus/share_plus.dart';
import '../../home/controller/home_controller.dart';

class DetailScreen extends StatefulWidget {
  const DetailScreen({super.key});

  @override
  State<DetailScreen> createState() => _DetailScreenState();
}

class _DetailScreenState extends State<DetailScreen> {
  HomeController homeController = Get.put(HomeController());
  DetailController controller = Get.put(DetailController());
  QuotesController quotesController = Get.put(QuotesController());
  List quotesList = Get.arguments;
  GlobalKey repaintKey = GlobalKey();

  @override
  void initState() {
    super.initState();
    homeController.getJsonData();
    quotesController.readCategory();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Quotes App",
          style: TextStyle(color: Colors.white),
        ),
        centerTitle: true,
        iconTheme: const IconThemeData(color: Colors.white),
        backgroundColor: const Color(0xff094859),
        actions: [
          IconButton(
            onPressed: () async {
              RenderRepaintBoundary boundary = repaintKey.currentContext!
                  .findRenderObject() as RenderRepaintBoundary;
              ui.Image image = await boundary.toImage();
              ByteData? byteData =
                  await image.toByteData(format: ui.ImageByteFormat.png);
              Uint8List data = byteData!.buffer.asUint8List();

              var directory = await getTemporaryDirectory();
              File f1 =
                  await File("${directory.path}/image.jpg").writeAsBytes(data);
              await ImageGallerySaver.saveFile(f1.path);
              await Share.shareXFiles([XFile(f1.path)]);
            },
            icon: const Icon(Icons.share),
          ),
          IconButton(
            onPressed: () async {
              await Clipboard.setData(
                ClipboardData(text: quotesList[0]),
              );
            },
            icon: const Icon(Icons.copy),
          ),
          IconButton(
            onPressed: () {
              showModalBottomSheet(
                context: context,
                builder: (context) {
                  return quotesController.categoryList.isEmpty
                      ? Container(
                          height: 300,
                          width: MediaQuery.sizeOf(context).width,
                          alignment: Alignment.center,
                          child: const Text(
                            "No Category Here Please select category",
                            style: TextStyle(
                              fontSize: 20,
                            ),
                          ),
                        )
                      : Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: ListView.builder(
                            itemCount: quotesController.categoryList.length,
                            itemBuilder: (context, index) {
                              return ListTile(
                                onTap: () {
                                  controller.insertQuotes(quotesList[0],
                                      quotesList[1], quotesList[2]);
                                },
                                title: Text(
                                    "${quotesController.categoryList[index]['category']}"),
                              );
                            },
                          ),
                      );
                },
              );
            },
            icon: const Icon(
              Icons.favorite_border_outlined,
              color: Colors.white,
            ),
          ),
        ],
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          RepaintBoundary(
            key: repaintKey,
            child: Obx(
              () => Container(
                height: 500,
                alignment: Alignment.center,
                margin: const EdgeInsets.all(12),
                width: MediaQuery.sizeOf(context).width,
                padding: const EdgeInsets.all(10),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12),
                  image: DecorationImage(
                      image: NetworkImage("${controller.image}"),
                      fit: BoxFit.cover),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const SizedBox(
                      height: 100,
                    ),
                    SelectableText(
                      "${quotesList[0]}",
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 22,
                          fontFamily: controller.fontStyle.value,
                          fontWeight: FontWeight.bold),
                      textAlign: TextAlign.center,
                    ),
                    const SizedBox(
                      height: 100,
                    ),
                    Align(
                      alignment: Alignment.bottomRight,
                      child: SelectableText(
                        "~ ${quotesList[1]}",
                        style: const TextStyle(
                            color: Colors.white,
                            fontSize: 22,
                            fontWeight: FontWeight.bold),
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          const SizedBox(
            height: 50,
          ),
          const Padding(
            padding: EdgeInsets.only(left: 12.0),
            child: Text(
              "Change Font",
              style: TextStyle(fontSize: 18),
            ),
          ),
          SizedBox(
            height: 50,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: controller.fontStyleList.length,
              itemBuilder: (context, index) {
                return InkWell(
                  onTap: () {
                    controller.fontStyle.value =
                        controller.fontStyleList[index];
                  },
                  child: Container(
                    width: MediaQuery.sizeOf(context).width * 0.3,
                    margin: const EdgeInsets.all(12),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Text(
                      "Hello",
                      style: TextStyle(
                        fontFamily: controller.fontStyleList[index],
                        fontSize: 15,
                      ),
                    ),
                  ),
                );
              },
            ),
          ),
          const Padding(
            padding: EdgeInsets.only(left: 12.0),
            child: Text(
              "Change Background Image",
              style: TextStyle(fontSize: 18),
            ),
          ),
          Expanded(
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: controller.bgImageList.length,
              itemBuilder: (context, index) {
                return InkWell(
                  onTap: () {
                    controller.image.value = controller.bgImageList[index];
                  },
                  child: Container(
                    width: MediaQuery.sizeOf(context).width * 0.3,
                    margin: const EdgeInsets.all(12),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Image.network(
                      controller.bgImageList[index],
                      fit: BoxFit.fill,
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
