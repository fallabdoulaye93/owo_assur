import 'package:flutter/animation.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:logger/logger.dart';

import '../../../../utils/constants.dart';
import '../../../data/local/my_shared_pref.dart';
import '../../../routes/app_pages.dart';
import '../../../services/api_call_status.dart';
import '../../../services/base_client.dart';

class SplashController extends GetxController {
  // hold data coming from api
  List<dynamic>? data;
  // api call status
  ApiCallStatus apiCallStatus = ApiCallStatus.holding;

  @override
  void onInit() async {
    //var isDoctor = MySharedPref.getIsDoctor();
    //getData().then((_) async {

    Future.delayed(const Duration(milliseconds: 2500), () {
      Logger().d('Initializing App');
      Get.toNamed(Routes.WELCOME);
    });

    //});

    super.onInit();
  }
}