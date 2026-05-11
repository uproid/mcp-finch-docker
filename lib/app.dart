import 'package:app/controllers/home_controller.dart';
import 'package:app/controllers/mcp_auth_controller.dart';
import 'package:app/controllers/mcp_controller.dart';
import 'package:app/languages/language_dart.g.dart';
import 'package:app/widgets/widget_dart.g.dart';
import 'package:finch/finch_app.dart';
import 'package:finch/finch_model.dart';
import 'package:finch/finch_route.dart';

FinchConfigs configs = FinchConfigs(
  port: 80,
  languagePath: './lib/languages',
  languageSource: LanguageSource.dart,
  dartLanguages: languageDart,
  widgetsPath: './lib/widgets',
  widgetsType: 'j2.html',
  jinjaMapTemplate: mapTemplates,
  enableLocalDebugger: true,
  sqliteConfig: FinchSqliteConfig(
    enable: true,
    filePath: './database/database.sqlite.db',
  ),
  pathMigrationMySQL: './migrate_sqlite',
);

final app = FinchApp(configs: configs);

void main([List<String>? args]) async {
  app.get(
    path: '/',
    controller: HomeController(),
    children: [
      FinchRoute(
        path: '/mcp',
        controller: McpController(),
        methods: Methods.ALL,
        auth: McpAuthController(),
      ),
    ],
  );
  app.start(args, true);
}
