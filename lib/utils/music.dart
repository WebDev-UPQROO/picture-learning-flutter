import 'dart:typed_data';

import 'package:flutter/services.dart';

Future<Uint8List> assetToMusic(String url) async {
  ByteData bytes = await rootBundle.load(url);
  Uint8List soundbytes = bytes.buffer.asUint8List(
    bytes.offsetInBytes,
    bytes.lengthInBytes,
  );

  return soundbytes;
}
