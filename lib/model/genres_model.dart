import 'dart:convert';

GenresModel genresModelFromJson(String str) => GenresModel.fromJson(json.decode(str));

String genresModelToJson(GenresModel data) => json.encode(data.toJson());

class GenresModel {
    List<Genre> genres;

    GenresModel({
        required this.genres,
    });

    factory GenresModel.fromJson(Map<String, dynamic> json) => GenresModel(
        genres: List<Genre>.from(json["genres"].map((x) => Genre.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "genres": List<dynamic>.from(genres.map((x) => x.toJson())),
    };
}

class Genre {
    int id;
    String name;

    Genre({
        required this.id,
        required this.name,
    });

    factory Genre.fromJson(Map<String, dynamic> json) => Genre(
        id: json["id"]??0,
        name: json["name"]??"",
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
    };
}
