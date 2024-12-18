abstract class Downloader {
  Future<double?> download({required String domain});
  String generateUrl(String domain);
}
