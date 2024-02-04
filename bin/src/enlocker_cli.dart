import 'dart:io';

import 'package:args/command_runner.dart';

import 'commands/md5.dart';

class EnlockerCli extends CommandRunner {
  EnlockerCli()
      : super(
          'enlocker',
          'Encryption capabilities for your sensitive data.',
        ) {
    addCommand(Md5Command());
  }

  void handleExceptions(dynamic error) {
    if (error is! UsageException) {
      throw error;
    }
    print(error);
    exit(64);
  }
}
