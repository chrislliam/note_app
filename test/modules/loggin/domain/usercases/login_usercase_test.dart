import 'package:clean_dart/app/modules/login/domain/entities/logged_user.dart';
import 'package:clean_dart/app/modules/login/domain/repository/auth_repository.dart';
import 'package:clean_dart/app/modules/login/domain/usercases/login_usercase.dart';
import 'package:flutter_test/flutter_test.dart';

class AuthRepositoryMock implements AuthRepository {
  @override
  Future<LoggedUser> login(CredencialParams params) {
    throw LoggedUser(email: params.email, name: 'william');
  }
}

void main() {
  final repository = AuthRepositoryMock();
  final usercase = LoginUsercase(repository);
  testWidgets('Deve efetuar o login', (tester) async {
    final result = await usercase(
        CredencialParams(email: 'mr.vwilliam@hotmail.com', password: '312'));

    expect(result, isA<LoggedUser>());
    expect(result.name, 'william');
    // expect(()=>result, throwsA(isA<AuthException>)); Caso queira retornar um erro
  });
}
