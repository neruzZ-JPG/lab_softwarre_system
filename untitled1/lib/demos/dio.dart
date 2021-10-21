import 'package:flutter/material.dart';
import 'package:dio/dio.dart';
import 'dart:io';

void main() async {
  getHttp();
}

void getHttp() async {
  try {
    Response response = await Dio().get("http://www.google.com");
    print(response);
  } catch (e) {
    print(e);
  }
}