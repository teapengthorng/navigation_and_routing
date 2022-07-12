import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';
import 'package:navigation_and_routing/platform/android_platform.dart';
import 'package:navigation_and_routing/platform/default_platform.dart';
import 'package:navigation_and_routing/platform/iphone_platform.dart';
import 'package:navigation_and_routing/platform/linux_platform.dart';
import 'package:navigation_and_routing/platform/web_platform.dart';
import 'package:navigation_and_routing/platform/window_platform.dart';

class homePage1 extends StatefulWidget {
  const homePage1({ Key? key }) : super(key: key);

  @override
  State<homePage1> createState() => _homePage1State();
}

class _homePage1State extends State<homePage1> {
 final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    final screen = MediaQuery.of(context).size;
     if (!kIsWeb && Platform.isLinux)
     {
     return LinuxPlatform(screen.width,screen.height);
     } else if (!kIsWeb && Platform.isWindows) {
     return WindowPlatform(screen.width,screen.height);
     } else if (!kIsWeb && Platform.isIOS) {
      return IphonePlatform();
     } else if (!kIsWeb && Platform.isAndroid) {
     return AndroidPlatform();
     } else if (kIsWeb) {
     return  WebPlatForm();
     }
     else {
     return  DefaultPlatForm();
     }
  }
}

