import 'package:get/get.dart';
import 'package:logger/logger.dart';

import '../../../../utils/constants.dart';
import '../../../data/local/my_shared_pref.dart';
import '../../../services/api_call_status.dart';
import '../../../services/base_client.dart';

class LoginController extends GetxController with GetSingleTickerProviderStateMixin {
  //TODO: Implement LoginController
  final count = 0.obs;
  final isDoctor = "0".obs;
  // hold data coming from api
  List<dynamic>? data;
  // api call status
  ApiCallStatus apiCallStatus = ApiCallStatus.holding;
  bool termsAccepted = false;
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
        data = List.from(response.data);
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
    getData();
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
