import 'package:get_storage/get_storage.dart';

class LocalStorageProvider {
  final _box = GetStorage();

  static const _tokenKey = 'auth_token';
  static const _userKey = 'user_data';
  static const _onboardingKey = 'onboarding_seen';
  static const _themeKey = 'dark_mode';

  // Token
  String? getToken() => _box.read<String>(_tokenKey);
  Future<void> saveToken(String token) => _box.write(_tokenKey, token);
  Future<void> clearToken() => _box.remove(_tokenKey);
  bool get isLoggedIn => getToken() != null;

  // User
  Map<String, dynamic>? getUserData() => _box.read<Map<String, dynamic>>(_userKey);
  Future<void> saveUserData(Map<String, dynamic> data) => _box.write(_userKey, data);
  Future<void> clearUserData() => _box.remove(_userKey);

  // Onboarding
  bool get hasSeenOnboarding => _box.read<bool>(_onboardingKey) ?? false;
  Future<void> setOnboardingSeen() => _box.write(_onboardingKey, true);

  // Theme
  bool get isDarkMode => _box.read<bool>(_themeKey) ?? false;
  Future<void> setDarkMode(bool value) => _box.write(_themeKey, value);

  // Clear all
  Future<void> clearAll() => _box.erase();
}
