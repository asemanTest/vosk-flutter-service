import 'dart:async';

import 'package:flutter/services.dart';
import 'recognizer.dart';
import 'vosk_flutter.dart';

/// Speech recognition service used to process audio input from the device's
/// microphone.
class SpeechService {
  /// Use [VoskFlutterPlugin.initSpeechService] to create an instance
  /// of [SpeechService].
  SpeechService(this._channel);

  final MethodChannel _channel;

  Stream<String>? _resultStream;
  Stream<String>? _partialResultStream;
  StreamSubscription<void>? _errorStreamSubscription;

  /// Start recognition.
  /// Use [onResult] and [onPartial] to get recognition results.
  Future<bool?> start({final Function? onRecognitionError}) {
    _errorStreamSubscription ??= EventChannel(
      'error_event_channel',
      const StandardMethodCodec(),
      _channel.binaryMessenger,
    ).receiveBroadcastStream().listen(null, onError: onRecognitionError);

    return _channel.invokeMethod<bool>('speechService.start');
  }

  /// Stop the speech service.
  Future<void> stop() async {
    await _channel.invokeMethod('speechService.stop');
  }

  /// Set the pause state of the speech service.
  Future<void> setPause({required final bool paused}) async {
    await _channel.invokeMethod('speechService.setPause', {'paused': paused});
  }

  /// Reset recognition.
  /// See [Recognizer.reset].
  Future<void> reset() async {
    await _channel.invokeMethod('speechService.reset');
  }

  /// Cancel recognition.
  Future<void> cancel() async {
    await _errorStreamSubscription?.cancel();
    await _channel.invokeMethod('speechService.cancel');
  }

  Future<void> dispose() async {
    await _errorStreamSubscription?.cancel();
    await _channel.invokeMethod<void>('speechService.destroy');
  }

  /// Get stream with voice recognition results.
  Stream<String> onResult() => _resultStream ??= EventChannel(
    'result_event_channel',
    const StandardMethodCodec(),
    _channel.binaryMessenger,
  ).receiveBroadcastStream().map((final result) => result.toString());

  /// Get stream with voice recognition partial results.
  Stream<String> onPartial() => _partialResultStream ??= EventChannel(
    'partial_event_channel',
    const StandardMethodCodec(),
    _channel.binaryMessenger,
  ).receiveBroadcastStream().map((final result) => result.toString());
}
