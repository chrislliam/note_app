import '../entities/logged_user.dart';
import '../usercases/login_usercase.dart';

mixin AuthRepository {
  Future<LoggedUser> login(CredencialParams params);
}
