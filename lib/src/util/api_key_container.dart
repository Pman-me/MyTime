class ApiKeyContainer {
  static ApiKeyContainer? instance;

  ApiKeyContainer._internal();

  factory ApiKeyContainer() {
    instance ??= ApiKeyContainer._internal();
    return instance!;
  }

  late String _kApiKey;

  String get getApiKey => _kApiKey;

  set setApiKey(String? value) {
    _kApiKey = value!;
  }
}
