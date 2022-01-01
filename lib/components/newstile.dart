import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:news/utils/text.dart';

import 'bottomsheet.dart';
import 'widget.dart';

class NewsBox extends StatelessWidget {
  final String imageurl, title, time, description, url;

  const NewsBox({Key? key,
    required this.imageurl,
    required this.title,
    required this.time,
    required this.description,
    required this.url})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    var w = MediaQuery
        .of(context)
        .size
        .width;
    return Column(
      children: [
        InkWell(
          onTap: () {
            showMyBottomSheet(context, title, description, imageurl, url);
          },
          child: Container(
            padding: const EdgeInsets.all(20),
            margin: const EdgeInsets.only(left: 5, right: 5, top: 5),
            width: w,
            decoration: BoxDecoration(borderRadius: BorderRadius.circular(20),
                color: Colors.indigo),
            //  color: Colors.indigoAccent,
            child:
            Row(
              children: [
                const SizedBox(width: 8),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      ModifiedText(
                          color: Colors.white, size: 16, text: title),
                      const SizedBox(height: 5),
                      ModifiedText(
                          color: Colors.white, size: 12, text: time),
                    ],
                  ),
                ),
                CachedNetworkImage(
                  imageUrl: imageurl,
                  imageBuilder: (context, imageProvider) =>
                      Container(
                        width: 60,
                        height: 60,
                        decoration: BoxDecoration(
                          image: DecorationImage(
                              image: imageProvider, fit: BoxFit.cover),
                          borderRadius: BorderRadius.circular(5),
                        ),
                      ),
                  placeholder: (context, url) =>
                  const CircularProgressIndicator(color: Colors.indigo),
                  errorWidget: (context, url, error) => const Icon(Icons.error),
                ),
              ],
            ),
          ),
        ),
        const DividerWidget()
      ],
    );
  }
}
