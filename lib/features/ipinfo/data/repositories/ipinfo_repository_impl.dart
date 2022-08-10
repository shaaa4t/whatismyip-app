import '../../../../core/error/exceptions.dart';
import '../../../../core/network/network_info.dart';
import '../datasources/ipinfo_local_data_source.dart';
import '../datasources/ipinfo_remote_data_source.dart';
import '../../domain/entities/ipinfo.dart';
import '../../domain/repositories/ipinfo_repository.dart';
import '../../../../core/error/failures.dart';
import 'package:dartz/dartz.dart';

class IpinfoRepositoryImpl implements IpinfoRepository {
  final NetworkInfo networkInfo;
  final IpinfoLocalDataSource ipinfoLocalDataSource;
  final IpinfoRemoteDataSource ipinfoRemoteDataSource;

  IpinfoRepositoryImpl({
    required this.networkInfo,
    required this.ipinfoLocalDataSource,
    required this.ipinfoRemoteDataSource,
  });

  @override
  Future<Either<Failure, Ipinfo>> getIpinfo({required String ip}) async {
    if (await networkInfo.isConnected) {
      //Get data from API
      try {
        final remoteIpinfo = await ipinfoRemoteDataSource.getIpinfo(ip: ip);
        ipinfoLocalDataSource.cacheIpinfo(remoteIpinfo);
        return Right(remoteIpinfo);
      } on ServerException {
        return Left(ServerFailure());
      }
    } else {
      //Get data from Cache
      try {
        final cacheIpinfo = await ipinfoLocalDataSource.getLastIpinfo();
        return Right(cacheIpinfo);
      } on CacheException {
        return Left(CacheFailure());
      }
    }
  }
}
