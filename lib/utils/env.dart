enum Environment { DEV, PROD, STAG }

class Env {
  Env._();
  static Map<String, dynamic>? _config;

  static void setEnvironment(Environment env) {
    switch (env) {
      case Environment.DEV:
        _config = _Config.devConstants;
        break;
      case Environment.PROD:
        _config = _Config.prodConstants;
        break;
      case Environment.STAG:
        _config = _Config.stagingConstants;
        break;
    }
  }

  static String get baseUrl {
    return _config![_Config.BASE_URL];
  }

  static String get apiKey {
    return _config![_Config.API_KEY];
  }
}

class _Config {
  static const BASE_URL = 'base_url';
  static const API_KEY = 'api_key';

  static Map<String, dynamic> devConstants = {
    BASE_URL: "newsapi.org",
    API_KEY: "c211616820814c2ca9813185d64aee37"
  };

  static Map<String, dynamic> prodConstants = {
    BASE_URL: "newsapi.org",
    API_KEY: "c211616820814c2ca9813185d64aee37"
  };

  static Map<String, dynamic> stagingConstants = {
    BASE_URL: "newsapi.org",
    API_KEY: "c211616820814c2ca9813185d64aee37"
  };
}
