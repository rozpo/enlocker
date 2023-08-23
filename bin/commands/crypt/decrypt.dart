import 'dart:async';

import 'package:encrypt/encrypt.dart';

import 'crypt.dart';

class DecryptCommand extends CryptCommand {
  @override
  String get name => 'decrypt';

  @override
  String get description => 'Decrypt previously encrypted data.';

  @override
  FutureOr? run() {
    if (argResults!.rest.isEmpty) {
      throw usageException(
          'Need something to decrypt, try: enlocker decrypt "my secret"');
    }

    if (argResults!.rest.length > 1) {
      throw usageException('Too many arguments for decrypt.');
    }

    final key = getKeyFromUser();

    final text = argResults!.rest.first;
    final iv = IV.fromLength(16);

    final encrypter = Encrypter(AES(Key.fromUtf8(key)));
    final decrypted = encrypter.decrypt(Encrypted.fromBase64(text), iv: iv);

    print('######## Decrypted data ########');
    print(decrypted);
  }
}
