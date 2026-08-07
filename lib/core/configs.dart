import '../core/error_custom_view.dart';
import '../languages/language_dart.g.dart';
import '../widgets/widget_dart.g.dart';
import 'package:finch/finch_app.dart';
import 'package:finch/finch_model.dart';
import 'package:finch/finch_tools.dart';

FinchConfigs configs = FinchConfigs(
  pathCache: pathTo(env['PATH_CACHE'] ?? './cache_routes'),
  jinjaMapTemplate: mapTemplates,
  widgetsPath: pathTo(env['WIDGETS_PATH'] ?? "./lib/widgets"),
  widgetsType: env['WIDGETS_TYPE'] ?? 'j2.html',
  languagePath: pathTo(env['LANGUAGE_PATH'] ?? "./lib/languages"),
  languageSource: LanguageSource.dart,
  dartLanguages: languageDart,
  publicDir: pathTo(env['PUBLIC_DIR'] ?? './public'),
  dbConfig: FinchDBConfig(
    enable: true, //env['ENABLE_DATABASE'] == 'true',
    dbName: env['MONGODB_NAME'] ?? 'example',
    auth: env['MONGODB_AUTH'] ?? 'admin',
    pass: env['MONGODB_PASSWORD'] ?? 'PasswordMongoDB',
    host: env['MONGODB_CONNECTION'] ?? 'localhost',
    port: env['MONGODB_PORT'] ?? '27018',
    user: env['MONGODB_USER'] ?? 'root',
  ),
  port: (env['DOMAIN_PORT'] ?? '8085').toInt(def: 8085),
  mysqlConfig: FinchMysqlConfig(
    enable: true,
    host: env['MYSQL_HOST'] ?? 'localhost',
    port: (env['MYSQL_PORT'] ?? '3306').toInt(def: 3306),
    user: env['MYSQL_USER'] ?? 'example_user',
    pass: env['MYSQL_PASSWORD'] ?? 'example_password',
    databaseName: env['MYSQL_DATABASE'] ?? 'example_db',
  ),

  /// Enable local debugger
  enableLocalDebugger: (env['ENABLE_LOCAL_DEBUGGER'] ?? true).toString().toBool,

  /// SQLite configuration
  sqliteConfig: FinchSqliteConfig(
    enable: true,
    filePath: env['SQLITE_PATH'] ?? './example_database.sqlite',
  ),
  errorWidget: ErrorCustomView(),
);
