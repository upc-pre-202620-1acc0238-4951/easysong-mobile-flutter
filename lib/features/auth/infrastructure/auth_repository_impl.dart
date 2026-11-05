import 'package:easy_song/core/storage/token_storage.dart';
import 'package:easy_song/features/auth/domain/auth_repository.dart';
import 'package:easy_song/features/auth/domain/user.dart';
import 'package:easy_song/features/auth/infrastructure/auth_api.dart';
import 'package:easy_song/features/auth/infrastructure/login_response_dto.dart';

class AuthRepositoryImpl implements AuthRepository {
  final AuthApi api;
  final TokenStorage storage;
  const new({required this.api, required this.storage});

  @override
  Future<User> login(String email, String password) async {
    LoginResponseDto responseDto = await api.login(email, password);

    await storage.saveToken(responseDto.token);
    return User(
      firstName: responseDto.firstName,
      lastName: responseDto.lastName,
      email: responseDto.email,
    );
  }
}
