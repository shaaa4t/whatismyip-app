import 'package:dartz/dartz.dart';
import '../../../../core/error/failures.dart';
import '../entities/myip.dart';

abstract class MyipRepository {
  Future<Either<Failure, Myip>> getMyip();
}
