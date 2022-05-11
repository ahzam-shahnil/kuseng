// Package imports:
import 'package:regexpattern/regexpattern.dart';

bool checkEmail(String email) {
  return email.isEmail();
}
bool checkUserName(String userName) {
  return userName.isUsername();
}
