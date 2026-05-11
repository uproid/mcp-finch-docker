import 'package:finch/finch_route.dart';

class McpAuthController extends AuthController<String> {
  McpAuthController();
  static final allowedApiKey = '1234567890abcdef';
  String? logedInApiKey;

  @override
  Future<bool> auth() async {
    var res = await checkLogin();
    if (!res.success) {
      rq.renderView(path: 'auth');
      return false;
    }
    return true;
  }

  @override
  Future<bool> authApi() async {
    return await auth();
  }

  @override
  Future<
      ({
        bool success,
        String message,
        String? user,
      })> checkLogin() async {
    var type = rq.authorization.type;
    var apikey = rq.authorization.value;

    if (type == AuthType.bearer && allowedApiKey == apikey) {
      return (
        success: true,
        message: 'API key is valid.',
        user: apikey,
      );
    }

    return (
      success: false,
      message: 'Not logged in.',
      user: null,
    );
  }

  @override
  Future<bool> checkPermission() async {
    if (logedInApiKey != null) {
      return false;
    }

    return true;
  }

  @override
  Future<String> loginPost() async {
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
  void removeAuth() {
    logedInApiKey = null;
  }

  @override
  void updateAuth(String email, String password, user) {}
}
