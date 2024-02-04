import 'package:crypto/crypto.dart' as crypto;

class Enlocker {
  List<int> md5(List<int> bytes) {
    return crypto.md5.convert(bytes).bytes;
  }
}
