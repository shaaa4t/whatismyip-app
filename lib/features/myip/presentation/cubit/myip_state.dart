part of 'myip_cubit.dart';

abstract class MyipState extends Equatable {
  const MyipState();

  @override
  List<Object> get props => [];
}

class MyipInitial extends MyipState {}

class MyipIsLoading extends MyipState {}

class MyipLoaded extends MyipState {
  final Myip myip;
  const MyipLoaded({required this.myip});

  @override
  List<Object> get props => [myip];
}

class MyipError extends MyipState {
  final String msg;
  const MyipError({required this.msg});

  @override
  List<Object> get props => [msg];
}
