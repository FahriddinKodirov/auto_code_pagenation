import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:pagenation_app/screen/pagination/pagination_screen.dart';

class MyUtils {
  static getMyToast({required String message}) => Fluttertoast.showToast(
        msg: message,
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.BOTTOM_RIGHT,
        timeInSecForIosWeb: 1,
        backgroundColor: Colors.grey.shade300,
        textColor: Colors.black,
        fontSize: 16.0,
      );
}

InputDecoration getInputDecorationTwo({required String label}) {
  return InputDecoration(
    hintText: label,
    labelStyle: const TextStyle(color: Colors.black, fontSize: 16),
    border: const OutlineInputBorder(
      borderRadius: BorderRadius.all(Radius.circular(4)),
      borderSide: BorderSide(
        width: 1,
      ),
    ),
    enabledBorder: const OutlineInputBorder(
        borderSide: BorderSide(width: 1, color: Colors.black)),
    focusedBorder: const OutlineInputBorder(
        borderSide: BorderSide(width: 1, color: Colors.black)),
    errorBorder: const OutlineInputBorder(
        borderSide: BorderSide(width: 1, color: Colors.black)),
  );
}

height(context) => MediaQuery.of(context).size.height;
width(context) => MediaQuery.of(context).size.width;

navigator(context) async {
    await Future.delayed(const Duration(seconds: 1));
    // ignore: use_build_context_synchronously
    Navigator.pushReplacement(
        context, MaterialPageRoute(builder: (_) => const PaginationScreen()));
  }
