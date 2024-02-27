import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

import '../../../../utils/constants.dart';
import '../../../data/local/my_shared_pref.dart';
import '../../../routes/app_pages.dart';
import '../../../services/api_call_status.dart';
import '../../../services/base_client.dart';

class HomeController extends GetxController {
  // hold data coming from api
  List<dynamic>? data;
  Response? responseData;
  String? fullname;
  String? practitionerTypeName;
  // api call status
  ApiCallStatus apiCallStatus = ApiCallStatus.holding;

  @override
  void onInit() {
    apiCallStatus = ApiCallStatus.success;
    getFullNameUserConnecte();
    getPractitionerTypeName();

    update();
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }

  getFullNameUserConnecte() async {
    await MySharedPref.getUserFullName().then((value) {
      fullname = value;
    });
  }
  getPractitionerTypeName() async {
    await MySharedPref.getUserPractitionerTypeName().then((value) {
      practitionerTypeName = value;
    });
  }

}
