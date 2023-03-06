import 'package:flutter/foundation.dart';
import 'package:tftp/tftp.dart';

void main() {
  TFtpServer.bind("127.0.0.1", port: 6699).then((server) {
    server.listen((socket) {
      socket.listen(onRead: (file, onProcess) {
        onProcess(progressCallback: (count, total) {
          if (kDebugMode) {
            print("$count/$total");
          }
        });
        return file;
      }, onWrite: (file, doTransform) {
        doTransform(overwrite: false);
        return file;
      });
    });
  });
}
