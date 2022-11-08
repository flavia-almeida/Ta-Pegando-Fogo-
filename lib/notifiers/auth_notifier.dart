import 'package:hooks_riverpod/hooks_riverpod.dart';
import '../models/auth_response.dart';
import '../repositories/login_repository.dart';

class AuthNotifier extends StateNotifier<AsyncValue<AuthResponse?>> {
  final _authRepository = AuthRepository();

  AuthNotifier()
      : super(AsyncValue.data(AuthResponse(userId: "", accessToken: "")));

  Future<void> authenticate(String login, String password) async {
    try {
      state = const AsyncValue.loading();
      state =
          AsyncValue.data(await _authRepository.authenticate(login, password));
    } catch (e) {
      state = AsyncValue.error(e.toString());
    }
  }
}
