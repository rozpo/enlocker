import 'dart:async';

import 'package:encrypt/encrypt.dart';

import 'crypt.dart';

class EncryptCommand extends CryptCommand {
  @override
  String get name => 'encrypt';

  @override
  String get description => 'Encrypt your sensitive data.';

  @override
  FutureOr? run() {
    validateArgs(
      emptyArgs: 'Need something to encrypt, try: enlocker encrypt "my secret"',
      tooManyArgsMsg: 'Too many arguments for encrypt.',
    );

    final key = getKeyFromUser();

    final text = argResults!.rest.first;
    final iv = IV.fromLength(16);

    try {
      final encrypter = Encrypter(AES(Key.fromUtf8(key)));
      final encrypted = encrypter.encrypt(text, iv: iv);

      printOutput(encrypted.base64);
    } catch (e) {
      print(e);
      print('Data cannot be encrypted');
    }
  }
}
