import 'package:package_info_plus/package_info_plus.dart';

Future<String> getAppVersion() async {
  final appInfo = await PackageInfo.fromPlatform();
  String appVirsion = appInfo.version;
  return appVirsion;
}
