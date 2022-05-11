// Dart imports:
import 'dart:convert';

class UserModel {
  final String fullName;
  final String userName;
  final String email;
  final String password;
  final String? bodyDisabilitiesText;
  final bool bodyDisabilities;
  final bool identifyQueer;
  final bool bornInGermany;
  final bool migrationHistorySinceTwoYears;
  final bool motherLangGerman;
  final String? motherLangText;
  final bool otherLangs;
  final bool identifyBlack;
  final String? imageUrl;
  final String gender;
  final String userID;
  UserModel({
    required this.fullName,
    required this.userName,
    required this.email,
    required this.password,
    this.bodyDisabilitiesText,
    required this.bodyDisabilities,
    required this.identifyQueer,
    required this.bornInGermany,
    required this.migrationHistorySinceTwoYears,
    required this.motherLangGerman,
    this.motherLangText,
    required this.otherLangs,
    required this.identifyBlack,
    this.imageUrl,
    required this.gender,
    required this.userID,
  });

  UserModel copyWith({
    String? fullName,
    String? userName,
    String? email,
    String? password,
    String? bodyDisabilitiesText,
    bool? bodyDisabilities,
    bool? identifyQueer,
    bool? bornInGermany,
    bool? migrationHistorySinceTwoYears,
    bool? motherLangGerman,
    String? motherLangText,
    bool? otherLangs,
    bool? identifyBlack,
    String? imageUrl,
    String? gender,
    String? userID,
  }) {
    return UserModel(
      fullName: fullName ?? this.fullName,
      userName: userName ?? this.userName,
      email: email ?? this.email,
      password: password ?? this.password,
      bodyDisabilitiesText: bodyDisabilitiesText ?? this.bodyDisabilitiesText,
      bodyDisabilities: bodyDisabilities ?? this.bodyDisabilities,
      identifyQueer: identifyQueer ?? this.identifyQueer,
      bornInGermany: bornInGermany ?? this.bornInGermany,
      migrationHistorySinceTwoYears:
          migrationHistorySinceTwoYears ?? this.migrationHistorySinceTwoYears,
      motherLangGerman: motherLangGerman ?? this.motherLangGerman,
      motherLangText: motherLangText ?? this.motherLangText,
      otherLangs: otherLangs ?? this.otherLangs,
      identifyBlack: identifyBlack ?? this.identifyBlack,
      imageUrl: imageUrl ?? this.imageUrl,
      gender: gender ?? this.gender,
      userID: userID ?? this.userID,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'fullName': fullName,
      'userName': userName,
      'email': email,
      'password': password,
      'bodyDisabilitiesText': bodyDisabilitiesText,
      'bodyDisabilities': bodyDisabilities,
      'identifyQueer': identifyQueer,
      'bornInGermany': bornInGermany,
      'migrationHistorySinceTwoYears': migrationHistorySinceTwoYears,
      'motherLangGerman': motherLangGerman,
      'motherLangText': motherLangText,
      'otherLangs': otherLangs,
      'identifyBlack': identifyBlack,
      'imageUrl': imageUrl,
      'gender': gender,
      'userID': userID,
    };
  }

  factory UserModel.fromMap(Map<String, dynamic> map) {
    return UserModel(
      fullName: map['fullName'] ?? '',
      userName: map['userName'] ?? '',
      email: map['email'] ?? '',
      password: map['password'] ?? '',
      bodyDisabilitiesText: map['bodyDisabilitiesText'],
      bodyDisabilities: map['bodyDisabilities'] ?? false,
      identifyQueer: map['identifyQueer'] ?? false,
      bornInGermany: map['bornInGermany'] ?? false,
      migrationHistorySinceTwoYears:
          map['migrationHistorySinceTwoYears'] ?? false,
      motherLangGerman: map['motherLangGerman'] ?? false,
      motherLangText: map['motherLangText'],
      otherLangs: map['otherLangs'] ?? false,
      identifyBlack: map['identifyBlack'] ?? false,
      imageUrl: map['imageUrl'],
      gender: map['gender'] ?? '',
      userID: map['userID'] ?? '',
    );
  }
  UserModel.fromSnapshot(snapshot)
      : userName = snapshot.data()['userName'],
        fullName = snapshot.data()['fullName'],
        gender = snapshot.data()['gender'],
        userID = snapshot.data()['userID'],
        email = snapshot.data()['email'],
        password = snapshot.data()['password'],
        bodyDisabilities = snapshot.data()['bodyDisabilities'],
        bodyDisabilitiesText = snapshot.data()['bodyDisabilitiesText'],
        bornInGermany = snapshot.data()['bornInGermany'],
        identifyBlack = snapshot.data()['identifyBlack'],
        identifyQueer = snapshot.data()['identifyQueer'],
        migrationHistorySinceTwoYears =
            snapshot.data()['migrationHistorySinceTwoYears'],
        motherLangText = snapshot.data()['motherLangText'],
        otherLangs = snapshot.data()['otherLangs'],
        imageUrl = snapshot.data()['imageUrl'],
        motherLangGerman = snapshot.data()['motherLangGerman'];
  String toJson() => json.encode(toMap());

  factory UserModel.fromJson(String source) =>
      UserModel.fromMap(json.decode(source));

  @override
  String toString() {
    return 'UserModel(fullName: $fullName, userName: $userName, email: $email, password: $password, bodyDisabilitiesText: $bodyDisabilitiesText, bodyDisabilities: $bodyDisabilities, identifyQueer: $identifyQueer, bornInGermany: $bornInGermany, migrationHistorySinceTwoYears: $migrationHistorySinceTwoYears, motherLangGerman: $motherLangGerman, motherLangText: $motherLangText, otherLangs: $otherLangs, identifyBlack: $identifyBlack, imageUrl: $imageUrl, gender: $gender, userID: $userID)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is UserModel &&
        other.fullName == fullName &&
        other.userName == userName &&
        other.email == email &&
        other.password == password &&
        other.bodyDisabilitiesText == bodyDisabilitiesText &&
        other.bodyDisabilities == bodyDisabilities &&
        other.identifyQueer == identifyQueer &&
        other.bornInGermany == bornInGermany &&
        other.migrationHistorySinceTwoYears == migrationHistorySinceTwoYears &&
        other.motherLangGerman == motherLangGerman &&
        other.motherLangText == motherLangText &&
        other.otherLangs == otherLangs &&
        other.identifyBlack == identifyBlack &&
        other.imageUrl == imageUrl &&
        other.gender == gender &&
        other.userID == userID;
  }

  @override
  int get hashCode {
    return fullName.hashCode ^
        userName.hashCode ^
        email.hashCode ^
        password.hashCode ^
        bodyDisabilitiesText.hashCode ^
        bodyDisabilities.hashCode ^
        identifyQueer.hashCode ^
        bornInGermany.hashCode ^
        migrationHistorySinceTwoYears.hashCode ^
        motherLangGerman.hashCode ^
        motherLangText.hashCode ^
        otherLangs.hashCode ^
        identifyBlack.hashCode ^
        imageUrl.hashCode ^
        gender.hashCode ^
        userID.hashCode;
  }
}
