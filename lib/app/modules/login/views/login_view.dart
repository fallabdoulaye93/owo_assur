import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import '../../../../config/theme/light_theme_colors.dart';
import '../../../../config/translations/strings_enum.dart';
import '../../../components/api_error_widget.dart';
import '../../../components/my_widgets_animator.dart';
import '../../../data/local/my_shared_pref.dart';
import '../../../routes/app_pages.dart';
import '../../../services/login_service.dart';
import '../controllers/login_controller.dart';

class LoginView extends GetView<LoginController> {
  const LoginView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(

      body: GetBuilder<LoginController>(
        builder: (_){
          return Scaffold(
            backgroundColor: MySharedPref.getIsDoctor() == "0" ? Color(0xFF91B508) : Color(0xFF005FAB),
            body: MyWidgetsAnimator(
              apiCallStatus: controller.apiCallStatus,
              loadingWidget: () => const Center(child: CupertinoActivityIndicator(),),
              errorWidget: () => ApiErrorWidget(
                message: Strings.internetError.tr,
                retryAction: () => controller.getData(),
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
                          height: MediaQuery.of(context).size.height * 4/5,
                          decoration: const BoxDecoration(
                            color: Color(0xFFFFFFFF),
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
                          padding: const EdgeInsets.symmetric(horizontal: 30),
                          child: Column(
                            children: [
                              Flexible(
                                flex: 4,
                                child: Column(
                                    children: [
                                      const SizedBox(
                                        height: 130,
                                      ),
                                      _logo(),
                                      const SizedBox(
                                        height: 30,
                                      ),
                                      _labelTextInput("Email or ID", "Enter your informations", false),
                                      const SizedBox(
                                        height: 20,
                                      ),
                                      _labelTextInput("Password", "Enter your password", true),
                                      const SizedBox(
                                        height: 30,
                                      ),
                                      _agreeTOS(const Color(0xff909090)),
                                      const SizedBox(
                                        height: 30,
                                      ),
                                      (controller.termsAccepted==true) ? _loginBtnActive() : _loginBtnUnactive(),
                                      const SizedBox(
                                        height: 10,
                                      ),
                                    ],
                                ),
                              ),
                              Flexible(
                                flex: 1,
                                child: Align(
                                  alignment: Alignment.bottomCenter, // Align however you like (i.e .centerRight, centerLeft)
                                  child: Padding(
                                    padding: EdgeInsets.symmetric(vertical: 50.w),
                                    child: Text("Designed by Abduulaay", style: TextStyle(fontSize: 13.0, color: Colors.white, fontWeight: FontWeight.w400)),
                                  ),
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

Widget _agreeTOS(Color textColor) {
  LoginController controller = Get.put(LoginController());
  return Row(
    mainAxisAlignment: MainAxisAlignment.start,
    children: [
      Checkbox(
        value: controller.termsAccepted,
        activeColor: LightThemeColors.primaryColor,
        onChanged: (value) {
          //value ?? true ? controller.termsAccepted = true : controller.termsAccepted = false;
          controller.toggleTermsConditions();
        },
      ),
      Flexible( child: InkWell(
          onTap: () {
            Get.toNamed(Routes.CGU);
          },
          child: Html(
          data: """I agree to the <span style='color : #005FAB'>terms of services</span> <br />And <span style='color : #005FAB'>privacy policy</span>""",
          )
      ))
    ],
  );
}

Widget _loginBtnActive() {
  var isDoctor = MySharedPref.getIsDoctor();
  return Container(
    width: double.infinity,
    height: 50.w,
    decoration: const BoxDecoration(
      color: Color(0xFF005FAB),
      borderRadius: BorderRadius.all(Radius.circular(10)),
    ),
    child: TextButton(
      onPressed: () => {
         Get.toNamed(Routes.HOME)
      },
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Text(
            'Login',
            style: TextStyle(fontSize: 15.0, color: Colors.white, fontWeight: FontWeight.w900),
            textAlign: TextAlign.center,
          ),
          const SizedBox(
            width: 25,
          ),
          Image.asset(
            "assets/images/login/fleche.png",
            width: 25,
          )
        ],
      ),
    ),
  );
}

Widget _loginBtnUnactive() {
  return Container(
    width: double.infinity,
    height: 50.w,
    decoration: const BoxDecoration(
      color: Color(0xFFEFEFEF),
      borderRadius: BorderRadius.all(Radius.circular(10)),
    ),
    child: TextButton(
      onPressed: () => {},
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Text(
            'Login',
            style: TextStyle(fontSize: 15.0, color: Colors.white, fontWeight: FontWeight.w900),
            textAlign: TextAlign.center,
          ),
          const SizedBox(
            width: 25,
          ),
          Image.asset(
            "assets/images/login/fleche.png",
            width: 25,
          )
        ],
      ),
    ),
  );
}

Widget _labelTextInput(String label, String hintText, bool isPassword) {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Text(
        label,
          style: TextStyle(fontSize: 15.0, color: Colors.black, fontWeight: FontWeight.w600),
      ),
      TextField(
        obscureText: isPassword,
        cursorColor: Color(0xFF91B508),
        decoration: InputDecoration(
          hintText: hintText,
          hintStyle: TextStyle(fontSize: 15.0, color: Color(0xffdfe8f3), fontWeight: FontWeight.w500),
          enabledBorder: const UnderlineInputBorder(
            borderSide: BorderSide(color: Color(0xffdfe8f3)),
          ),
        ),
      ),
    ],
  );
}

Widget _logo() {
  return Center(
    child: SizedBox(
      child: Image.asset(
          'assets/images/splash/logo.png'
      ),
      height: 120,
    ),
  );
}