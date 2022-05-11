// Dart imports:
import 'dart:convert';

// Package imports:
import 'package:cloud_firestore/cloud_firestore.dart';

class ClubModel {
  final String city;
  final GeoPoint location;
  final String name;
  final String clubDocID;
  final String street;
  final String zipCode;
  ClubModel({
    required this.city,
    required this.location,
    required this.name,
    required this.clubDocID,
    required this.street,
    required this.zipCode,
  });

  ClubModel copyWith({
    String? city,
    GeoPoint? location,
    String? name,
    String? clubDocID,
    String? street,
    String? zipCode,
  }) {
    return ClubModel(
      city: city ?? this.city,
      location: location ?? this.location,
      name: name ?? this.name,
      clubDocID: clubDocID ?? this.clubDocID,
      street: street ?? this.street,
      zipCode: zipCode ?? this.zipCode,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'city': city,
      'location': location,
      'name': name,
      'clubDocID': clubDocID,
      'street': street,
      'zipCode': zipCode,
    };
  }

  factory ClubModel.fromMap(Map<String, dynamic> map) {
    return ClubModel(
      city: map['city'] ?? '',
      location: map['location'],
      name: map['name'] ?? '',
      clubDocID: map['clubDocID'] ?? '',
      street: map['street'] ?? '',
      zipCode: map['zipCode'] ?? '',
    );
  }
  ClubModel.fromSnapshot(snapshot)
      : city = snapshot.data()['city'],
        name = snapshot.data()['name'],
        clubDocID = snapshot.data()['clubDocID'],
        location = snapshot.data()['location'],
        zipCode = snapshot.data()['zipCode'],
        street = snapshot.data()['street'];
  String toJson() => json.encode(toMap());

  factory ClubModel.fromJson(String source) =>
      ClubModel.fromMap(json.decode(source));

  @override
  String toString() {
    return 'ClubModel(city: $city, location: $location, name: $name, clubDocID: $clubDocID, street: $street, zipCode: $zipCode)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is ClubModel &&
        other.city == city &&
        other.location == location &&
        other.name == name &&
        other.clubDocID == clubDocID &&
        other.street == street &&
        other.zipCode == zipCode;
  }

  @override
  int get hashCode {
    return city.hashCode ^
        location.hashCode ^
        name.hashCode ^
        clubDocID.hashCode ^
        street.hashCode ^
        zipCode.hashCode;
  }
}
