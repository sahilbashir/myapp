class Car {
  final String model;
  final double distance;
  final double fuelCapacity;
  final int pricePerHour;
  final String imageUrl;

  Car({
    required this.model,
    required this.distance,
    required this.fuelCapacity,
    required this.pricePerHour,
    required this.imageUrl
  });

  factory Car.fromMap(Map<String, dynamic> map) {
    return Car(
      model: map['model'],
      distance: map['distance'],
      fuelCapacity: map['fuelCapacity'],
      pricePerHour: map['pricePerHour'],
      imageUrl: map['imageUrl']
    );
  }
}
