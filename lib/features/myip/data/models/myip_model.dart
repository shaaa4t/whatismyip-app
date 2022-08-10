import '../../domain/entities/myip.dart';

class MyipModel extends Myip {
  const MyipModel({
    required String ip,
    required String country,
    required String cc,
  }) : super(ip: ip, country: country, cc: cc);

  factory MyipModel.fromJson(Map<String, dynamic> json) => MyipModel(
        ip: json['ip'] as String,
        country: json['country'] as String,
        cc: json['cc'] as String,
      );

  Map<String, dynamic> toJson() => {
        'ip': ip,
        'country': country,
        'cc': cc,
      };
}
