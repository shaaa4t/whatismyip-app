import '../../../../core/api/api_consumer.dart';
import '../../../../core/api/end_points.dart';
import '../models/ipinfo_model.dart';

abstract class IpinfoRemoteDataSource {
  Future<IpinfoModel> getIpinfo({required String ip});
}

class IpinfoRemoteDataSourceImpl implements IpinfoRemoteDataSource {
  ApiConsumer apiConsumer;
  IpinfoRemoteDataSourceImpl({required this.apiConsumer});

  @override
  Future<IpinfoModel> getIpinfo({required String ip}) async {
    final response = await apiConsumer.get('${Endpoints.ipInfo}$ip');
    return IpinfoModel.fromJson(response);
  }
}
