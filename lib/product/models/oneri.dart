// ignore_for_file: empty_constructor_bodies

class Oneri {
  int? id;
  String? title;
  String? oneri;

  Oneri({
    required this.id,
    required this.title,
    required this.oneri,
  });

  factory Oneri.fromJson(Map<String, dynamic> json) {
    return Oneri(
      id: json['id'],
      title: json['title'],
      oneri: json['oneri'],
    );
  }
}
