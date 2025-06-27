import '../models/car.dart';

class DummyData {
  static List<CarCategory> getCarCategories() {
    return [
      CarCategory(
        id: 'sedan',
        name: 'Sedan',
        icon: '🚗',
        description: 'Comfortable family cars',
      ),
      CarCategory(
        id: 'suv',
        name: 'SUV',
        icon: '🚙',
        description: 'Spacious and versatile',
      ),
      CarCategory(
        id: 'hatchback',
        name: 'Hatchback',
        icon: '🚘',
        description: 'Compact and efficient',
      ),
      CarCategory(
        id: 'coupe',
        name: 'Coupe',
        icon: '🏎️',
        description: 'Sporty two-door cars',
      ),
      CarCategory(
        id: 'truck',
        name: 'Truck',
        icon: '🚚',
        description: 'Heavy-duty vehicles',
      ),
      CarCategory(
        id: 'convertible',
        name: 'Convertible',
        icon: '🚔',
        description: 'Open-top driving experience',
      ),
    ];
  }

  static List<Car> getCars() {
    return [
      // Sedans
      Car(
        id: '1',
        make: 'Toyota',
        model: 'Camry',
        year: 2022,
        price: 28500.00,
        category: 'sedan',
        imageUrl:
            'https://via.placeholder.com/300x200/0066CC/FFFFFF?text=Toyota+Camry',
        description:
            'Reliable and fuel-efficient sedan with excellent safety ratings.',
        mileage: 15000,
        fuelType: 'Gasoline',
        transmission: 'Automatic',
        condition: 'Excellent',
        location: 'Los Angeles, CA',
        sellerName: 'John Smith',
        sellerPhone: '+1-555-0123',
        listedDate: DateTime.now().subtract(const Duration(days: 5)),
      ),
      Car(
        id: '2',
        make: 'Honda',
        model: 'Accord',
        year: 2021,
        price: 26900.00,
        category: 'sedan',
        imageUrl:
            'https://via.placeholder.com/300x200/FF6600/FFFFFF?text=Honda+Accord',
        description: 'Spacious interior with advanced technology features.',
        mileage: 22000,
        fuelType: 'Gasoline',
        transmission: 'Automatic',
        condition: 'Good',
        location: 'New York, NY',
        sellerName: 'Sarah Johnson',
        sellerPhone: '+1-555-0124',
        listedDate: DateTime.now().subtract(const Duration(days: 3)),
      ),
      // SUVs
      Car(
        id: '3',
        make: 'Ford',
        model: 'Explorer',
        year: 2023,
        price: 42000.00,
        category: 'suv',
        imageUrl:
            'https://via.placeholder.com/300x200/009900/FFFFFF?text=Ford+Explorer',
        description:
            'Family-friendly SUV with 3-row seating and advanced safety features.',
        mileage: 8500,
        fuelType: 'Gasoline',
        transmission: 'Automatic',
        condition: 'Excellent',
        location: 'Chicago, IL',
        sellerName: 'Mike Davis',
        sellerPhone: '+1-555-0125',
        listedDate: DateTime.now().subtract(const Duration(days: 1)),
      ),
      Car(
        id: '4',
        make: 'BMW',
        model: 'X5',
        year: 2022,
        price: 58000.00,
        category: 'suv',
        imageUrl:
            'https://via.placeholder.com/300x200/CC0000/FFFFFF?text=BMW+X5',
        description: 'Luxury SUV with premium interior and powerful engine.',
        mileage: 12000,
        fuelType: 'Gasoline',
        transmission: 'Automatic',
        condition: 'Excellent',
        location: 'Miami, FL',
        sellerName: 'Lisa Anderson',
        sellerPhone: '+1-555-0126',
        listedDate: DateTime.now().subtract(const Duration(days: 7)),
      ),
      // Hatchbacks
      Car(
        id: '5',
        make: 'Volkswagen',
        model: 'Golf',
        year: 2021,
        price: 22500.00,
        category: 'hatchback',
        imageUrl:
            'https://via.placeholder.com/300x200/9900CC/FFFFFF?text=VW+Golf',
        description: 'Compact and efficient with excellent handling.',
        mileage: 18000,
        fuelType: 'Gasoline',
        transmission: 'Manual',
        condition: 'Good',
        location: 'Seattle, WA',
        sellerName: 'David Wilson',
        sellerPhone: '+1-555-0127',
        listedDate: DateTime.now().subtract(const Duration(days: 4)),
      ),
      Car(
        id: '6',
        make: 'Mazda',
        model: 'Mazda3',
        year: 2023,
        price: 24800.00,
        category: 'hatchback',
        imageUrl:
            'https://via.placeholder.com/300x200/FF9900/FFFFFF?text=Mazda3',
        description:
            'Stylish hatchback with premium interior and great fuel economy.',
        mileage: 5000,
        fuelType: 'Gasoline',
        transmission: 'Automatic',
        condition: 'Excellent',
        location: 'Austin, TX',
        sellerName: 'Emma Brown',
        sellerPhone: '+1-555-0128',
        listedDate: DateTime.now().subtract(const Duration(days: 2)),
      ),
      // Coupes
      Car(
        id: '7',
        make: 'Ford',
        model: 'Mustang',
        year: 2022,
        price: 45000.00,
        category: 'coupe',
        imageUrl:
            'https://via.placeholder.com/300x200/000066/FFFFFF?text=Ford+Mustang',
        description: 'Iconic American muscle car with powerful V8 engine.',
        mileage: 8000,
        fuelType: 'Gasoline',
        transmission: 'Manual',
        condition: 'Excellent',
        location: 'Dallas, TX',
        sellerName: 'Robert Garcia',
        sellerPhone: '+1-555-0129',
        listedDate: DateTime.now().subtract(const Duration(days: 6)),
      ),
      // Trucks
      Car(
        id: '8',
        make: 'Chevrolet',
        model: 'Silverado',
        year: 2023,
        price: 52000.00,
        category: 'truck',
        imageUrl:
            'https://via.placeholder.com/300x200/666600/FFFFFF?text=Chevy+Silverado',
        description: 'Heavy-duty pickup truck perfect for work and recreation.',
        mileage: 6500,
        fuelType: 'Gasoline',
        transmission: 'Automatic',
        condition: 'Excellent',
        location: 'Denver, CO',
        sellerName: 'James Martinez',
        sellerPhone: '+1-555-0130',
        listedDate: DateTime.now().subtract(const Duration(days: 8)),
      ),
      // Convertibles
      Car(
        id: '9',
        make: 'BMW',
        model: 'Z4',
        year: 2022,
        price: 62000.00,
        category: 'convertible',
        imageUrl:
            'https://via.placeholder.com/300x200/CC6600/FFFFFF?text=BMW+Z4',
        description:
            'Luxury convertible roadster with exceptional performance.',
        mileage: 9500,
        fuelType: 'Gasoline',
        transmission: 'Automatic',
        condition: 'Excellent',
        location: 'San Francisco, CA',
        sellerName: 'Jennifer Lee',
        sellerPhone: '+1-555-0131',
        listedDate: DateTime.now().subtract(const Duration(days: 10)),
      ),
    ];
  }

  static List<Car> getCarsByCategory(String categoryId) {
    return getCars().where((car) => car.category == categoryId).toList();
  }

  static List<Car> getFeaturedCars() {
    return getCars().take(4).toList();
  }
}
