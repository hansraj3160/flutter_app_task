import 'dart:convert';
import 'dart:io';
import 'package:flutter/foundation.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
 

class ApiClient extends GetxService {
  String appBaseUrl;
  final int timeoutInSeconds = 30;

 
  late Map<String, String> _mainHeaders;

  ApiClient({required this.appBaseUrl}) {
    
    if (!kIsWeb && Platform.isAndroid) {
      if (appBaseUrl.contains('localhost')) {
        appBaseUrl = appBaseUrl.replaceFirst('localhost', '10.244.178.60');
      }
    }
    
 
    updateHeader();
  }

  void updateHeader() {
    _mainHeaders = {
      'Content-Type': 'application/json; charset=UTF-8',
 
    };
  }
 
  Future<Response> getData(String uri) async {
    try {
      debugPrint('====> API Call: $appBaseUrl$uri');
      
      http.Response response = await http.get(
        Uri.parse(appBaseUrl + uri),
        headers: _mainHeaders,
      ).timeout(Duration(seconds: timeoutInSeconds));

      return handleResponse(response, uri);
    } catch (e) {
      debugPrint('====> API Error: $e');
      return const Response(statusCode: 1, statusText: 'Connection failed');
    }
  }

  
  Response handleResponse(http.Response response, String uri) {
    dynamic body;
    try {
      body = jsonDecode(response.body);
    } catch (_) {}

    Response response0 = Response(
      body: body ?? response.body,
      bodyString: response.body.toString(),
      headers: response.headers,
      statusCode: response.statusCode,
      statusText: response.reasonPhrase,
    );

    if (response0.statusCode != 200 && response0.body != null && response0.body is! String) {
      if (response0.body.toString().startsWith('{errors: [{code:')) {
        
        response0 = Response(
            statusCode: response0.statusCode,
            body: response0.body,
            statusText: "Error occurred");
      } else if (response0.body.toString().startsWith('{message')) {
        response0 = Response(
            statusCode: response0.statusCode,
            body: response0.body,
            statusText: response0.body['message']);
      }
    }
    
    debugPrint('====> API Response: [${response0.statusCode}] $uri');
    return response0;
  }
}