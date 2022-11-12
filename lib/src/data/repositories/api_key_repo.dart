import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:my_time/src/domain/repositories/api_key_repo.dart';

import '../../constants/general_constant.dart';
import '../../util/api_key_container.dart';
import '../local/app_db/object_box_helper.dart';

class ApiKeyRepo implements IApiKeyRepo {
  FlutterSecureStorage _secureStorage;
  ApiKeyContainer _apiKeyContainer;
  ObjectBoxHelper _objectBoxHelper;

  ApiKeyRepo(
      {required FlutterSecureStorage secureStorage,
      required ApiKeyContainer apiKeyContainer,
      required ObjectBoxHelper objectBoxHelper})
      : _secureStorage = secureStorage,
        _apiKeyContainer = apiKeyContainer,
        _objectBoxHelper = objectBoxHelper;

  @override
  Future<void> saveApiKey(String apiKey) async {
    await _secureStorage.write(key: kApiKeySecureStorageKey, value: apiKey);
    _apiKeyContainer.setApiKey = apiKey;
  }

  @override
  Future<bool> checkApiKeyExists() async {
    return await _secureStorage.containsKey(key: kApiKeySecureStorageKey);
  }

  @override
  Future<String?> fetchApiKey() {
    return _secureStorage.read(key: kApiKeySecureStorageKey);
  }

  Future<void> initObjectBox() async {
    await _objectBoxHelper.init();
  }
}
