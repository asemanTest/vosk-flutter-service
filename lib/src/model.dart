import 'dart:ffi';

import 'generated_vosk_bindings.dart';
import 'vosk_flutter.dart';

/// Class representing the language model loaded by the plugin.
class Model {
  /// Use [VoskFlutterPlugin.createModel] to create a [Model] instance.
  Model(this.path, [this.modelPointer, this._voskLibrary]);

  /// Location of this model in the file system.
  final String path;

  /// Pointer to a native model object.
  final Pointer<VoskModel>? modelPointer;

  final VoskLibrary? _voskLibrary;

  /// Free all model resources.
  void dispose() {
    if (_voskLibrary != null) {
      _voskLibrary.vosk_model_free(modelPointer!);
    }
  }

  // Explanation: The toString method returns a string from the native library
  // which might look like a runtimeType but is actually the string value.
  @override
  String toString() => modelPointer == null
      ? 'Model(path: $path)'
      : 'Model(path: $path, pointer: $modelPointer)';
}
