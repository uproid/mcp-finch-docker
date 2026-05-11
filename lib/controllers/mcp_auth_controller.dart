import 'package:finch/finch_route.dart';

class McpAuthController extends AuthController<String> {
  static const String apiKey = 'ABCD1234';
  static const AuthType authType = AuthType.bearer;

  @override
  Future<bool> auth() async {
    if (rq.authorization.type == authType && rq.authorization.value == apiKey) {
      return true;
    }

    rq.renderView(path: 'auth');
    return false;
  }

  @override
  Future<bool> authApi() {
    throw UnimplementedError();
  }

  @override
  Future<({String message, bool success, String? user})> checkLogin() {
    throw UnimplementedError();
  }

  @override
  Future<bool> checkPermission() async {
    return true;
  }

  @override
  Future<String> loginPost() {
    throw UnimplementedError();
  }

  @override
  Future<String> logout() {
    throw UnimplementedError();
  }

  @override
  Future<String> newUser() {
    throw UnimplementedError();
  }

  @override
  Future<String> register() {
    throw UnimplementedError();
  }

  @override
  void removeAuth() {}

  @override
  void updateAuth(String email, String password, String user) {}
}
