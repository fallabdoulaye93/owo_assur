import 'package:get/get.dart';

import '../../../../utils/constants.dart';
import '../../../data/local/my_shared_pref.dart';
import '../../../services/api_call_status.dart';
import '../../../services/base_client.dart';

class WelcomeController extends GetxController {
  // hold data coming from api
  List<dynamic>? data;
  // api call status
  ApiCallStatus apiCallStatus = ApiCallStatus.holding;

  @override
  void onInit() {
    MySharedPref.setIsDoctor("0");
    super.onInit();
  }
}