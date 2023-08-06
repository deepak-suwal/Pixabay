import 'package:injectable/injectable.dart';

@LazySingleton()
class AppConfig {
  late String appName;
  late String baseUrl;

  String getBaseUrl() => baseUrl;

  void initialize({
    required String appName,
    required String baseUrl,
  }) {
    this.appName = appName;
    this.baseUrl = baseUrl;
  }
}
