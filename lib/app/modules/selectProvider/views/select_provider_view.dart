import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:get/get.dart';
import 'package:owo_assur/app/data/models/provider_model.dart';
import 'package:owo_assur/config/theme/light_theme_colors.dart';

import '../../../../config/translations/strings_enum.dart';
import '../../../components/api_error_widget.dart';
import '../../../components/my_widgets_animator.dart';
import '../../../data/local/my_shared_pref.dart';
import '../controllers/select_provider_controller.dart';

class SelectProviderView extends GetView<SelectProviderController> {
  const SelectProviderView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);
    if (Get.arguments != null) {
      var args = Get.arguments;
      controller.providers = (jsonDecode(args) as List)
          .map((e) => ProviderModel.fromJson((e as Map).cast()))
          .toList();
    }
    return Scaffold(
      body: GetBuilder<SelectProviderController>(
        builder: (_){
          return Scaffold(
              appBar: AppBar(
                automaticallyImplyLeading: false,
                actions: <Widget>[
                  IconButton(
                    icon: Icon(
                      Icons.notifications,
                      color: Colors.white,
                    ),
                    onPressed: () {
                      // do something
                    },
                  )
                ],
                backgroundColor: Colors.transparent,
                elevation: 0.0,
              ),
              extendBodyBehindAppBar: true,
              backgroundColor: Color(0xFFFFFFFF),
              body: MyWidgetsAnimator(
                apiCallStatus: controller.apiCallStatus,
                loadingWidget: () => const Center(child: CupertinoActivityIndicator(),),
                errorWidget: () => ApiErrorWidget(
                  message: Strings.internetError.tr,
                  retryAction: () => {},
                  padding: EdgeInsets.symmetric(horizontal: 20.w),
                ),
                successWidget: () => SingleChildScrollView(
                  child: SizedBox(
                    width: double.infinity,
                    height: MediaQuery.of(context).size.height,
                    child: Stack(
                      children: [
                        Positioned(
                          top: 0,
                          left: 0,
                          right: 0,
                          child: Container(
                            width: 300,
                            height: MediaQuery.of(context).size.height * 1/2,
                            decoration:  BoxDecoration(
                                color: MySharedPref.getIsDoctor() == "0" ? Color(0xFF91B508) : Color(0xFF005FAB),
                                borderRadius: BorderRadius.only(
                                  topLeft: Radius.zero,
                                  topRight: Radius.zero,
                                  bottomLeft: Radius.circular(50.0),
                                  bottomRight: Radius.circular(50.0),
                                )
                            ),
                          ),
                        ),
                        SizedBox(
                          width: double.infinity,
                          child: Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 0),
                            child: Column(
                              children: [
                                Flexible(
                                  flex: 2,
                                  child: Stack(
                                    children: [
                                      Positioned(
                                        left: 10,
                                        top: MediaQuery.of(context).size.height * 1/4-60,
                                        child: Image.asset('assets/images/petitrond.png', width: 120),
                                      ),
                                      Positioned(
                                        top: MediaQuery.of(context).size.height * 1/4-120,
                                        right: 0,
                                        child: Image.asset('assets/images/grandrond.png', width: 120),
                                      ),
                                      Align(
                                        alignment: Alignment.center, // Align however you like (i.e .centerRight, centerLeft)
                                        child: SizedBox(
                                          width: 250,
                                          height: 250,
                                          child: Padding(
                                            padding: EdgeInsets.symmetric(vertical: 40.w),
                                            child: CircleAvatar(radius: (52),
                                                backgroundColor: Colors.white,
                                                child: ClipRRect(
                                                  borderRadius:BorderRadius.circular(50),
                                                  child: Image.asset("assets/images/splash/logo.png", width: 140),
                                                )
                                            ),
                                          ),
                                        )
                                      ),
                                      Positioned(
                                        bottom: 0,
                                        left: 0,
                                        right: 0,
                                        child: Padding(
                                            padding: const EdgeInsets.symmetric(horizontal: 50),
                                            child: Container(
                                              height: 50,
                                              width: MediaQuery.of(context).size.width,
                                              child: Card(
                                                shape: RoundedRectangleBorder(
                                                    borderRadius: BorderRadius.only(topLeft: Radius.circular(20), topRight: Radius.circular(20))),
                                                color: Colors.white,
                                                child: Align(
                                                    alignment: Alignment.center, // Align however you like (i.e .centerRight, centerLeft)
                                                    child: Text(controller.fullname??"", style: TextStyle(fontSize: 13.0, color: MySharedPref.getIsDoctor() == "0" ? Color(0xFF91B508) : Color(0xFF005FAB), fontWeight: FontWeight.w400))
                                                ),
                                              ),
                                            )
                                        )
                                      ),
                                    ],
                                  ),
                                ),
                                Flexible(
                                  flex: 2,
                                  child: Stack(
                                    children: [
                                      Positioned(
                                          top: 0,
                                          left: 0,
                                          right: 0,
                                          child: Column(
                                            crossAxisAlignment: CrossAxisAlignment.center,
                                            mainAxisAlignment: MainAxisAlignment.center,
                                            children: [
                                              Padding(
                                                  padding: const EdgeInsets.symmetric(horizontal: 50),
                                                  child: Container(
                                                    height: 50,
                                                    width: MediaQuery.of(context).size.width,
                                                    child: Card(
                                                      shape: RoundedRectangleBorder(
                                                          borderRadius: BorderRadius.only(bottomLeft: Radius.circular(20), bottomRight: Radius.circular(20))),
                                                      color: MySharedPref.getIsDoctor() == "0" ? Color(0xFF91B508) : Color(0xFF005FAB),
                                                      child: Align(
                                                          alignment: Alignment.center, // Align however you like (i.e .centerRight, centerLeft)
                                                          child: Text(controller.practitionerTypeName??"", style: TextStyle(fontSize: 13.0, color: Colors.white, fontWeight: FontWeight.w400))
                                                      ),
                                                    ),
                                                  )
                                              ),
                                              Padding(
                                                padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 20.w),
                                                child: Row(
                                                  crossAxisAlignment: CrossAxisAlignment.center,
                                                  children: [
                                                    Flexible(
                                                      child: new Container(
                                                        padding: new EdgeInsets.only(right: 3.0),
                                                        child: new Text(
                                                          "Please select a registered provider",
                                                          style: theme.textTheme.headline2,
                                                          overflow: TextOverflow.ellipsis,
                                                          maxLines: 2,
                                                        ),
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                              Column(
                                                  children: controller.providers.map((item) {
                                                    return ProviderCardView(
                                                      entity_id: item.ENTITYID!,
                                                      entity_type_id: item.ENTITYTYPEID!,
                                                      entity_type_name: item.ENTITYTYPENAME!,
                                                      entity_name: item.ENTITYNAME!,
                                                      entity_description: item.ENTITYDESCRIPTION!,
                                                      entity_reg_no: item.ENTITYREGNO!,
                                                    );
                                                  }).toList())
                                            ],
                                          ),
                                      ),

                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              )
          );
        },
      ),
    );
  }
}


class ProviderCardView extends StatelessWidget {
  const ProviderCardView({
    Key? key,
    required this.entity_id,
    required this.entity_type_id,
    required this.entity_type_name,
    required this.entity_name,
    required this.entity_description,
    required this.entity_reg_no
  }) : super(key: key);

  final String entity_id;
  final String entity_type_id;
  final String entity_type_name;
  final String entity_name;
  final String entity_description;
  final String entity_reg_no;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [

        GestureDetector(
          onTap: () async {
            await MySharedPref.setUserEntityId(entity_id);
            await MySharedPref.setUserEntityTypeId(entity_type_id);
            await MySharedPref.setUserEntityTypeName(entity_type_name);
            await MySharedPref.setUserEntityName(entity_name);
            await MySharedPref.setUserEntityDescription(entity_description);
            await MySharedPref.setUserEntityRegNo(entity_reg_no);
          },
          child : Padding(
            padding: EdgeInsets.only(left: 10),
            child: Container(
              width:  MediaQuery.of(context).size.width,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(20),
                child: Column(
                  children: [
                    Container(
                        child: Container(
                          margin: EdgeInsets.zero,
                          padding: EdgeInsets.symmetric(horizontal: 10.h,vertical: 13.h),
                          // border only from top and bottom
                          decoration: BoxDecoration(
                              color: LightThemeColors.backgroundColor,
                              border: Border(
                                 bottom: BorderSide(
                                   color: Color(0xFFECEFF1)
                                 ),
                                top: BorderSide(
                                  color: Get.isDarkMode ? const Color(0xFF414141) : const Color(0xFFF6F6F6),
                                ),
                              )
                          ),
                          child: Row(
                            children: [
                              Container(
                                  height: 35.h,
                                  width: 35.h,
                                  child: Image.asset(
                                      MySharedPref.getIsDoctor() == "0" ? 'assets/images/welcome/hopital.png' : 'assets/images/welcome/pharmacie.png',
                                      width: 15.h,
                                  )
                              ),
                              17.horizontalSpace,
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    entity_name,
                                    maxLines: 2,
                                    overflow: TextOverflow.fade,
                                  ),
                                  4.verticalSpace,
                                  Row(
                                    children: [
                                      Text(
                                        entity_id,
                                        maxLines: 2,
                                        overflow: TextOverflow.fade,
                                      ),
                                    ],
                                  ),
                                ],
                              )
                            ],
                          ),
                        )
                    ),
                  ],
                ),
              ),
            ),
          ),
        )
      ],
    );
  }
}
