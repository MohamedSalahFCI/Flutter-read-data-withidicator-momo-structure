import 'package:read_data_with_indicator_with_momo_structure/properties.dart';

class StarWar {
  final int count;
  final String next;
  final int previous;
  final List<Properties> results;

  StarWar({this.count, this.next, this.previous, this.results});

  factory StarWar.fromJson(Map<String, dynamic> json) {
    return new StarWar(
      count: json['count'],
      next: json['next'],
      previous: json['previous'],
      results:
          (json['results'] as List).map((e) => Properties.fromJson(e)).toList(),
    );
  }
}
