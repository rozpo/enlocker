import 'dart:async';

import 'package:args/command_runner.dart';
import 'package:encrypt/encrypt.dart';

class EncryptCommand extends Command {
  @override
  String get name => 'encrypt';

  @override
  String get description => 'Encrypt your sensitive data.';

  @override
  FutureOr? run() {
    if (argResults!.rest.isEmpty) {
      throw usageException(
          'Need something to encrypt, try: enlocker encrypt "my secret"');
    }

    if (argResults!.rest.length > 1) {
      throw usageException('Too many arguments for encrypt.');
    }

    final text = argResults!.rest.first;
    final key = Key.fromUtf8('my 32 length key................');
    final iv = IV.fromLength(16);

    final encrypter = Encrypter(AES(key));

    final encrypted = encrypter.encrypt(text, iv: iv);
    final decrypted = encrypter.decrypt(encrypted, iv: iv);

    print(decrypted);
    print(encrypted.base64);
  }
}
