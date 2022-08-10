import '../../../../core/error/exceptions.dart';
import '../../../../core/network/network_info.dart';
import '../datasources/myip_local_data_source.dart';
import '../datasources/myip_remote_data_source.dart';
import '../../domain/entities/myip.dart';
import '../../../../core/error/failures.dart';
import 'package:dartz/dartz.dart';
import '../../domain/repositories/myip_repository.dart';

class MyipRepositoryImpl implements MyipRepository {
  final NetworkInfo networkInfo;
  final MyipLocalDataSource myipLocalDataSource;
  final MyipRemoteDataSource myipRemoteDataSource;

  MyipRepositoryImpl({
    required this.networkInfo,
    required this.myipLocalDataSource,
    required this.myipRemoteDataSource,
  });

  @override
  Future<Either<Failure, Myip>> getMyip() async {
    if (await networkInfo.isConnected) {
      //Get data from API
      try {
        final remoteMyip = await myipRemoteDataSource.getMyip();
        myipLocalDataSource.cacheMyip(remoteMyip);
        return Right(remoteMyip);
      } on ServerException {
        return Left(ServerFailure());
      }
    } else {
      //Get data from Cache
      try {
        final cacheMyip = await myipLocalDataSource.getLastMyip();
        return Right(cacheMyip);
      } on CacheException {
        return Left(CacheFailure());
      }
    }
  }
}
