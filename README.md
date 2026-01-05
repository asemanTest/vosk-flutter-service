# Vosk Flutter Service

[![pub package](https://img.shields.io/pub/v/vosk_flutter_service.svg)](https://pub.dev/packages/vosk_flutter_service)
[![style: very good analysis](https://img.shields.io/badge/style-very_good_analysis-B22C89.svg)](https://pub.dev/packages/very_good_analysis)

Flutter plugin for offline speech recognition using the Vosk toolkit.

> **Acknowledgement**: This package is a modernized fork of the original [vosk_flutter](https://pub.dev/packages/vosk_flutter) plugin, updated to support the latest Flutter/Dart SDKs, maintain strict type safety, and expand platform support (iOS/macOS).

## Platform Support

| Android | iOS | MacOS | Web | Linux | Windows |
| :-----: | :-: | :---: | :-: | :---: | :----: |
|   ✔    | ✔   |  ✔   | 🚧   |  ✔   |    ✔   |

> **Note**: Web support is currently a stub for platform compatibility. Full WASM implementation is in progress.

## Installation

### Dependencies
Add `vosk_flutter_service` to your `pubspec.yaml`:
```yaml
dependencies:
  vosk_flutter_service: ^0.0.1+1
```

### iOS Configuration
1.  **Framework**: You must explicitly provide the `LibVosk.xcframework`. 
    *   Download it from the official Vosk releases or build it.
    *   Place `LibVosk.xcframework` inside `ios/Frameworks`.
2.  **Permissions**: Add the microphone usage description to `Info.plist`:
    ```xml
    <key>NSMicrophoneUsageDescription</key>
    <string>This app needs access to the microphone for speech recognition.</string>
    ```

### Android Configuration
Add ProGuard rules to `android/app/proguard-rules.pro`:
```properties
-keep class com.sun.jna.* { *; }
-keepclassmembers class * extends com.sun.jna.* { public *; }
```

Add microphone permission to `AndroidManifest.xml`:
```xml
<uses-permission android:name="android.permission.RECORD_AUDIO" />
```

## Usage

### 1. Load Model
Load the model from assets or storage.
```dart
final vosk = VoskFlutterPlugin(); // Use default constructor
final modelPath = await ModelLoader().loadFromAssets('assets/models/vosk-model-small-en-us-0.15.zip');
final model = await vosk.createModel(modelPath);
```

### 2. Create Recognizer
```dart
final recognizer = await vosk.createRecognizer(
  model: model,
  sampleRate: 16000,
);
```

### 3. Recognize Audio
Feed audio data (PCM 16-bit mono) to the recognizer:
```dart
await recognizer.acceptWaveformBytes(audioBytes);
print(await recognizer.getFinalResult());
```

### 4. Continuous Microphone Recognition (Android/iOS)
```dart
final speechService = await vosk.initSpeechService(recognizer);
await speechService.start();

speechService.onPartial().listen((partial) => print(partial));
speechService.onResult().listen((result) => print(result));
```

For **Desktop (Linux/Windows/macOS)**, use a separate package (like `record` or `flutter_sound`) to capture audio stream and feed it to `acceptWaveformBytes`.
