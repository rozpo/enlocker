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
    final plainText = 'Lorem ipsum dolor sit amet, consectetur adipiscing elit';
    final key = Key.fromUtf8('my 32 length key................');
    final iv = IV.fromLength(16);

    final encrypter = Encrypter(AES(key));

    final encrypted = encrypter.encrypt(plainText, iv: iv);
    final decrypted = encrypter.decrypt(encrypted, iv: iv);

    print(decrypted);
    print(encrypted.base64);
  }
}
