import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

Widget generalcard({String? image, String? titledoc, String? discription}) {
  return InkWell(
    child: Container(
      margin: const EdgeInsets.only(top: 10, bottom: 10),
      decoration: BoxDecoration(
          border: Border.all(color: Colors.yellow),
          borderRadius: BorderRadius.circular(12),
          color: Color.fromARGB(255, 248, 248, 247)),
      width: 350,
      height: 145,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          // Container(
          //   width: 170,
          //   height: 140,
          //   padding: const EdgeInsets.all(5),
          //   child: ClipRRect(
          //     borderRadius: BorderRadius.circular(15),
          //     child: Image.asset(
          //       image,
          //       fit: BoxFit.fitHeight,
          //     ),
          //   ),
          // ),
          SizedBox(
            width: 170,
            child: Column(
              children: [
                Container(
                  margin: const EdgeInsets.only(top: 7, bottom: 7),
                  child: Text(
                    titledoc ?? 'title',
                    textAlign: TextAlign.center,
                    style: const TextStyle(
                      color: Colors.amber,
                      decorationStyle: TextDecorationStyle.wavy,
                      fontSize: 19,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                Container(
                  height: 67,
                  margin: const EdgeInsets.only(bottom: 7),
                  child: Text(
                    discription ?? 'description',
                    overflow: TextOverflow.clip,
                  ),
                ),
                RatingBarIndicator(
                  rating: 2.75,
                  itemBuilder: (context, index) => const Icon(
                    Icons.star,
                    color: Colors.amber,
                  ),
                  itemCount: 5,
                  itemSize: 26,
                  direction: Axis.horizontal,
                ),
              ],
            ),
          )
        ],
      ),
    ),
  );
}
