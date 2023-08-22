import 'dart:async';
import 'dart:io';

import 'package:args/command_runner.dart';

class UpdateCommand extends Command {
  @override
  String get name => 'update';

  @override
  String get description => 'Update to the latest version';

  @override
  FutureOr? run() {
    var cmd = Process.runSync(
        'dart', ['pub', 'global', 'activate', '--source', 'path', '.']);

    if (cmd.exitCode == 0) {
      print(cmd.stdout);
    } else {
      print(cmd.stderr);
    }
  }
}
