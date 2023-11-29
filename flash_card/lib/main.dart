import 'package:device_preview/device_preview.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flash_card/presentation/router/app.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:flash_card/secret.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Supabase.initialize(
    url: supabaseURL,
    anonKey: supabaseAnonKey,
  );

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
