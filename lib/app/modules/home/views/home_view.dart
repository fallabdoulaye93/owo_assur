import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

import '../../../../config/translations/strings_enum.dart';
import '../../../components/api_error_widget.dart';
import '../../../components/my_widgets_animator.dart';
import '../../../data/local/my_shared_pref.dart';
import '../../../services/api_call_status.dart';
import '../controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {
  const HomeView({Key? key}) : super(key: key);


  Widget getSearchBarUI(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 0.0, left: 15),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Container(
            width: MediaQuery.of(context).size.width * 0.75,
            height: 64,
            child: Padding(
              padding: const EdgeInsets.only(top: 0, bottom: 8),
              child: Container(
                decoration: BoxDecoration(
                  color: Color(0xFFFFFFFF),
                  borderRadius: const BorderRadius.all(
                    Radius.circular(18.0),
                  ),
                  boxShadow: <BoxShadow>[
                    BoxShadow(
                        color: Colors.grey.withOpacity(0.2),
                        offset: const Offset(0, 2),
                        blurRadius: 8.0),
                  ],
                ),
                child: Row(
                  children: <Widget>[
                    Expanded(
                      child: Container(
                        padding: const EdgeInsets.only(left: 16, right: 16),
                        child: TextFormField(
                          keyboardType: TextInputType.text,
                          decoration: InputDecoration(
                            labelText: 'Enter patient number',
                            border: InputBorder.none,
                            helperStyle: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 16,
                              color: Color(0xFFB9BABC),
                            ),
                            labelStyle: TextStyle(
                              fontWeight: FontWeight.w600,
                              fontSize: 16,
                              letterSpacing: 0.2,
                              color: Color(0xFFB9BABC),
                            ),
                          ),
                          onEditingComplete: () {},
                        ),
                      ),
                    ),
                    SizedBox(
                      width: 60,
                      height: 60,
                      child: Icon(Icons.search, color: Color(0xFFB9BABC)),
                    )
                  ],
                ),
              ),
            ),
          ),
          const Expanded(
            child: SizedBox(),
          )
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    HomeController controller = Get.put(HomeController());
    var theme = Theme.of(context);
    return Scaffold(
      body: GetBuilder<HomeController>(
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
              backgroundColor: Color(0xFFF2F6FE),
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
                            padding: const EdgeInsets.symmetric(horizontal: 10),
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
                                              padding: EdgeInsets.only(top: 30,left: 20,right: 20, bottom: 15),
                                              child: Row(
                                                crossAxisAlignment: CrossAxisAlignment.center,
                                                children: [
                                                  Flexible(
                                                    child: new Container(
                                                      padding: new EdgeInsets.only(right: 3.0),
                                                      child: new Text(
                                                        "Enter patient number",
                                                        style: theme.textTheme.headline2,
                                                        overflow: TextOverflow.ellipsis,
                                                        maxLines: 2,
                                                      ),
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ),
                                            getSearchBarUI(context)

                                          ],
                                        ),
                                      ),
                                      Positioned(
                                        bottom: 40,
                                        left: 0,
                                        right: 0,
                                        child: SizedBox(
                                          child: Padding(
                                              padding: const EdgeInsets.symmetric(horizontal: 0),
                                              child: Row(
                                                children: <Widget>[
                                                  Flexible(
                                                    flex: 1,
                                                    child: Padding(
                                                        padding: const EdgeInsets.only(left: 10),
                                                        child: Container(
                                                          height: 70,
                                                          width: MediaQuery.of(context).size.width,
                                                          child: Card(
                                                            shape: RoundedRectangleBorder(
                                                                borderRadius: BorderRadius.only(bottomLeft: Radius.circular(50), topLeft: Radius.circular(50))),
                                                            color: Colors.white,
                                                            child: Align(
                                                                alignment: Alignment.center, // Align however you like (i.e .centerRight, centerLeft)
                                                                child: Row(
                                                                  mainAxisAlignment: MainAxisAlignment.center,
                                                                  children: [
                                                                    Icon(
                                                                      Icons.history,
                                                                      color: MySharedPref.getIsDoctor() == "0" ? Color(0xFF91B508) : Color(0xFF005FAB),
                                                                    ),
                                                                    const SizedBox(
                                                                      width: 10,
                                                                    ),
                                                                    Text("Transactions", style: TextStyle(fontSize: 15.0, color: MySharedPref.getIsDoctor() == "0" ? Color(0xFF91B508) : Color(0xFF005FAB), fontWeight: FontWeight.w800))
                                                                  ],
                                                                )
                                                            ),
                                                          ),
                                                        )
                                                    ),
                                                  ),
                                                  Flexible(
                                                    flex: 1,
                                                    child: Padding(
                                                        padding: const EdgeInsets.only(right: 10),
                                                        child: Container(
                                                          height: 70,
                                                          width: MediaQuery.of(context).size.width,
                                                          child: Card(
                                                            shape: RoundedRectangleBorder(
                                                                borderRadius: BorderRadius.only(topRight: Radius.circular(50), bottomRight: Radius.circular(50))),
                                                            color: MySharedPref.getIsDoctor() == "0" ? Color(0xFF91B508) : Color(0xFF005FAB),
                                                            child: Align(
                                                                alignment: Alignment.center, // Align however you like (i.e .centerRight, centerLeft)
                                                                child: Row(
                                                                  mainAxisAlignment: MainAxisAlignment.center,
                                                                  children: [
                                                                    Icon(
                                                                      Icons.insert_chart_outlined,
                                                                      color: Colors.white,
                                                                    ),
                                                                    const SizedBox(
                                                                      width: 10,
                                                                    ),
                                                                    Text("Reporting", style: TextStyle(fontSize: 15.0, color: Colors.white, fontWeight: FontWeight.w800))
                                                                  ],
                                                                )
                                                            ),
                                                          ),
                                                        )
                                                    ),
                                                  ),
                                                ],
                                              )
                                          ),
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
