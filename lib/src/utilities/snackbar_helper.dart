import 'package:flutter/material.dart';

class SnackbarHelper {
  static SnackBar info(String message) {
    return SnackBar(
      behavior: SnackBarBehavior.floating,
      backgroundColor: Colors.blueGrey,
      content: Text(message),
    );
  }

  static SnackBar success(String message) {
    return SnackBar(
      behavior: SnackBarBehavior.floating,
      backgroundColor: Colors.green,
      content: Text(message),
    );
  }

  static SnackBar error(String message) {
    return SnackBar(
      behavior: SnackBarBehavior.floating,
      backgroundColor: Colors.redAccent,
      content: Text(message),
    );
  }
}
