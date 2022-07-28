class Location {
  Location({
    required this.id,
    required this.name,
    required this.type,
    required this.dimension,
  });

  final String id;
  final String name;
  final String type;
  final String dimension;

  factory Location.fromJson(Map<String, dynamic> json) => Location(
    id: json["id"],
    name: json["name"],
    type: json["type"],
    dimension: json["dimension"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "name": name,
    "type": type,
    "dimension": dimension,
  };
}