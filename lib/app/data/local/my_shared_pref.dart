import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:logger/logger.dart';
import 'package:owo_assur/app/data/models/provider_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../config/translations/localization_service.dart';

class MySharedPref {
  // prevent making instance
  MySharedPref._();

  // get storage
  static late SharedPreferences _sharedPreferences;

  // STORING KEYS
  static const String _isDoctor = 'is_doctor';
  static const String _userConnected = 'userConnected';
  static const String _currentLocalKey = 'current_local';
  static const String _lightThemeKey = 'is_theme_light';

  /// init get storage services
  static Future<void> init() async {
    _sharedPreferences = await SharedPreferences.getInstance();
  }

  static setStorage(SharedPreferences sharedPreferences) {
    _sharedPreferences = sharedPreferences;
  }

  /// set theme current type as light theme
  static Future<void> setThemeIsLight(bool lightTheme) =>
      _sharedPreferences.setBool(_lightThemeKey, lightTheme);

  /// get if the current theme type is light
  static bool getThemeIsLight() =>
      _sharedPreferences.getBool(_lightThemeKey) ?? true; // todo set the default theme (true for light, false for dark)

  /// save current locale
  static Future<void> setCurrentLanguage(String languageCode) =>
      _sharedPreferences.setString(_currentLocalKey, languageCode);

  /// get current locale
  static Locale getCurrentLocal(){
      String? langCode = _sharedPreferences.getString(_currentLocalKey);
      // default language is english
      if(langCode == null){
        return LocalizationService.defaultLanguage;
      }
      return LocalizationService.supportedLanguages[langCode]!;
  }

  static Future<void> setIsDoctor(String value) =>
      _sharedPreferences.setString(_isDoctor, value);

  static String? getIsDoctor() =>
      _sharedPreferences.getString(_isDoctor);

  static Future<void> setUserConnected(String value) =>
      _sharedPreferences.setString(_userConnected, value);

  static Future<String?> getUserConnected() async {
    String? user = _sharedPreferences.getString(_userConnected);
    return user;
  }



  static Future<String?> getUserProfileId() async {
    String? s = _sharedPreferences.getString("_userProfileId");
    return s;
  }
  static Future<void> setUserProfileId(String value) => _sharedPreferences.setString("_userProfileId", value);


  static Future<String?> getUserName() async {
    String? s = _sharedPreferences.getString("_userName");
    return s;
  }
  static Future<void> setUserName(String value) => _sharedPreferences.setString("_userName", value);


  static Future<String?> getUserFirstLoginStatus() async {
    String? s = _sharedPreferences.getString("_userFirstLoginStatus");
    return s;
  }
  static Future<void> setUserFirstLoginStatus(String value) => _sharedPreferences.setString("_userFirstLoginStatus", value);


  static Future<String?> getUserRoleID() async {
    String? s = _sharedPreferences.getString("_userRoleID");
    return s;
  }
  static Future<void> setUserRoleID(String value) => _sharedPreferences.setString("_userRoleID", value);


  static Future<String?> getUserFullName() async {
    String? s = _sharedPreferences.getString("_userFullName");
    return s;
  }
  static Future<void> setUserFullName(String value) => _sharedPreferences.setString("_userFullName", value);


  static Future<String?> getUserEntityId() async {
    String? s = _sharedPreferences.getString("_userEntityId");
    return s;
  }
  static Future<void> setUserEntityId(String value) => _sharedPreferences.setString("_userEntityId", value);


  static Future<String?> getUserEntityTypeId() async {
    String? s = _sharedPreferences.getString("_userEntityTypeId");
    return s;
  }
  static Future<void> setUserEntityTypeId(String value) => _sharedPreferences.setString("_userEntityTypeId", value);


  static Future<String?> getUserEntityTypeName() async {
    String? s = _sharedPreferences.getString("_userEntityTypeName");
    return s;
  }
  static Future<void> setUserEntityTypeName(String value) => _sharedPreferences.setString("_userEntityTypeName", value);


  static Future<String?> getUserEntityName() async {
    String? s = _sharedPreferences.getString("_userEntityName");
    return s;
  }
  static Future<void> setUserEntityName(String value) => _sharedPreferences.setString("_userEntityName", value);


  static Future<String?> getUserEntityDescription() async {
    String? s = _sharedPreferences.getString("_userEntityDescription");
    return s;
  }
  static Future<void> setUserEntityDescription(String value) => _sharedPreferences.setString("_userEntityDescription", value);

  static Future<String?> getUserEntityRegNo() async {
    String? s = _sharedPreferences.getString("_userEntityRegNo");
    return s;
  }
  static Future<void> setUserEntityRegNo(String value) => _sharedPreferences.setString("_userEntityRegNo", value);


  static Future<String?> getUserIsPractitioner() async {
    String? s = _sharedPreferences.getString("_userIsPractitioner");
    return s;
  }
  static Future<void> setUserIsPractitioner(String value) => _sharedPreferences.setString("_userIsPractitioner", value);


  static Future<String?> getUserPractitionerId() async {
    String? s = _sharedPreferences.getString("_userPractitionerId");
    return s;
  }
  static Future<void> setUserPractitionerId(String value) => _sharedPreferences.setString("_userPractitionerId", value);



  static Future<String?> getUserPractitionerTypeName() async {
    String? s = _sharedPreferences.getString("_userPractitionerTypeName");
    return s;
  }
  static Future<void> setUserPractitionerTypeName(String value) => _sharedPreferences.setString("_userPractitionerTypeName", value);



  static Future<String?> getUserCurrencyCode() async {
    String? s = _sharedPreferences.getString("_userCurrencyCode");
    return s;
  }
  static Future<void> setUserCurrencyCode(String value) => _sharedPreferences.setString("_userCurrencyCode", value);



  static Future<String?> getUserLastLoginDate() async {
    String? s = _sharedPreferences.getString("_userLastLoginDate");
    return s;
  }
  static Future<void> setUserLastLoginDate(String value) => _sharedPreferences.setString("_userLastLoginDate", value);



  /*static Future<String?> getUserproviderListing() async {
    String? s = _sharedPreferences.getString("_userproviderListing");
    return s;
  }*/
  static String? getUserproviderListing()  {
    String? s =  _sharedPreferences.getString("_userproviderListing");
    var json = jsonDecode(s!); //_InternalLinkedHashMap
    return json;
  }
  static Future<void> setUserproviderListing(String value) => _sharedPreferences.setString("_userproviderListing", jsonEncode(value));



  /// clear all data from shared pref
  static Future<void> clear() async => await _sharedPreferences.clear();

}