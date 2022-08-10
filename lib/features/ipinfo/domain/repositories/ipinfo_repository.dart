import 'package:dartz/dartz.dart';
import '../../../../core/error/failures.dart';
import '../entities/ipinfo.dart';

abstract class IpinfoRepository {
  Future<Either<Failure, Ipinfo>> getIpinfo({required String ip});
}
