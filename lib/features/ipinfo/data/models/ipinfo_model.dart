import '../../domain/entities/ipinfo.dart';

class IpinfoModel extends Ipinfo {
  const IpinfoModel({
    required super.status,
    required super.country,
    required super.countryCode,
    required super.region,
    required super.regionName,
    required super.city,
    required super.zip,
    required super.lat,
    required super.lon,
    required super.timezone,
    required super.isp,
    required super.org,
    required super.as,
    required super.query,
  });

  factory IpinfoModel.fromJson(Map<String, dynamic> json) => IpinfoModel(
        status: json['status'] as String,
        country: json['country'] as String,
        countryCode: json['countryCode'] as String,
        region: json['region'] as String,
        regionName: json['regionName'] as String,
        city: json['city'] as String,
        zip: json['zip'] as String,
        lat: (json['lat'] as num).toDouble(),
        lon: (json['lon'] as num).toDouble(),
        timezone: json['timezone'] as String,
        isp: json['isp'] as String,
        org: json['org'] as String,
        as: json['as'] as String,
        query: json['query'] as String,
      );

  Map<String, dynamic> toJson() => {
        'status': status,
        'country': country,
        'countryCode': countryCode,
        'region': region,
        'regionName': regionName,
        'city': city,
        'zip': zip,
        'lat': lat,
        'lon': lon,
        'timezone': timezone,
        'isp': isp,
        'org': org,
        'as': as,
        'query': query,
      };
}
