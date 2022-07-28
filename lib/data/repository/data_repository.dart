import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:rick_and_morty/core/api/gql_query.dart';
import 'package:rick_and_morty/data/models/character.dart';
import 'package:rick_and_morty/data/models/episodes.dart';
import 'package:rick_and_morty/data/models/locations.dart';

import '../../core/api/gql_client.dart';

class DataRepository {
  final GqlClient _client = GqlClient();

  Future<List<Character>> getCharacter() async {
    try {
      final result = await _client.clientToQuery().query(QueryOptions(
            document: gql(GqlQuery.characterQuery),
          ));
      if (result.data == null) {
        return [];
      }
      return result.data?['characters']['results']
          .map((e) => Character.fromJson(e))
          .cast<Character>()
          .toList();
    } on Exception catch (e) {
      throw Exception(e);
    }
  }

  Future<List<Episode>> getEpisode() async {
    try {
      final result = await _client.clientToQuery().query(QueryOptions(
            document: gql(GqlQuery.episodesQuery),
          ));
      if (result.data == null) {
        return [];
      }
      return result.data?['episodes']['results']
          .map((e) => Episode.fromJson(e))
          .cast<Episode>()
          .toList();
    } on Exception catch (e) {
      throw Exception(e);
    }
  }

  Future<List<Location>> getLocation() async {
    try {
      final result = await _client.clientToQuery().query(
            QueryOptions(
              document: gql(GqlQuery.locationsQuery),
            ),
          );
      if (result.data == null) {
        return [];
      }
      return result.data?['locations']['results']
          .map((e) => Location.fromJson(e))
          .cast<Location>()
          .toList();
    } on Exception catch (e) {
      throw Exception(e);
    }
  }
}
