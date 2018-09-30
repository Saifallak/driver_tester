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
      HttpServer.bind("localhost", 8899).then((server) {
        httpStream = server.listen((HttpRequest request) {
          request.response.write('{ "greeting": "bonjour" }');
          request.response.close();
        });
      });
    });
    tearDownAll(() async {
      if (driver != null) {
        driver.close(); // Stop Driver
        httpStream.cancel(); // Stop Http Server
      }
    });
    test("Json Showed Correctly?!", () async {
      // this expect return True
      expect(
          await driver.getRenderTree().then((x) {
            return x.tree.contains("greeting");
          }),
          true);

//      try {
//        await driver.waitForAbsent(
//            await driver.getRenderTree().then((x) {
//              print(x.tree.contains("greeting"));
//            }),
//            timeout: const Duration(seconds: 5));
//        fail('expected DriverError');
//      } on DriverError catch (error) {
//        expect(
//            error.message, contains('Timeout while executing waitForAbsent'));
//      }
    });
  });
}
