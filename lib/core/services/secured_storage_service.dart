import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:injectable/injectable.dart';

@singleton
class SecuredStorageService {
  final FlutterSecureStorage _flutterSecureStorage;

  SecuredStorageService({required FlutterSecureStorage flutterSecureStorage})
    : _flutterSecureStorage = flutterSecureStorage;
  saveString({required String key, required String value}) async {
    await _flutterSecureStorage.write(key: key, value: value);
  }

  Future<String?> getString({required String key}) async {
    return await _flutterSecureStorage.read(key: key);
  }

  deleteString({required String key}) async {
    await _flutterSecureStorage.delete(key: key);
  }
}
