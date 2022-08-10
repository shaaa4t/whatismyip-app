import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';
import '../../../../core/error/exceptions.dart';
import '../../../../core/utils/app_strings.dart';
import '../models/myip_model.dart';

abstract class MyipLocalDataSource {
  Future<MyipModel> getLastMyip();
  Future<void> cacheMyip(MyipModel myipModel);
}

class MyipLocalDataSourceImpl implements MyipLocalDataSource {
  final SharedPreferences sharedPreferences;
  MyipLocalDataSourceImpl({required this.sharedPreferences});

  @override
  Future<MyipModel> getLastMyip() {
    final jsonString = sharedPreferences.getString(AppStrings.cachedMyip);
    if (jsonString != null) {
      final cacheMyip =
          Future.value(MyipModel.fromJson(json.decode(jsonString)));
      return cacheMyip;
    } else {
      throw CacheException();
    }
  }

  @override
  Future<void> cacheMyip(MyipModel myipModel) {
    return sharedPreferences.setString(
        AppStrings.cachedMyip, json.encode(myipModel));
  }
}
