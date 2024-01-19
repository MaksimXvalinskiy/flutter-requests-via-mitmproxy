import 'package:flutter/material.dart';

class AppImages {
  final String _defaultPath = 'assets/images/';

  String _name(String name) => _defaultPath + name;

  // Example
  // Image verificationHeader({double? width, double? height, BoxFit? fit}) =>
  //     Image.asset(_name('verification_header.png'),
  //         width: width, height: height, fit: fit ?? BoxFit.cover);

  Image emptyProduct({double? width, double? height, BoxFit? fit}) =>
      Image.asset(
        _name('empty_product.png'),
        width: width,
        height: height,
        fit: fit ?? BoxFit.contain,
      );
}
