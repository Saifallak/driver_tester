// Run : flutter drive --target=test_driver/JsonParseTest.dart
// Run : flutter drive --target=test_driver/JsonParseTest.dart
// Run : flutter drive --target=test_driver/JsonParseTest.dart
// Run : flutter drive --target=test_driver/JsonParseTest.dart
// Run : flutter drive --target=test_driver/JsonParseTest.dart

import 'dart:async';
import 'dart:io';

import 'package:flutter_driver/flutter_driver.dart';
import 'package:test/test.dart';

void main() {
  group("Json Show Testing", () {
    FlutterDriver driver; // Flutter Driver Var
    StreamSubscription<HttpRequest> httpStream; // Http Server

    setUpAll(() async {
      driver = await FlutterDriver.connect();
//      HttpServer.bind("localhost", 8899).then((server) {
//        httpStream = server.listen((HttpRequest request) {
//          request.response.write('{ "greeting": "bonjour" }');
//          request.response.close();
//        });
//      });
    });
    tearDownAll(() async {
      if (driver != null) {
        driver.close(); // Stop Driver
        httpStream?.cancel(); // Stop Http Server
      }
    });
    test("Json Showed Correctly?!", () async {
      // this expect return True
      SerializableFinder finder = find.text('howdie');
      driver.getText(finder, timeout: Duration(seconds: 10));
    });
  });
}
