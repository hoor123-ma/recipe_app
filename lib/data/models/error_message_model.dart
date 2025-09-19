// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/widgets.dart';

class ErrorMessageModel {
  String message;
  IconData icon;
  ErrorMessageModel({required this.message, required this.icon});

  @override
  String toString() {
    // TODO: implement toString
    return "$message ";
  }
}
