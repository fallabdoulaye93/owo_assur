import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:get/get.dart';
import 'package:logger/logger.dart';
import 'package:owo_assur/app/data/models/provider_model.dart';

import '../../../data/local/my_shared_pref.dart';
import '../../../services/api_call_status.dart';

class SelectProviderController extends GetxController {
  //TODO: Implement SelectProviderController
  Response? responseData;
  String? fullname;
  String? practitionerTypeName;
  // api call status
  ApiCallStatus apiCallStatus = ApiCallStatus.holding;
  final count = 0.obs;
  List<ProviderModel> providers = <ProviderModel>[];

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

  Future<List<ProviderModel>> fetchProviders(String response) async {
    return compute(parseProviders, response);
  }

  List<ProviderModel> parseProviders(String responseBody) {
    Logger().d('Fetching providers ...');
    var list = json.decode(responseBody);
    var providers = list.map((e) => ProviderModel.fromJson(e)).toList();
    Logger().d('Total ${list.length} providers found !');
    return providers;
  }

}
