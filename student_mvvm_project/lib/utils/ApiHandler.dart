import 'dart:async';
import 'dart:convert';
import 'dart:io';
import 'package:http/http.dart' as http;
import 'error_handler.dart';

class ApiHandler {

  static Future<dynamic> post (url,{Map headers, body, encoding}) async {
    try {
      http.Response response = await http.post(url, headers: headers, body: body, encoding: encoding);
      if (response.statusCode == 200) {
        return json.decode(response.body);
      } else {
        throw ErrorHandler(code: response.statusCode);
      }
    } on FormatException {
      throw ErrorHandler(message: "Bad Response Format");
    } on SocketException {
      throw ErrorHandler(message: "Internet Connection Failure");
    } on HttpException {
      throw ErrorHandler(message: "Connection Problem");
    } on Exception catch (ex) {
      throw ErrorHandler(message: ex.toString().replaceAll("Exception: ", ""));
    }
  }

  static Future<dynamic> get (String url) async {
    try {
      http.Response response = await http.get(url);
      if (response.statusCode == 200) {
        return json.decode(response.body);
      } else {
        throw ErrorHandler(code: response.statusCode);
      }
    } on FormatException {
      throw ErrorHandler(message: "Bad Response Format");
    } on SocketException {
      throw ErrorHandler(message: "Internet Connection Failure");
    } on HttpException {
      throw ErrorHandler(message: "Connection Problem");
    } on Exception catch (ex) {
      throw ErrorHandler(message: ex.toString().replaceAll("Exception: ", ""));
    }
  }
}