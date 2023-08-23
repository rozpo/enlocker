import 'dart:io';

import 'package:args/command_runner.dart';
import 'package:cli_completion/cli_completion.dart';

import 'commands/decrypt.dart';
import 'commands/encrypt.dart';
import 'commands/update.dart';

void main(List<String> args) {
  final cli = EnlockerCli();
  cli.run(args).catchError(cli.handleExceptions);
}

class EnlockerCli extends CompletionCommandRunner {
  EnlockerCli()
      : super(
          'enlocker',
          'Encryption capabilities for your sensitive data.',
        ) {
    addCommand(DecryptCommand());
    addCommand(EncryptCommand());
    addCommand(UpdateCommand());
  }

  void handleExceptions(dynamic error) {
    if (error is! UsageException) {
      throw error;
    }
    print(error);
    exit(64);
  }
}
