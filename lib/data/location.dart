import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';

class Location {
  String? lid;
  String? image;
  String? title;
  String? description;
  double? rating;
  String? openhourse;
  String? website;
  String? email;
  double? phone;
  double? locl;
  double? loca;
  Location({
    this.lid,
    this.image,
    this.title,
    this.description,
    this.rating,
    this.openhourse,
    this.website,
    this.email,
    this.phone,
    this.locl,
    this.loca,
  });

  Location copyWith({
    String? lid,
    String? image,
    String? title,
    String? description,
    double? rating,
    String? openhourse,
    String? website,
    String? email,
    double? phone,
    double? locl,
    double? loca,
  }) {
    return Location(
      lid: lid ?? this.lid,
      image: image ?? this.image,
      title: title ?? this.title,
      description: description ?? this.description,
      rating: rating ?? this.rating,
      openhourse: openhourse ?? this.openhourse,
      website: website ?? this.website,
      email: email ?? this.email,
      phone: phone ?? this.phone,
      locl: locl ?? this.locl,
      loca: loca ?? this.loca,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'lid': lid,
      'image': image,
      'title': title,
      'description': description,
      'rating': rating,
      'openhourse': openhourse,
      'website': website,
      'email': email,
      'phone': phone,
      'locl': locl,
      'loca': loca,
    };
  }

  factory Location.fromMap(Map<String, dynamic> map) {
    return Location(
      lid: map['lid'],
      image: map['image'],
      title: map['title'],
      description: map['description'],
      rating: map['rating']?.toDouble(),
      openhourse: map['openhourse'],
      website: map['website'],
      email: map['email'],
      phone: map['phone']?.toDouble(),
      locl: map['locl']?.toDouble(),
      loca: map['loca']?.toDouble(),
    );
  }

  String toJson() => json.encode(toMap());

  factory Location.fromJson(String source) =>
      Location.fromMap(json.decode(source));

  @override
  String toString() {
    return 'Location(lid: $lid, image: $image, title: $title, description: $description, rating: $rating, openhourse: $openhourse, website: $website, email: $email, phone: $phone, locl: $locl, loca: $loca)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is Location &&
        other.lid == lid &&
        other.image == image &&
        other.title == title &&
        other.description == description &&
        other.rating == rating &&
        other.openhourse == openhourse &&
        other.website == website &&
        other.email == email &&
        other.phone == phone &&
        other.locl == locl &&
        other.loca == loca;
  }

  @override
  int get hashCode {
    return lid.hashCode ^
        image.hashCode ^
        title.hashCode ^
        description.hashCode ^
        rating.hashCode ^
        openhourse.hashCode ^
        website.hashCode ^
        email.hashCode ^
        phone.hashCode ^
        locl.hashCode ^
        loca.hashCode;
  }
}
