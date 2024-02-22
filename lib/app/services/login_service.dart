import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:http/http.dart';
import 'package:flutter/cupertino.dart';
import '../routes/app_pages.dart';


class LoginService extends ChangeNotifier {
  //String baseUrl = Env.ipKajou + "/webservice/rest/server.php?moodlewsrestformat=json&wstoken=" + Env.tokenMoodle + "&wsfunction=";
  String baseUrl = "/webservice/rest/server.php?moodlewsrestformat=json&wstoken=&wsfunction=";

  // Get Datas
  Future<void> getDatas(BuildContext context, String phoneNumber, String code, bool synchro) async {

  }


}
