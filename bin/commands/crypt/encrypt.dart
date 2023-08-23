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
    if (argResults!.rest.isEmpty) {
      throw usageException(
          'Need something to encrypt, try: enlocker encrypt "my secret"');
    }

    if (argResults!.rest.length > 1) {
      throw usageException('Too many arguments for encrypt.');
    }

    final key = getKeyFromUser();

    final text = argResults!.rest.first;
    final iv = IV.fromLength(16);

    final encrypter = Encrypter(AES(Key.fromUtf8(key)));
    final encrypted = encrypter.encrypt(text, iv: iv);

    print('######## Encrypted data ########');
    print(encrypted.base64);
  }
}
