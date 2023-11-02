import 'package:flutter/material.dart';

class ReplySettings extends ChangeNotifier {
  List<String> appsToReply = [];

  bool replyToAllPhoneNumbers = true;
  List<String> phoneNumbersToReply = [];

  void addAppsToReply(List<String> apps) {
    appsToReply.addAll(apps);
    notifyListeners();
  }
}
