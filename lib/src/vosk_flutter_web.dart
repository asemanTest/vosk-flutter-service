import 'dart:async';

import 'package:flutter/services.dart';
import 'package:flutter_web_plugins/flutter_web_plugins.dart';

/// A web implementation of the VoskFlutterPlugin.
class VoskFlutterPlugin {
  /// Registers this class as the default instance of [VoskFlutterPlugin].
  static void registerWith(final Registrar registrar) {
    final channel = MethodChannel(
      'vosk_flutter',
      const StandardMethodCodec(),
      registrar,
    );
    final plugin = VoskFlutterPlugin();
    channel.setMethodCallHandler(plugin.handleMethodCall);
  }

  /// Handles method calls over the MethodChannel of this plugin.
  /// Note: Check the "federated" architecture for a better way to do this.
  Future<dynamic> handleMethodCall(final MethodCall call) async {
    throw UnsupportedError('Web support is currently a stub.');
  }
}
