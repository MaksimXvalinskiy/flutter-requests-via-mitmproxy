import 'dart:developer';
import 'dart:io';
import 'dart:typed_data';

import 'package:flutter/services.dart';

class MyHttpOverrides extends HttpOverrides {
  final String host;
  final int port;
  final ByteData certFile;
  MyHttpOverrides({
    required this.host,
    required this.port,
    required this.certFile,
  });
  @override
  HttpClient createHttpClient(SecurityContext? context) {
    var cert = certFile.buffer.asUint8List();
    SecurityContext securityContext = SecurityContext();
    securityContext.setTrustedCertificatesBytes(cert);
    return super.createHttpClient(securityContext)
      ..findProxy = (Uri url) {
        log(host);
        log(port.toString());
        return 'PROXY $host:$port';
      }
      ..badCertificateCallback =
          (X509Certificate cert, String host, int port) => false;
  }
}

///If you don't want to use a certificate or use a vpn
// class MyHttpOverrides extends HttpOverrides {
//   final String? host;
//   final int? port;
//   MyHttpOverrides({
//     required this.host,
//     required this.port,
//   });
//   @override
//   HttpClient createHttpClient(SecurityContext? context) {
//     HttpClient httpClient = super.createHttpClient(context);
//
//     httpClient.badCertificateCallback =
//         (X509Certificate cert, String host, int port) => true;
//     if (host != null && port != null) {
//       httpClient.findProxy = (Uri url) {
//         return 'PROXY $host:$port';
//       };
//     }
//     return httpClient;
//   }
// }
