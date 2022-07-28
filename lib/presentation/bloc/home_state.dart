part of 'home_cubit.dart';

class HomeState extends Equatable {
  final DtStatus? status;
  final List<Character>? character;
  final List<Episode>? episode;
  final List<Location>? location;

  const HomeState({
    this.status,
    this.character,
    this.episode,
    this.location,
  });

  @override
  List<Object?> get props => [
        status,
        character,
        episode,
        location,
      ];

  HomeState copyWith({
    DtStatus? status,
    List<Character>? character,
    List<Episode>? episode,
    List<Location>? location,
  }) {
    return HomeState(
      status: status ?? this.status,
      character: character ?? this.character,
      episode: episode ?? this.episode,
      location: location ?? this.location,
    );
  }
}
