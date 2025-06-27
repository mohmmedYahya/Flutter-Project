import 'package:cloud_firestore/cloud_firestore.dart';
import '../models/car.dart';
import '../models/user_profile.dart';

class FirestoreService {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  // Categories Collection Reference
  CollectionReference<Map<String, dynamic>> get _categoriesCollection =>
      _firestore.collection('categories');

  // Cars Collection Reference
  CollectionReference<Map<String, dynamic>> get _carsCollection =>
      _firestore.collection('cars');

  // Users Collection Reference
  CollectionReference<Map<String, dynamic>> get _usersCollection =>
      _firestore.collection('users');

  // ========== USER PROFILE OPERATIONS ==========

  // Create user profile
  Future<void> createUserProfile({
    required String userId,
    required String email,
    required String displayName,
    required String phoneNumber,
  }) async {
    try {
      final now = DateTime.now();
      final userProfile = UserProfile(
        userId: userId,
        email: email,
        displayName: displayName,
        phoneNumber: phoneNumber,
        createdAt: now,
        updatedAt: now,
      );

      await _usersCollection.doc(userId).set(userProfile.toFirestore());
    } catch (e) {
      throw Exception('Failed to create user profile: $e');
    }
  }

  // Get user profile
  Future<UserProfile?> getUserProfile(String userId) async {
    try {
      final docSnapshot = await _usersCollection.doc(userId).get();
      if (docSnapshot.exists) {
        return UserProfile.fromFirestore(docSnapshot);
      }
      return null;
    } catch (e) {
      throw Exception('Failed to fetch user profile: $e');
    }
  }

  // Update user profile
  Future<void> updateUserProfile({
    required String userId,
    String? displayName,
    String? phoneNumber,
  }) async {
    try {
      final updateData = <String, dynamic>{
        'updatedAt': Timestamp.fromDate(DateTime.now()),
      };

      if (displayName != null) updateData['displayName'] = displayName;
      if (phoneNumber != null) updateData['phoneNumber'] = phoneNumber;

      await _usersCollection.doc(userId).update(updateData);
    } catch (e) {
      throw Exception('Failed to update user profile: $e');
    }
  }

  // ========== CATEGORY OPERATIONS ==========

  // Get all categories
  Future<List<CarCategory>> getCategories() async {
    try {
      final querySnapshot = await _categoriesCollection.get();
      return querySnapshot.docs
          .map((doc) => CarCategory.fromFirestore(doc))
          .toList();
    } catch (e) {
      throw Exception('Failed to fetch categories: $e');
    }
  }

  // Get categories stream for real-time updates
  Stream<List<CarCategory>> getCategoriesStream() {
    return _categoriesCollection.snapshots().map(
      (snapshot) =>
          snapshot.docs.map((doc) => CarCategory.fromFirestore(doc)).toList(),
    );
  }

  // Get category by ID
  Future<CarCategory?> getCategoryById(String categoryId) async {
    try {
      final docSnapshot = await _categoriesCollection.doc(categoryId).get();
      if (docSnapshot.exists) {
        return CarCategory.fromFirestore(docSnapshot);
      }
      return null;
    } catch (e) {
      throw Exception('Failed to fetch category: $e');
    }
  }

  // ========== CAR OPERATIONS ==========

  // Get all cars
  Future<List<Car>> getCars() async {
    try {
      final querySnapshot = await _carsCollection
          .orderBy('listedDate', descending: true)
          .get();
      return querySnapshot.docs.map((doc) => Car.fromFirestore(doc)).toList();
    } catch (e) {
      throw Exception('Failed to fetch cars: $e');
    }
  }

  // Get cars stream for real-time updates
  Stream<List<Car>> getCarsStream() {
    return _carsCollection
        .orderBy('listedDate', descending: true)
        .snapshots()
        .map(
          (snapshot) =>
              snapshot.docs.map((doc) => Car.fromFirestore(doc)).toList(),
        );
  }

  // Get featured cars (limit to 5)
  Future<List<Car>> getFeaturedCars() async {
    try {
      final querySnapshot = await _carsCollection
          .orderBy('listedDate', descending: true)
          .limit(5)
          .get();
      return querySnapshot.docs.map((doc) => Car.fromFirestore(doc)).toList();
    } catch (e) {
      throw Exception('Failed to fetch featured cars: $e');
    }
  }

  // Get featured cars stream
  Stream<List<Car>> getFeaturedCarsStream() {
    return _carsCollection
        .orderBy('listedDate', descending: true)
        .limit(5)
        .snapshots()
        .map(
          (snapshot) =>
              snapshot.docs.map((doc) => Car.fromFirestore(doc)).toList(),
        );
  }

  // Get cars by category
  Future<List<Car>> getCarsByCategory(String categoryId) async {
    try {
      final categoryRef = _categoriesCollection.doc(categoryId);
      final querySnapshot = await _carsCollection
          .where('category', isEqualTo: categoryRef)
          .orderBy('listedDate', descending: true)
          .get();
      return querySnapshot.docs.map((doc) => Car.fromFirestore(doc)).toList();
    } catch (e) {
      throw Exception('Failed to fetch cars by category: $e');
    }
  }

  // Get cars by category stream
  Stream<List<Car>> getCarsByCategoryStream(String categoryId) {
    try {
      final categoryRef = _categoriesCollection.doc(categoryId);
      return _carsCollection
          .where('category', isEqualTo: categoryRef)
          .orderBy('listedDate', descending: true)
          .snapshots()
          .map(
            (snapshot) =>
                snapshot.docs.map((doc) => Car.fromFirestore(doc)).toList(),
          );
    } catch (e) {
      // Return an empty stream with error handling
      return Stream.error(Exception('Failed to fetch cars by category: $e'));
    }
  }

  // Add a new car
  Future<String> addCar(Car car) async {
    try {
      final docRef = await _carsCollection.add(car.toFirestore());
      return docRef.id;
    } catch (e) {
      throw Exception('Failed to add car: $e');
    }
  }

  // Update a car
  Future<void> updateCar(String carId, Car car) async {
    try {
      await _carsCollection.doc(carId).update(car.toFirestore());
    } catch (e) {
      throw Exception('Failed to update car: $e');
    }
  }

  // Delete a car
  Future<void> deleteCar(String carId) async {
    try {
      await _carsCollection.doc(carId).delete();
    } catch (e) {
      throw Exception('Failed to delete car: $e');
    }
  }

  // Get car by ID
  Future<Car?> getCarById(String carId) async {
    try {
      final docSnapshot = await _carsCollection.doc(carId).get();
      if (docSnapshot.exists) {
        return Car.fromFirestore(docSnapshot);
      }
      return null;
    } catch (e) {
      throw Exception('Failed to fetch car: $e');
    }
  }

  // Search cars
  Future<List<Car>> searchCars(String searchQuery) async {
    try {
      // For better search functionality, you might want to implement
      // full-text search using Algolia or similar service
      // For now, this is a basic search by make and model
      final querySnapshot = await _carsCollection.get();
      final allCars = querySnapshot.docs
          .map((doc) => Car.fromFirestore(doc))
          .toList();

      return allCars.where((car) {
        final query = searchQuery.toLowerCase();
        return car.make.toLowerCase().contains(query) ||
            car.model.toLowerCase().contains(query) ||
            car.description.toLowerCase().contains(query);
      }).toList();
    } catch (e) {
      throw Exception('Failed to search cars: $e');
    }
  }

  // Search cars by category with make/model filtering
  Stream<List<Car>> searchCarsByCategoryStream(
    String categoryId,
    String searchQuery,
  ) {
    try {
      final categoryRef = _categoriesCollection.doc(categoryId);

      if (searchQuery.isEmpty) {
        // Return all cars in category if no search query
        return _carsCollection
            .where('category', isEqualTo: categoryRef)
            .orderBy('listedDate', descending: true)
            .snapshots()
            .map(
              (snapshot) =>
                  snapshot.docs.map((doc) => Car.fromFirestore(doc)).toList(),
            );
      }

      // For Firestore text search, we need to use array-contains or range queries
      // This is a basic implementation - for production, consider using Algolia
      return _carsCollection
          .where('category', isEqualTo: categoryRef)
          .orderBy('listedDate', descending: true)
          .snapshots()
          .map((snapshot) {
            final allCars = snapshot.docs
                .map((doc) => Car.fromFirestore(doc))
                .toList();
            final query = searchQuery.toLowerCase();

            return allCars.where((car) {
              return car.make.toLowerCase().contains(query) ||
                  car.model.toLowerCase().contains(query);
            }).toList();
          });
    } catch (e) {
      return Stream.error(Exception('Failed to search cars by category: $e'));
    }
  }

  // Advanced search with Firestore range queries for make
  Stream<List<Car>> searchCarsByCategoryAdvancedStream(
    String categoryId,
    String searchQuery,
  ) {
    try {
      final categoryRef = _categoriesCollection.doc(categoryId);

      if (searchQuery.isEmpty) {
        return getCarsByCategoryStream(categoryId);
      }

      final searchLower = searchQuery.toLowerCase();
      final searchUpper =
          searchLower + '\uf8ff'; // Unicode high character for range

      // Search by make field using range query
      return _carsCollection
          .where('category', isEqualTo: categoryRef)
          .where('make', isGreaterThanOrEqualTo: searchLower)
          .where('make', isLessThan: searchUpper)
          .orderBy('make')
          .orderBy('listedDate', descending: true)
          .snapshots()
          .map(
            (snapshot) =>
                snapshot.docs.map((doc) => Car.fromFirestore(doc)).toList(),
          );
    } catch (e) {
      return Stream.error(Exception('Failed to advanced search cars: $e'));
    }
  }

  // Get total cars count
  Future<int> getTotalCarsCount() async {
    try {
      final querySnapshot = await _carsCollection.get();
      return querySnapshot.docs.length;
    } catch (e) {
      throw Exception('Failed to get cars count: $e');
    }
  }

  // Get total categories count
  Future<int> getTotalCategoriesCount() async {
    try {
      final querySnapshot = await _categoriesCollection.get();
      return querySnapshot.docs.length;
    } catch (e) {
      throw Exception('Failed to get categories count: $e');
    }
  }

  // ========== USER-SPECIFIC CAR OPERATIONS ==========

  // Get cars by user ID
  Future<List<Car>> getCarsByUserId(String userId) async {
    try {
      final querySnapshot = await _carsCollection
          .where('userId', isEqualTo: userId)
          .orderBy('listedDate', descending: true)
          .get();
      return querySnapshot.docs.map((doc) => Car.fromFirestore(doc)).toList();
    } catch (e) {
      throw Exception('Failed to fetch user cars: $e');
    }
  }

  // Get cars by user ID stream for real-time updates
  Stream<List<Car>> getCarsByUserIdStream(String userId) {
    return _carsCollection
        .where('userId', isEqualTo: userId)
        .orderBy('listedDate', descending: true)
        .snapshots()
        .map(
          (snapshot) =>
              snapshot.docs.map((doc) => Car.fromFirestore(doc)).toList(),
        );
  }

  // Get cars count by user ID
  Future<int> getCarsCountByUserId(String userId) async {
    try {
      final querySnapshot = await _carsCollection
          .where('userId', isEqualTo: userId)
          .get();
      return querySnapshot.docs.length;
    } catch (e) {
      throw Exception('Failed to get user cars count: $e');
    }
  }
}
