import 'package:args/command_runner.dart';

class EnlockerCli extends CommandRunner {
  EnlockerCli()
      : super(
          'enlocker',
          'Encryption capabilities for your sensitive data.',
        );
}
