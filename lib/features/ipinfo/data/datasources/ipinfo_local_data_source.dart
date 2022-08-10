import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';
import '../../../../core/error/exceptions.dart';
import '../../../../core/utils/app_strings.dart';
import '../models/ipinfo_model.dart';

abstract class IpinfoLocalDataSource {
  Future<IpinfoModel> getLastIpinfo();
  Future<void> cacheIpinfo(IpinfoModel ipinfoModel);
}

class IpinfoLocalDataSourceImpl implements IpinfoLocalDataSource {
  final SharedPreferences sharedPreferences;
  IpinfoLocalDataSourceImpl({required this.sharedPreferences});

  @override
  Future<IpinfoModel> getLastIpinfo() {
    final jsonString = sharedPreferences.getString(AppStrings.cachedIpinfo);

    if (jsonString != null) {
      final cacheMyip =
          Future.value(IpinfoModel.fromJson(json.decode(jsonString)));
      return cacheMyip;
    } else {
      throw CacheException();
    }
  }

  @override
  Future<void> cacheIpinfo(IpinfoModel ipinfoModel) {
    return sharedPreferences.setString(
        AppStrings.cachedIpinfo, json.encode(ipinfoModel));
  }
}
