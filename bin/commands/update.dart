import 'dart:async';
import 'dart:io';

import 'package:args/command_runner.dart';

class UpdateCommand extends Command {
  @override
  String get name => 'update';

  @override
  String get description => 'Update to the latest version';

  @override
  List<String> get aliases => ['upgrade'];

  @override
  FutureOr? run() {
    final path = '.';

    if (_isCorrectDirectory(path) == false) {
      throw usageException(
          "Invalid root directory of enlocker, path = '$path'");
    }

    var cmd = Process.runSync(
        'dart', ['pub', 'global', 'activate', '--source', 'path', path]);

    if (cmd.exitCode == 0) {
      print(cmd.stdout);
    } else {
      print(cmd.stderr);
    }
  }

  bool _isCorrectDirectory(String path) {
    bool result = false;
    final pubspecFile = File('$path/pubspec.yaml');

    try {
      String value = pubspecFile.readAsStringSync();
      if (value.contains('name: enlocker\n')) {
        result = true;
      }
    } on FileSystemException catch (_) {}

    return result;
  }
}
