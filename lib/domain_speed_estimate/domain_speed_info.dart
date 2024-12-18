class DomainSpeedInfo {
  String? domain;

  /// ms
  double? time;

  DomainSpeedInfo({this.domain, this.time});

  DomainSpeedInfo.fromJson(Map<String, dynamic> json) {
    domain = json['domain'];
    time = json['time'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['domain'] = domain;
    data['time'] = time;
    return data;
  }
}
