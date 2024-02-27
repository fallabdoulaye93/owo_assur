import 'package:get/get.dart';

import '../controllers/select_provider_controller.dart';

class SelectProviderBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<SelectProviderController>(
      () => SelectProviderController(),
    );
  }
}
