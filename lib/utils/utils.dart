import 'package:flutter/services.dart';

class Utils{
  static void hideStatusbar(){
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.manual, overlays: [SystemUiOverlay.bottom]);
  }
}