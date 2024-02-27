import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

import '../../../../utils/constants.dart';
import '../../../routes/app_pages.dart';
import '../../../services/api_call_status.dart';
import '../../../services/base_client.dart';

class HomeController extends GetxController {
  // hold data coming from api
  List<dynamic>? data;
  // api call status
  ApiCallStatus apiCallStatus = ApiCallStatus.holding;

  navigateToPage(int index) {
    if (index == 0) {
      Get.toNamed(Routes.HOME);
    } else if (index == 1) {
      Get.toNamed(Routes.HOME);
    } else if (index == 2) {
      Get.toNamed(Routes.HOME);
    }
  }

  @override
  void onInit() {
    super.onInit();
  }
}
