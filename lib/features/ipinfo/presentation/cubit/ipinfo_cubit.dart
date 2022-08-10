import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../core/error/failures.dart';
import '../../../../core/utils/app_strings.dart';
import '../../domain/usecases/get_ipinfo_usecase.dart';
import '../../domain/entities/ipinfo.dart';
part 'ipinfo_state.dart';

class IpinfoCubit extends Cubit<IpinfoState> {
  final GetIpinfoUseCase getIpinfoUseCase;
  IpinfoCubit({required this.getIpinfoUseCase}) : super(IpinfoInitial());

  Future<void> getIpinfo({required String ip}) async {
    emit(IpinfoIsLoading());
    Either<Failure, Ipinfo> response = await getIpinfoUseCase(ip);
    emit(response.fold((failure) => IpinfoError(msg: _mapFailureToMsg(failure)),
        (ipinfo) => IpinfoLoaded(ipinfo: ipinfo)));
  }

  String _mapFailureToMsg(Failure failure) {
    switch (failure.runtimeType) {
      case ServerFailure:
        return AppStrings.serverFailure;
      case CacheFailure:
        return AppStrings.cacheFailure;

      default:
        return AppStrings.unexpectedError;
    }
  }
}
