import 'package:fluro/fluro.dart';

import 'route_handlers.dart';

class Routes {
  static String details = "/details/:position";

  static void configureRoutes(Router router) {
    router.define(details, handler: detailsHandler);
  }
}
