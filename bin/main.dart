import 'src/enlocker_cli.dart';

void main(List<String> arguments) {
  final cli = EnlockerCli();
  cli.run(arguments).catchError(cli.handleExceptions);
}
