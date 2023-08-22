import 'package:cli_completion/cli_completion.dart';

void main(List<String> args) {
  EnlockerCli().run(args);
}

class EnlockerCli extends CompletionCommandRunner {
  EnlockerCli()
      : super(
          'enlocker',
          'Encryption capabilities for your sensitive data.',
        );
}
