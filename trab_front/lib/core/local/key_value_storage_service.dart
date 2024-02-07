import 'package:trab_front/helpers/constants/strings.dart';

import 'key_value_storage_base.dart';

class KeyValueStorageService {
  static const _authTokenKey = 'authToken';

  final _keyValueStorage = KeyValueStorageBase();

  Future<String> getAuthToken() async {
    return await _keyValueStorage.getEncrypted(_authTokenKey) ??
        AppStrings.empty;
  }

  void setAuthToken(String token) {
    _keyValueStorage.setEncrypted(_authTokenKey, token);
  }

  void resetKeys() {
    _keyValueStorage
      ..clearCommon()
      ..clearEncrypted();
  }
}
