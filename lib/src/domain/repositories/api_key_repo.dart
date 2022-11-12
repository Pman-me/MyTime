abstract class IApiKeyRepo {
  Future<void> saveApiKey(String apiKey);

  Future<bool> checkApiKeyExists();

  Future<String?> fetchApiKey();
}
