class EnvConfig {
  static const baseProdUrl = String.fromEnvironment(
    'https://finnhub.io/api/v1/stock/',
    defaultValue: 'https://finnhub.io/api/v1/',
  );

  // Can add Staging or Dev URL here

  static const openApiKey = String.fromEnvironment(
    'c6skm0qad3ie4g2fjh40',
    defaultValue: 'c6skm0qad3ie4g2fjh40',
  );
}
