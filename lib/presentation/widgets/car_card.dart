
import 'package:flutter/material.dart';
import 'package:myapp/data/models/car.dart';
import 'package:myapp/presentation/pages/car_details_page.dart';

class CarCard extends StatelessWidget {
  final Car car;

  const CarCard({super.key, required this.car});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => CarDetailsPage(
                      car: car,
                    )));
      },
      child: Container(
        margin: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
        padding: const EdgeInsets.all(20),
        decoration: BoxDecoration(
          color: const Color(0xffF3F3F3),
          borderRadius: BorderRadius.circular(20),
          boxShadow: const [
            BoxShadow(
              color: Colors.black12,
              blurRadius: 10,
              spreadRadius: 5,
            ),
          ],
        ),
        child: Column(
          children: [
           
          
            Image.network(
              car.imageUrl,
              height: 150,
              width: 200,
            ),
            const SizedBox(height: 10),
            Text(
              car.model,
              style: const TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 20,
              ),
            ),
            const SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    Row(
                      children: [
                        Image.asset('assets/gps.png'),
                        SizedBox(width: 3,),
                        Text('${car.distance.toStringAsFixed(0)}km'),
                      ],
                    ),
                    const SizedBox(width: 30), // Added some spacing
                    Row(
                      children: [
                        Image.asset('assets/pump.png'),
                        SizedBox(width: 3,),
                        Text('${car.fuelCapacity.toStringAsFixed(0)}L'),
                      ],
                    ),
                  ],
                ),
                Text(
                  '${car.pricePerHour.toStringAsFixed(2)}/day',
                  style: const TextStyle(
                    fontSize: 16,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
