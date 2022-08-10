import 'package:equatable/equatable.dart';

class Myip extends Equatable {
  final String ip;
  final String country;
  final String cc;

  const Myip({
    required this.ip,
    required this.country,
    required this.cc,
  });

  @override
  List<Object?> get props => [ip, country, cc];
}
