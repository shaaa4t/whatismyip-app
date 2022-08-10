import '../../../../core/error/failures.dart';
import 'package:dartz/dartz.dart';
import '../../../../core/usecases/usecase.dart';
import '../entities/myip.dart';
import '../repositories/myip_repository.dart';

class GetMyipUseCase implements UseCase<Myip, NoParams> {
  final MyipRepository myipRepository;
  GetMyipUseCase({required this.myipRepository});

  @override
  Future<Either<Failure, Myip>> call(NoParams params) =>
      myipRepository.getMyip();
}
