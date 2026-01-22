# Changelog

All notable changes to this project will be documented in this file.

The format is based on [Keep a Changelog](https://keepachangelog.com/en/1.1.0/),
and this project adheres to [Semantic Versioning](https://semver.org/spec/v2.0.0.html).


## [0.0.3] - 2026-01-22

> [!IMPORTANT]
> **Technical Note**: Previous versions had an incomplete iOS implementation due to missing native frameworks in the `ios/Frameworks` directory and a casing discrepancy in the method bridge. We apologize for these technical omissions which have now been fully resolved.

### Fixed
- Resolved iOS microphone input issue by adding explicit `AVAudioSession` configuration.
- Fixed critical method name mismatch between Dart and Swift.
- Added robust debug logging for iOS (NSLog) and Dart sides to track audio data flow.
- Optimized `SpeechService` listener logic in Dart for better performance and reliability.
- Fixed various linting issues across the codebase.

## [0.0.2] - 2026-01-14

### Changed
- Updated repository URL to `https://github.com/dhia-bechattaoui/vosk-flutter-service`.

## [0.0.1] - 2026-01-05

### Changed
- **BREAKING**: Renamed package to `vosk_flutter_service`.
- Migrated Android build to Kotlin DSL.
- Updated `record` dependency to v6 in example app.
- Enforced strict type safety (0 analysis issues).

### Fixed
- Resolved all analysis issues.
- Updated AGP/Gradle versions.

[0.0.3]: https://github.com/dhia-bechattaoui/vosk-flutter-service/compare/v0.0.3...HEAD
[0.0.2]: https://github.com/dhia-bechattaoui/vosk-flutter-service/compare/v0.0.1...v0.0.2
[0.0.1]: https://github.com/dhia-bechattaoui/vosk-flutter-service/releases/tag/v0.0.1