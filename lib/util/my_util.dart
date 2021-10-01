import 'package:package_info/package_info.dart';

class MyUtil {
  static getAppInfo() {
    PackageInfo _packageInfo = PackageInfo(
      appName: 'Unknown',
      packageName: 'Unknown',
      version: 'Unknown',
      buildNumber: 'Unknown',
    );

  }
}