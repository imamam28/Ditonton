import 'dart:developer';
import 'dart:io';

import 'package:flutter/services.dart';
import 'package:http/io_client.dart';

class NetworkUtils {
  static Future<SecurityContext> get globalContext async {
    try {
      final sslCert = await rootBundle.load('certificates/certificate.pem');
      SecurityContext securityContext =
          SecurityContext(withTrustedRoots: false);
      securityContext.setTrustedCertificatesBytes(sslCert.buffer.asInt8List());
      return securityContext;
    } catch (e) {
      log(e.toString());
      throw e;
    }
  }

  static Future<IOClient> get ioClient async {
    HttpClient client = HttpClient(context: await globalContext);
    client.badCertificateCallback =
        (X509Certificate cert, String host, int port) => false;
    return IOClient(client);
  }
}
