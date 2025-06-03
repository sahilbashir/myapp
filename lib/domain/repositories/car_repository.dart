import 'package:myapp/data/models/car.dart';

abstract class CarRepository {
  Future<List<Car>> fetchCars();
}