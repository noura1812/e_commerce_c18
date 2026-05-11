import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:injectable/injectable.dart';

@module
abstract class SecureStorageModel {
  FlutterSecureStorage get flutterSecureStorage => FlutterSecureStorage(
    aOptions: AndroidOptions(enforceBiometrics: true, biometricPromptTitle: "need to login"),
  );
}
