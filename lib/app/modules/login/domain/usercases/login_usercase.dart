import '../entities/logged_user.dart';
import '../errors/erros.dart';
import '../repository/auth_repository.dart';

mixin ILoginUsercase {
  Future<LoggedUser> call(CredencialParams credencial);
}

class LoginUsercase implements ILoginUsercase {
  final AuthRepository repository;

  LoginUsercase(this.repository);

  @override
  Future<LoggedUser> call(CredencialParams credencial) async {
    if (credencial.email!.isEmpty) {
      throw AuthException('Erro email');
    }
    return await repository.login(credencial);
  }
}

class CredencialParams {
  final String? email;
  final String? password;

  CredencialParams({this.email, this.password});
}
