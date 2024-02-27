import 'dart:convert';
import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:logger/logger.dart';

import '../../../../utils/constants.dart';
import '../../../data/local/my_shared_pref.dart';
import '../../../routes/app_pages.dart';
import '../../../services/api_call_status.dart';
import '../../../services/base_client.dart';

class LoginController extends GetxController with GetSingleTickerProviderStateMixin {
  //TODO: Implement LoginController
  final count = 0.obs;
  final isDoctor = "0".obs;
  // hold data coming from api
  Response? responseData;
  // api call status
  ApiCallStatus apiCallStatus = ApiCallStatus.holding;
  bool termsAccepted = false;

  final TextEditingController userTextFieldController = TextEditingController();
  final TextEditingController passwordTextFieldController = TextEditingController();

  login(BuildContext context, String username, String password) async {
    if(username == "" || password == "")
      {
        AwesomeDialog(
          context: context,
          dialogType: DialogType.noHeader,
          headerAnimationLoop: true,
          animType: AnimType.bottomSlide,
          desc: "Il faut renseigner un utilisateur et un mot de passe",
          showCloseIcon: false,
          btnOkOnPress: () {
          },
        ).show();
        return;
      }
    var params =  {
      'userName': username,
      'password': password,
      'sourceIp': '115.0.0.0',
      'browser': 'chrome',
      'host': '134.209.21.37',
      'osName': 'ios',
      'longitude': 'undefined',
      'latitude': 'undefined',
      'channel': 'mobile'
    };
    // *) perform api call
    await BaseClient.safeApiCall(
      Constants.loginUrl, // url
      RequestType.post, // request type (get,post,delete,put)
      headers: { 'Content-type': 'application/json',
        'Accept': '*/*',
        "uiKey": Constants.uiKey},
      data: jsonEncode(params),
      onLoading: () {
        // *) indicate loading state
        apiCallStatus = ApiCallStatus.loading;
      },
      onSuccess: (response){ // api done successfully
        if(response.data['data']['status'].toString().compareTo("OK") == 0)
          {
            MySharedPref.setUserConnected(response.data['data'].toString()).then((_) async {

              await MySharedPref.setUserProfileId(response.data['data']['ProfileId']);
              await MySharedPref.setUserName(response.data['data']['UserName']);
              await MySharedPref.setUserFirstLoginStatus(response.data['data']['FirstLoginStatus']);
              await MySharedPref.setUserRoleID(response.data['data']['RoleID']);
              await MySharedPref.setUserFullName(response.data['data']['FullName']);
              await MySharedPref.setUserEntityId(response.data['data']['EntityId']);
              await MySharedPref.setUserIsPractitioner(response.data['data']['IsPractitioner']);
              await MySharedPref.setUserPractitionerId(response.data['data']['Practitioner_Id']);
              await MySharedPref.setUserPractitionerTypeName(response.data['data']['PractitionerTypeName']);
              await MySharedPref.setUserCurrencyCode(response.data['data']['CurrencyCode']);
              await MySharedPref.setUserLastLoginDate(response.data['data']['LastLoginDate']);
              await MySharedPref.setUserproviderListing(response.data['data']['providerListing'].toString());

              Get.offNamed(Routes.SELECT_PROVIDER, arguments: jsonEncode(response.data['data']['providerListing']));
            });
          }
        else
          {
            AwesomeDialog(
              context: context,
              dialogType: DialogType.error,
              headerAnimationLoop: false,
              animType: AnimType.bottomSlide,
              desc: response.data['data']['message'],
              showCloseIcon: false,
              btnOkOnPress: () {
              },
            ).show();
          }
        // *) indicate success state
        apiCallStatus = ApiCallStatus.success;
      },
      // if you don't pass this method base client
      // will automaticly handle error and show message to user
      onError: (error){
        // show error message to user
        BaseClient.handleApiError(error);
        // *) indicate error status
        apiCallStatus = ApiCallStatus.error;
      },
    );
  }

  // getting data from api
  getData() async {
    // *) perform api call
    await BaseClient.safeApiCall(
      Constants.todosApiUrl, // url
      RequestType.get, // request type (get,post,delete,put)
      onLoading: () {
        // *) indicate loading state
        apiCallStatus = ApiCallStatus.loading;
        update();
      },
      onSuccess: (response){ // api done successfully
        //final jsonResponse = jsonDecode(response.data['data']);
        // *) indicate success state
        apiCallStatus = ApiCallStatus.success;
        update();
      },
      // if you don't pass this method base client
      // will automaticly handle error and show message to user
      onError: (error){
        // show error message to user
        BaseClient.handleApiError(error);
        // *) indicate error status
        apiCallStatus = ApiCallStatus.error;
        update();
      },
    );
  }


  void toggleTermsConditions() {
    if (termsAccepted)
      {
        termsAccepted = false;
        Logger().d('Unchecked');
      }
    else
      {
        termsAccepted = true;
        Logger().d('Checked');
      }

    update();
  }

  @override
  Future<void> onInit() async {
    apiCallStatus = ApiCallStatus.success;
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

}
