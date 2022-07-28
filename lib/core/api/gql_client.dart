import 'package:graphql_flutter/graphql_flutter.dart';

class GqlClient {
  final HttpLink link = HttpLink('https://rickandmortyapi.com/graphql');

  GraphQLClient clientToQuery() {
    return GraphQLClient(
      link: link,
      cache: GraphQLCache(),
    );
  }
}
