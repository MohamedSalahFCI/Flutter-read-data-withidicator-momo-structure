class Properties {
  final String name;
  final String model;
  final String manufacturer;
  final String cost_in_credits;
  final String length;
  final String max_atmosphering_speed;
  final String crew;
  final String passengers;
  final String cargo_capacity;
  final String consumables;
  final String hyperdrive_rating;
  final String MGLT;
  final String starship_class;
  final List<String> pilots;
  final List<String> films;
  final String created;
  final String edited;
  final String url;

  Properties({
    this.name,
    this.model,
    this.manufacturer,
    this.cost_in_credits,
    this.length,
    this.max_atmosphering_speed,
    this.crew,
    this.passengers,
    this.cargo_capacity,
    this.consumables,
    this.hyperdrive_rating,
    this.MGLT,
    this.starship_class,
    this.pilots,
    this.films,
    this.created,
    this.edited,
    this.url,
  });

  factory Properties.fromJson(Map<String, dynamic> json) {
    return new Properties(
      name: json['name'],
      model: json['model'],
      manufacturer: json['manufacturer'],
      cost_in_credits: json['cost_in_credits'],
      length: json['length'],
      max_atmosphering_speed: json['max_atmosphering_speed'],
      crew: json['crew'],
      passengers: json['passengers'],
      cargo_capacity: json['cargo_capacity'],
      consumables: json['consumables'],
      hyperdrive_rating: json['hyperdrive_rating'],
      MGLT: json['MGLT'],
      starship_class: json['starship_class'],
      pilots: (json['pilots'] as List).cast<String>().toList(),
      films: (json['films'] as List).cast<String>().toList(),
      created: json['created'],
      edited: json['edited'],
      url: json['url'],
    );
  }
}
