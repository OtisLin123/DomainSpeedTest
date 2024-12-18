import 'package:domain_speed_estimate/domain_speed_estimate/domain_speed_info.dart';
import 'package:domain_speed_estimate/domain_speed_estimate/downloader.dart';
import 'package:flutter/foundation.dart';

class DomainSpeedEstimateController {
  Downloader? downloader;

  final ValueNotifier<List<DomainSpeedInfo>> infos = ValueNotifier([]);

  DomainSpeedEstimateController({
    required this.downloader,
  });

  Future<double?> downloadImg({required String domain}) async {
    double? time = await downloader?.download(domain: domain);
    return time;
  }

  void set({required DomainSpeedInfo data}) {
    final updatedList = List<DomainSpeedInfo>.from(infos.value);

    final existingIndex =
        updatedList.indexWhere((info) => info.domain == data.domain);
    if (existingIndex != -1) {
      updatedList[existingIndex] = data;
    } else {
      updatedList.add(data);
    }

    updatedList.sort((a, b) =>
        (a.time ?? double.infinity).compareTo(b.time ?? double.infinity));

    infos.value = updatedList;
  }

  DomainSpeedInfo? getFastest() {
    return infos.value.firstOrNull;
  }

  List<DomainSpeedInfo> get() {
    return infos.value;
  }
}
