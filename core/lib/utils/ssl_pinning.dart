import 'dart:io';

import 'package:flutter/services.dart';
import 'package:http/http.dart' as http;
import 'package:http/io_client.dart';

class HttpSSLPinning {
  static Future<http.Client> get _instance async =>
      _clientInstance ??= await Shared.createLEClient();
  static http.Client? _clientInstance;
  static http.Client get client => _clientInstance ?? http.Client();
  static Future<void> init() async {
    _clientInstance = await _instance;
  }
}

class Shared {
  static Future<HttpClient> customHttpClient({
    bool isTestMode = false,
  }) async {
    SecurityContext context = SecurityContext(withTrustedRoots: false);
    try {
      List<int> bytes = [];
      bytes = (await rootBundle.load('assets/certificates.pem')).buffer.asUint8List();
      context.setTrustedCertificatesBytes(bytes);
    } on TlsException catch (e) {
      if (e.osError?.message != null && e.osError!.message.contains('CERT_ALREADY_IN_HASH_TABLE')) {
      } else {
        rethrow;
      }
    } catch (e) {
      rethrow;
    }
    HttpClient httpClient = HttpClient(context: context);
    httpClient.badCertificateCallback = (X509Certificate cert, String host, int port) => false;

    return httpClient;
  }

  static Future<http.Client> createLEClient({bool isTestMode = false}) async {
    IOClient client = IOClient(await Shared.customHttpClient());
    return client;
  }
}