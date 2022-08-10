part of 'ipinfo_cubit.dart';

abstract class IpinfoState extends Equatable {
  const IpinfoState();

  @override
  List<Object> get props => [];
}

class IpinfoInitial extends IpinfoState {}

class IpinfoIsLoading extends IpinfoState {}

class IpinfoLoaded extends IpinfoState {
  final Ipinfo ipinfo;
  const IpinfoLoaded({required this.ipinfo});

  @override
  List<Object> get props => [ipinfo];
}

class IpinfoError extends IpinfoState {
  final String msg;
  const IpinfoError({required this.msg});

  @override
  List<Object> get props => [msg];
}
