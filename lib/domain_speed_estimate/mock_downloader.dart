import 'dart:math';

import 'package:domain_speed_estimate/domain_speed_estimate/downloader.dart';

class MockDownloader implements Downloader {
  @override
  Future<double?> download({required String domain}) async {
    double randomSeconds = 1000 + Random().nextInt(4001).toDouble();
    return randomSeconds.toDouble();
  }

  @override
  String generateUrl(String domain) {
    return 'https://$domain/test-img';
  }
}
