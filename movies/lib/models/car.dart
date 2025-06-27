import 'package:cloud_firestore/cloud_firestore.dart';

class Car {
  final String id;
  final String make;
  final String model;
  final int year;
  final double price;
  final String category; // This will store the category document ID
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
  final String userId; // Add userId field to associate car with user

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
    required this.userId,
  });

  // Convert Car to Firestore document
  Map<String, dynamic> toFirestore() {
    return {
      'make': make,
      'model': model,
      'year': year,
      'price': price,
      'category': FirebaseFirestore.instance
          .collection('categories')
          .doc(category),
      'imageUrl': imageUrl,
      'description': description,
      'mileage': mileage,
      'fuelType': fuelType,
      'transmission': transmission,
      'condition': condition,
      'location': location,
      'sellerName': sellerName,
      'sellerPhone': sellerPhone,
      'listedDate': Timestamp.fromDate(listedDate),
      'userId': userId, // Include userId in Firestore document
    };
  }

  // Create Car from Firestore document
  factory Car.fromFirestore(DocumentSnapshot<Map<String, dynamic>> doc) {
    final data = doc.data()!;

    return Car(
      id: doc.id,
      make: data['make'] ?? '',
      model: data['model'] ?? '',
      year: data['year'] ?? 0,
      price: (data['price'] ?? 0).toDouble(),
      category: data['category'] is DocumentReference
          ? (data['category'] as DocumentReference).id
          : data['category'] ?? '',
      imageUrl: data['imageUrl'] ?? '',
      description: data['description'] ?? '',
      mileage: data['mileage'] ?? 0,
      fuelType: data['fuelType'] ?? '',
      transmission: data['transmission'] ?? '',
      condition: data['condition'] ?? '',
      location: data['location'] ?? '',
      sellerName: data['sellerName'] ?? '',
      sellerPhone: data['sellerPhone'] ?? '',
      listedDate: data['listedDate'] is Timestamp
          ? (data['listedDate'] as Timestamp).toDate()
          : DateTime.now(),
      userId:
          data['userId'] ?? '', // Include userId when creating from Firestore
    );
  }

  // Convert Car to JSON (for backwards compatibility)
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
      'userId': userId, // Include userId in JSON
    };
  }

  // Create Car from JSON (for backwards compatibility)
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
      userId: json['userId'] ?? '', // Include userId when creating from JSON
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

  // Convert CarCategory to Firestore document
  Map<String, dynamic> toFirestore() {
    return {'name': name, 'icon': icon, 'description': description};
  }

  // Create CarCategory from Firestore document
  factory CarCategory.fromFirestore(
    DocumentSnapshot<Map<String, dynamic>> doc,
  ) {
    final data = doc.data()!;

    return CarCategory(
      id: doc.id,
      name: data['name'] ?? '',
      icon: data['icon'] ?? '',
      description: data['description'] ?? '',
    );
  }
}
