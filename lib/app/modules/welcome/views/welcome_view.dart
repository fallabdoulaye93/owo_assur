import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:owo_assur/config/theme/light_theme_colors.dart';
import '../../../data/local/my_shared_pref.dart';
import '../../../routes/app_pages.dart';
import '../../../services/welcome_service.dart';
import '../controllers/welcome_controller.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';

class WelcomeView extends GetView<WelcomeController> {
  const WelcomeView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GetBuilder<WelcomeController>(
        builder: (_){
          return Scaffold(
            body: Consumer<WelcomeService>(
              builder: (context, model, child) => Column(
                children: <Widget>[
                  Flexible(
                    flex: 3,
                    child: Container(
                      color: LightThemeColors.scaffoldBackgroundColor,
                      child: Stack(
                        alignment: Alignment.topRight,
                        children: [
                          Positioned(
                            left: 10,
                            top: 0,
                            right: 10,
                            child: Image.asset('assets/images/welcome/image2.png'),
                          ),
                          Positioned(
                              left: 20,
                              top: 90,
                              right: 20,
                              child: Image.asset('assets/images/welcome/image3.png'),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Flexible(
                    flex: 1,
                    child: Column(
                      children: [
                        Padding(
                          padding: EdgeInsets.symmetric(horizontal: 50),
                          child: Container(
                            alignment: Alignment.centerLeft,
                            child: Text(
                                "I am a"
                            ),
                          ),
                        ),
                        SizedBox(height: 15),
                        Container(
                          child: buttons(context),
                        ),

                      ],
                    ),
                  ),
                  Flexible(
                    flex: 1,
                    child: Container(
                        alignment: Alignment.bottomRight,
                        child: Image.asset(
                          "assets/images/welcome/image4.png",
                          width: MediaQuery.of(context).size.width/2,
                        )
                    ),
                  ),
                ],
              )
            ),
          );
        },
      ),
    );

  }

  Widget buttons(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        InkWell(
          onTap: () async {
            await MySharedPref.setIsDoctor("1");
            Get.toNamed(Routes.LOGIN);
          },
          child: Container(
            alignment: Alignment.center,
            width: size.width / 2.8,
            height: size.height / 16,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10.0),
              color: const Color(0xFF005FAB),
              border: Border.all(
                width: 1.0,
                color: const Color(0xFFEFEFEF),
              ),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Image.asset(
                  "assets/images/welcome/doctor.png",
                  width: 20,
                ),
                const SizedBox(
                  width: 16,
                ),
                const Text(
                  'Doctor',
                  style: TextStyle(fontSize: 12.0, color: Colors.white, fontWeight: FontWeight.w900),
                  textAlign: TextAlign.center,
                ),
              ],
            ),
          ),
        ),
        const SizedBox(
          width: 16,
        ),
        InkWell(
        onTap: () async {
            await MySharedPref.setIsDoctor("0");
            Get.toNamed(Routes.LOGIN);
        },
        child:
            Container(
              alignment: Alignment.center,
              width: size.width / 2.8,
              height: size.height / 16,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10.0),
                color: const Color(0xFF91B508),
                border: Border.all(
                  width: 1.0,
                  color: const Color(0xFFEFEFEF),
                ),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset(
                    "assets/images/welcome/pharmacie.png",
                    width: 20,
                  ),
                  const SizedBox(
                    width: 16,
                  ),
                  const Text(
                    'Pharmacy',
                    style: TextStyle(fontSize: 12.0, color: Colors.white, fontWeight: FontWeight.w900),
                    textAlign: TextAlign.center,
                  ),
                ],
              ),
            ),
        )
      ],
    );
  }

  Widget pictureBeforeButtons(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.only(left: 20, right: 20, top: 40, bottom: 40),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              const Spacer(flex: 2),
              Image.asset('assets/images/welcome/image1.png'),
              const Spacer(flex: 3),
            ],
          ),
        ),
        const SizedBox(
          height: 16,
        )
      ],
    );
  }
}
