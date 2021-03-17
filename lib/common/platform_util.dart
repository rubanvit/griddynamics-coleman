import 'dart:io' show Platform;
import 'package:flutter/foundation.dart' show kIsWeb;

class PlatformUtil {

  static bool isAndroid()=> Platform.isAndroid;
  static bool isIOS()=> Platform.isIOS;
  static bool isWeb()=> kIsWeb;

}
