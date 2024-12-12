class AnimalInfo {
  String name;
  // final String description;
  // final String image;
  final List<dynamic> taxonomy;
  final List<dynamic> locations;
  final List<dynamic> characteristics;
  
  AnimalInfo({
    required this.name,
    // this.description,
    // this.image,
    required this.taxonomy,
    required this.locations,
    required this.characteristics,
  });

  factory AnimalInfo.fromJson(Map<String, dynamic> json) {
    return AnimalInfo(
      // json['name'],
      // json['description'],
      // json['image'],
      name: json['name'] ?? '',
      taxonomy: json['taxonomy'] ?? [],
      locations: json['locations'] ?? [],
      characteristics: json['characteristics'] ?? [],
    );
  }
}