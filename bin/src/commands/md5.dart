import 'package:args/command_runner.dart';
import 'package:enlocker/enlocker.dart';

class Md5Command extends Command {
  @override
  String get name => 'md5';

  @override
  String get description => 'Generate an MD5 hash of the given text.';

  @override
  void run() {
    // check
    if (argResults!.arguments.isEmpty) {
      throw usageException('Text is required');
    }

    if (argResults!.arguments.length > 1) {
      throw usageException('Too many arguments');
    }

    final text = argResults!.arguments.first;

    if (text.isEmpty) {
      throw usageException('Text cannot be empty');
    }

    // process
    final hash = Enlocker().md5(text.codeUnits);
    final hex = hash.map((byte) => byte.toRadixString(16)).join();

    // result
    print(hex);
  }
}
