import 'package:domain_speed_estimate/domain_speed_estimate/downloader.dart';
import 'package:http/http.dart' as http;

class HttpDownloader implements Downloader {
  @override
  Future<double?> download({required String domain}) async {
    String url = generateUrl(domain);
    final stopwatch = Stopwatch()..start();

    try {
      final response = await http.get(Uri.parse(url));
      stopwatch.stop();

      if (response.statusCode != 200) {
        return null;
      }
      return stopwatch.elapsedMilliseconds.toDouble();
    } catch (e) {
      rethrow;
    } finally {
      stopwatch.stop();
    }
  }

  @override
  String generateUrl(String domain) {
    return 'https://jsonplaceholder.typicode.com/';
    // return 'https://$domain/test-img';
  }
}
