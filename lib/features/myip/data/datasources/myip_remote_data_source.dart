import '../../../../core/api/api_consumer.dart';
import '../../../../core/api/end_points.dart';
import '../models/myip_model.dart';

abstract class MyipRemoteDataSource {
  Future<MyipModel> getMyip();
}

class MyipRemoteDataSourceImpl implements MyipRemoteDataSource {
  ApiConsumer apiConsumer;
  MyipRemoteDataSourceImpl({required this.apiConsumer});

  @override
  Future<MyipModel> getMyip() async {
    final response = await apiConsumer.get(Endpoints.ipLessInfo);
    return MyipModel.fromJson(response);
  }
}
