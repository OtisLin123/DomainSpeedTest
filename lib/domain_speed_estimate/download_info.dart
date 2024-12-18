class DownloadInfo {
  String? domain;

  /// ms
  double? time;

  DownloadInfo({this.domain, this.time});

  DownloadInfo.fromJson(Map<String, dynamic> json) {
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
