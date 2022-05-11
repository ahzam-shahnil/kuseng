// Dart imports:
import 'dart:convert';

class CaseModel {
  final String userID;
  final String caseID;
  final String clubName;
  final String clubDocID;
  final bool didComeIn;
  final bool? retry;
  final DateTime date;
  final String? explanation;
  CaseModel({
    required this.userID,
    required this.caseID,
    required this.clubName,
    required this.clubDocID,
    required this.didComeIn,
    this.retry,
    required this.date,
    this.explanation,
  });

  CaseModel copyWith({
    String? userID,
    String? caseID,
    String? clubName,
    String? clubDocID,
    bool? didComeIn,
    bool? retry,
    DateTime? date,
    String? explanation,
  }) {
    return CaseModel(
      userID: userID ?? this.userID,
      caseID: caseID ?? this.caseID,
      clubName: clubName ?? this.clubName,
      clubDocID: clubDocID ?? this.clubDocID,
      didComeIn: didComeIn ?? this.didComeIn,
      retry: retry ?? this.retry,
      date: date ?? this.date,
      explanation: explanation ?? this.explanation,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'userID': userID,
      'caseID': caseID,
      'clubName': clubName,
      'clubDocID': clubDocID,
      'didComeIn': didComeIn,
      'retry': retry,
      'date': date.millisecondsSinceEpoch,
      'explanation': explanation,
    };
  }

  factory CaseModel.fromMap(Map<String, dynamic> map) {
    return CaseModel(
      userID: map['userID'] ?? '',
      caseID: map['caseID'] ?? '',
      clubName: map['clubName'] ?? '',
      clubDocID: map['clubDocID'] ?? '',
      didComeIn: map['didComeIn'] ?? false,
      retry: map['retry'],
      date: DateTime.fromMillisecondsSinceEpoch(map['date']),
      explanation: map['explanation'],
    );
  }
  CaseModel.fromSnapshot(snapshot)
      : userID = snapshot.data()['userID'] ?? '',
        caseID = snapshot.data()['caseID'] ?? '',
        clubName = snapshot.data()['clubName'] ?? '',
        clubDocID = snapshot.data()['clubDocID'] ?? '',
        didComeIn = snapshot.data()['didComeIn'] ?? false,
        date = DateTime.fromMillisecondsSinceEpoch(snapshot.data()['date']),
        explanation = snapshot.data()['explanation'],
        retry = snapshot.data()['retry'];

  String toJson() => json.encode(toMap());

  factory CaseModel.fromJson(String source) =>
      CaseModel.fromMap(json.decode(source));

  @override
  String toString() {
    return 'CaseModel(userID: $userID, caseID: $caseID, clubName: $clubName, clubDocID: $clubDocID, didComeIn: $didComeIn, retry: $retry, date: $date, explanation: $explanation)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is CaseModel &&
        other.userID == userID &&
        other.caseID == caseID &&
        other.clubName == clubName &&
        other.clubDocID == clubDocID &&
        other.didComeIn == didComeIn &&
        other.retry == retry &&
        other.date == date &&
        other.explanation == explanation;
  }

  @override
  int get hashCode {
    return userID.hashCode ^
        caseID.hashCode ^
        clubName.hashCode ^
        clubDocID.hashCode ^
        didComeIn.hashCode ^
        retry.hashCode ^
        date.hashCode ^
        explanation.hashCode;
  }
}
