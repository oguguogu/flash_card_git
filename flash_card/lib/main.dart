import 'package:device_preview/device_preview.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flash_card/presentation/router/app.dart';

void main() {
  const app = App();
  const scope = ProviderScope(child: app);

  if (kIsWeb) {
    final preview = DevicePreview(
      enabled: true,
      builder: (context) => scope,
    );
    runApp(preview);
  } else {
    runApp(scope);
  }
}
