import 'dart:convert';

import 'package:online_learning_app/common/entities/entities.dart';
import 'package:online_learning_app/constants/constants.dart';
import 'package:shared_preferences/shared_preferences.dart';

class StorageService {
  late SharedPreferences _pref;
  Future<StorageService> initSharedPreference() async {
    _pref = await SharedPreferences.getInstance();
    return this;
  }

  Future<bool> setBool(String key, bool value) async {
    return await _pref.setBool(key, value);
  }

  Future<bool> setString(String key, String value) async {
    return await _pref.setString(key, value);
  }

  bool getDeviceFirstOpen() {
    return _pref.getBool(AppConstants.STORAGE_DEVICE_FIRST_TIME_OPEN) ?? false;
  }

  bool getIsUserLoggedIn() {
    return _pref.getString(AppConstants.STORAGE_USER_TOKEN_KEY) == null
        ? false
        : true;
  }

  Future<bool> removeKey(String key) {
    return _pref.remove(key);
  }

  UserItem? getUserProfile() {
    var offlineProfile =
        _pref.getString(AppConstants.STORAGE_USER_PROFILE_KEY) ?? "";
    print(
        "The shared data is ${_pref.getString(AppConstants.STORAGE_USER_PROFILE_KEY)}");
    print("The offline variable is returning $offlineProfile");
    if (offlineProfile.isNotEmpty) {
      return UserItem.fromJson(json.decode(offlineProfile));
    }
    return null;
  }

  String getUserToken() {
    return _pref.getString(AppConstants.STORAGE_USER_TOKEN_KEY) ?? "";
  }
}
