import '../../commons/commons.dart';

part 'profile_repository.dart';

abstract class BaseProfileRepository {
  Future<UserApp> getUserData({
    required String token,
  });
}
