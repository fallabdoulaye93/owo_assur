import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../../../../config/theme/light_theme_colors.dart';
import '../controllers/splash_controller.dart';

class SplashView extends GetView<SplashController> {
  const SplashView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    MediaQueryData mediaQueryData = MediaQuery.of(context);
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(color: LightThemeColors.backgroundColor),
        child: Scaffold(
          body: Container(
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,
            child: SafeArea(
              child: Scaffold(
                  backgroundColor: LightThemeColors.backgroundColor,
                  body: Stack(
                    fit: StackFit.expand,
                    children: [
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Image.asset(
                              'assets/images/splash/logo.png',
                              width: mediaQueryData.size.width / 2
                          ),
                        ],
                      ),
                      Align(
                        child: Padding(
                          padding: const EdgeInsets.all(0.0),
                          child: Image.asset(
                              'assets/images/splash/background.png',
                              width: mediaQueryData.size.width
                          ),
                        ),
                      ),
                    ],
                  )
              ),
            ),
          ),
        ),
      )
    );
  }
}
