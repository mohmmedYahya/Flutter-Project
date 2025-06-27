class Car {
  final String id;
  final String make;
  final String model;
  final int year;
  final double price;
  final String category;
  final String imageUrl;
  final String description;
  final int mileage;
  final String fuelType;
  final String transmission;
  final String condition;
  final String location;
  final String sellerName;
  final String sellerPhone;
  final DateTime listedDate;

  Car({
    required this.id,
    required this.make,
    required this.model,
    required this.year,
    required this.price,
    required this.category,
    required this.imageUrl,
    required this.description,
    required this.mileage,
    required this.fuelType,
    required this.transmission,
    required this.condition,
    required this.location,
    required this.sellerName,
    required this.sellerPhone,
    required this.listedDate,
  });

  // Convert Car to JSON
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'make': make,
      'model': model,
      'year': year,
      'price': price,
      'category': category,
      'imageUrl': imageUrl,
      'description': description,
      'mileage': mileage,
      'fuelType': fuelType,
      'transmission': transmission,
      'condition': condition,
      'location': location,
      'sellerName': sellerName,
      'sellerPhone': sellerPhone,
      'listedDate': listedDate.toIso8601String(),
    };
  }

  // Create Car from JSON
  factory Car.fromJson(Map<String, dynamic> json) {
    return Car(
      id: json['id'],
      make: json['make'],
      model: json['model'],
      year: json['year'],
      price: json['price'].toDouble(),
      category: json['category'],
      imageUrl: json['imageUrl'],
      description: json['description'],
      mileage: json['mileage'],
      fuelType: json['fuelType'],
      transmission: json['transmission'],
      condition: json['condition'],
      location: json['location'],
      sellerName: json['sellerName'],
      sellerPhone: json['sellerPhone'],
      listedDate: DateTime.parse(json['listedDate']),
    );
  }
}

class CarCategory {
  final String id;
  final String name;
  final String icon;
  final String description;

  CarCategory({
    required this.id,
    required this.name,
    required this.icon,
    required this.description,
  });
}
