import 'package:dartz/dartz.dart';

import '../../../../core/error/failures.dart';
import '../../../../core/usecases/usecase.dart';
import '../entities/ipinfo.dart';
import '../repositories/ipinfo_repository.dart';

class GetIpinfoUseCase implements UseCase<Ipinfo, String> {
  final IpinfoRepository ipinfoRepository;
  GetIpinfoUseCase({required this.ipinfoRepository});

  @override
  Future<Either<Failure, Ipinfo>> call(String ip) {
    return ipinfoRepository.getIpinfo(ip: ip);
  }
}
