import 'dart:io';

import 'dart:ui' as ui;

import 'package:db_miner/screen/detail/controller/detail_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:image_gallery_saver/image_gallery_saver.dart';
import 'package:path_provider/path_provider.dart';
import 'package:share_plus/share_plus.dart';

class DetailScreen extends StatefulWidget {
  const DetailScreen({super.key});

  @override
  State<DetailScreen> createState() => _DetailScreenState();
}

class _DetailScreenState extends State<DetailScreen> {
  DetailController controller = Get.put(DetailController());
  List quotesList = Get.arguments;
  GlobalKey repaintKey = GlobalKey();

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
              controller.insertQuotes(quotesList[0],quotesList[1]);
            },
            icon: const Icon(
              Icons.favorite_border_outlined,
              color: Colors.white,
            ),
          ),
        ],
      ),
      body: Column(
        children: [
          RepaintBoundary(
            key: repaintKey,
            child: Container(
              height: 500,
              alignment: Alignment.center,
              margin: const EdgeInsets.all(12),
              width: MediaQuery.sizeOf(context).width,
              padding: const EdgeInsets.all(10),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12),
                image: DecorationImage(
                    image: NetworkImage("${quotesList[2]}"), fit: BoxFit.cover),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const SizedBox(height: 100,),
                  SelectableText(
                    "${quotesList[0]}",
                    style: const TextStyle(color: Colors.white, fontSize: 22,fontWeight: FontWeight.bold),
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(height: 100,),
                  Align(
                    alignment: Alignment.bottomRight,
                    child: SelectableText(
                      "~ ${quotesList[1]}",
                      style: const TextStyle(color: Colors.white, fontSize: 22,fontWeight: FontWeight.bold),
                      textAlign: TextAlign.center,
                    ),
                  ),
                ],
              ),
            ),
          ),
          Expanded(
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: controller.bgImageList.length,
              itemBuilder: (context, index) {
                return SizedBox(
                  height: 50,
                  child: Container(
                    width: MediaQuery.sizeOf(context).width * 0.3,
                    margin: const EdgeInsets.all(12),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Image.network(
                      controller.bgImageList[index],
                      fit: BoxFit.cover,
                    ),
                  ),
                );
              },
            ),
          ),
          Expanded(
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: controller.bgImageList.length,
              itemBuilder: (context, index) {
                return Container(
                  width: MediaQuery.sizeOf(context).width * 0.3,
                  margin: const EdgeInsets.all(12),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Image.network(
                    controller.bgImageList[index],
                    fit: BoxFit.cover,
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
