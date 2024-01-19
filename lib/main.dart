import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:native_flutter_proxy/native_proxy_reader.dart';
import 'package:proxy_interception_requests/features/view/home/home_screen.dart';
import 'package:proxy_interception_requests/network/my_http_overrides.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  if (!kReleaseMode) {
    ProxySetting settings = await NativeProxyReader.proxySetting;
    var certFile = await rootBundle.load(
      'assets/certificates/mitmproxy-ca-cert',
    );
    if (settings.host != null && settings.port != null) {
      HttpOverrides.global = MyHttpOverrides(
        host: settings.host!,
        port: settings.port!,
        certFile: certFile,
      );
    }
  }

  ///If you don't want to use a certificate or use a vpn
  // if (!kReleaseMode) {
  //   ProxySetting settings = await NativeProxyReader.proxySetting;
  //   HttpOverrides.global = MyHttpOverrides(
  //     host: settings.host,
  //     port: settings.port,
  //   );
  // }
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const HomeScreen(),
    );
  }
}
