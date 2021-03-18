import 'dart:io' show Platform;
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart' show kIsWeb;

class PlatformUtil {
  static bool isAndroid() => Platform.isAndroid;

  static bool isIOS() => Platform.isIOS;

  static bool isWeb() => kIsWeb;


  /*
  * screens size in flutter app
    Android 			  392   * 737
    iPhone   			  390   * 844
    Web desktop		  1337  * 670
    iPad				    1194  * 834
    Android tab		  1280  * 844
  * */
  static bool isWideScreen(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    final screenWidth = screenSize.width;
    print('Screen width is $screenWidth');
    final screenHeight = screenSize.height;
    print('Screen height is ${screenSize.height}');
    return screenWidth >= 600 && screenHeight >= 600;
  }
}
