import 'dart:developer';
import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

Widget generalcard(
    {String? image, String? titledoc, String? discription, double? ratingnew}) {
  return Container(
    margin: const EdgeInsets.only(top: 10, bottom: 5),
    decoration: BoxDecoration(
        border: Border.all(color: Colors.yellow),
        borderRadius: BorderRadius.circular(12),
        color: Color.fromARGB(255, 248, 248, 247)),
    width: 320,
    height: 145,
    child: Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          width: 170,
          height: 140,
          padding: const EdgeInsets.all(5),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(15),
            child: Image.network(
              image ??
                  'https://images.unsplash.com/photo-1547721064-da6cfb341d50',
              fit: BoxFit.fitHeight,
            ),
          ),
        ),
        SizedBox(
          width: 170,
          child: Column(
            children: [
              Container(
                margin: const EdgeInsets.only(top: 7, bottom: 7),
                child: Text(
                  titledoc!,
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
                rating: ratingnew ?? 3.5,
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
  );
}
