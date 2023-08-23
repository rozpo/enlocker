import 'package:args/command_runner.dart';
import 'package:dcli/dcli.dart';

abstract class CryptCommand extends Command {
  String getKeyFromUser() {
    return ask(
      'Key:',
      hidden: true,
      required: true,
      validator: Ask.lengthRange(32, 32),
    );
  }

  void printOutput(String output) {
    print(output);
  }

  void validateArgs({
    required String emptyArgs,
    required String tooManyArgsMsg,
  }) {
    if (argResults!.rest.isEmpty) {
      throw usageException(emptyArgs);
    }

    if (argResults!.rest.length > 1) {
      throw usageException(tooManyArgsMsg);
    }
  }
}
