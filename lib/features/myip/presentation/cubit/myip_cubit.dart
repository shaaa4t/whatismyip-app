import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../core/error/failures.dart';
import '../../../../core/usecases/usecase.dart';
import '../../../../core/utils/app_strings.dart';
import '../../domain/usecases/get_myip_usecase.dart';
import '../../domain/entities/myip.dart';
part 'myip_state.dart';

class MyipCubit extends Cubit<MyipState> {
  final GetMyipUseCase getMyipUseCase;
  MyipCubit({required this.getMyipUseCase}) : super(MyipInitial());

  Myip? myip;

  Future<void> getMyip() async {
    emit(MyipIsLoading());
    Either<Failure, Myip> response = await getMyipUseCase(NoParams());
    emit(response.fold((failure) => MyipError(msg: _mapFailureToMsg(failure)),
        (myip) {
      this.myip = myip;
      return MyipLoaded(myip: myip);
    }));
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
