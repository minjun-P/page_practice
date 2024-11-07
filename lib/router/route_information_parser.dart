import 'package:flutter/cupertino.dart';
import 'package:page_practice/router/book_route_path.dart';

class BookRouteInformationParser extends RouteInformationParser<BookRoutePath> {
  @override
  Future<BookRoutePath> parseRouteInformation(RouteInformation routeInformation) async {
    final uri = routeInformation.uri;
    if (uri.pathSegments.isEmpty) {
      return BookRoutePath.home();
    }
    // Handle '/book/:id'
    if (uri.pathSegments.length == 2) {
      if (uri.pathSegments[0] != "book") return BookRoutePath.unknown();
      final remaining = uri.pathSegments[1];
      final id = int.tryParse(remaining);
      if (id == null) return BookRoutePath.unknown();
      return BookRoutePath.details(id);
    }

    return BookRoutePath.unknown();
  }

  @override
  RouteInformation? restoreRouteInformation(BookRoutePath configuration) {
    if (configuration.isUnknown) {
      return RouteInformation(uri: Uri.parse('/404'));
    }
    if (configuration.isHomePage) {
      return RouteInformation(uri:  Uri.parse('/'));
    }
    if (configuration.isDetailsPage) {
      return RouteInformation(uri: Uri.parse('/book/${configuration.id}'));
    }
    return null;
  }
}