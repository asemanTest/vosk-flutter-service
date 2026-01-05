// Explanation: This file is a CLI entry point and print statements are intended
// for user output.
// ignore_for_file: avoid_print

import 'dart:async';

import 'package:args/args.dart';
import '../model_loader.dart';

void main(final List<String> arguments) {
  // Explanation: We only need to check validation from parse even if results
  // are unused.
  ArgParser()
    ..addOption('list-models')
    ..parse(arguments);

  final modelLoader = ModelLoader();
  print('Available models:');
  unawaited(
    modelLoader.loadModelsList().then((final models) {
      for (final model in models) {
        print(model.name);
      }
    }),
  );
}
