part of 'base_profile_repository.dart';

class ProfileRepository extends BaseProfileRepository {
  @override
  Future<UserApp> getUserData({
    required String token,
  }) async {
    final _userData = UserApp(
      name: "Mekarians",
      email: "mekarians@mekari.com",
    );

    // some process to get data from API

    return _userData;
  }
}
