import 'package:app/controllers/mcp_auth_controller.dart';
import 'package:app/db/todos_db.dart';
import 'package:finch/finch_route.dart';

class HomeController extends Controller {
  HomeController();

  @override
  Future<String> index() async {
    var todos = await TodosDB().findAll();
    rq.addParam('todos', todos.rows.assoc);
    rq.addParam('API_KEY',
        "${McpAuthController.authType.name} ${McpAuthController.apiKey}");
    return rq.renderView(path: 'home');
  }
}
