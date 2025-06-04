import 'package:myapp/data/models/car.dart';
import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong2/latlong.dart';

class MapsDetailPage extends StatelessWidget {
  final Car car;

  const MapsDetailPage({super.key, required this.car});

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;

    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () => Navigator.pop(context),
        ),
      ),
      body: Stack(
        children: [
          FlutterMap(
            options: MapOptions(
              initialCenter: const LatLng(34.203899,74.354401),
              initialZoom: 13.0,
            ),
            children: [
              TileLayer(
                urlTemplate:
                    "https://{s}.tile.openstreetmap.org/{z}/{x}/{y}.png",
                    subdomains: ['a','b','c'],
              ),
            ],
          ),
          Positioned(
            bottom: 0,
            left: 0,
            right: 0,
            child: carDetailsCard(car: car, height: height),
          ),
        ],
      ),
    );
  }
}
Widget carDetailsCard({required Car car, required double height}) {
  return SizedBox(
    height: height * 0.55,
    child: Stack(
      children: [
        // DARK BACKGROUND SECTION
        Container(
          padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
          width: double.infinity,
          decoration: BoxDecoration(
            color: Colors.black54,
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(30),
              topRight: Radius.circular(30),
            ),
            boxShadow: const [
              BoxShadow(
                color: Colors.black54,
                spreadRadius: 0,
                blurRadius: 10,
              )
            ],
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 20),
              Text(
                car.model,
                style: const TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
              const SizedBox(height: 10),
              Row(
                children: [
                  Icon(Icons.directions_car, color: Colors.white, size: 16),
                  SizedBox(width: 5),
                  Text(
                    '> ${car.distance} km',
                    style: TextStyle(color: Colors.white, fontSize: 14),
                  ),
                  SizedBox(width: 10),
                  Icon(Icons.battery_full, color: Colors.white, size: 16),
                  SizedBox(width: 5),
                  Text(
                    car.fuelCapacity.toString(),
                    style: TextStyle(color: Colors.white, fontSize: 14),
                  ),
                ],
              ),
            ],
          ),
        ),

        // WHITE BOTTOM CARD SECTION
        Positioned(
          bottom: 0,
          left: 0,
          right: 0,
          child: Container(
            padding: EdgeInsets.all(20),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(20),
                topRight: Radius.circular(20),
              ),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Features",
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 10),
                featureIcons(),
                SizedBox(height: 20),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      '${car.pricePerHour}/day',
                      style: TextStyle(
                        fontSize: 22,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    ElevatedButton(
                      onPressed: () {},
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.black,
                      ),
                      child: Text(
                        'Book Now',
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                  ],
                )
              ],
            ),
          ),
        ),

        // CAR IMAGE
        Positioned(
          top: 20,
          right: 10,
          child: Image.network(
            car.imageUrl,
            height: height * 0.25,
            width: 200,
            fit: BoxFit.contain,
          ),
        ),
      ],
    ),
  );
}
Widget featureIcons() {
  return Row(
    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
    children: [
      featureIcon(Icons.local_gas_station, 'Fuel Type', 'Petrol'),
      featureIcon(Icons.speed, 'Top Speed', '220km/h'),
      featureIcon(Icons.ac_unit, 'Temp Control', 'Included'),
    ],
  );
}

Widget featureIcon(IconData icon, String title, String subtitle) {
  return Flexible(
    child: Container(
      padding: EdgeInsets.all(8),
      margin: EdgeInsets.symmetric(horizontal: 5),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        border: Border.all(color: Colors.grey, width: 1),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(icon, size: 28),
          SizedBox(height: 4),
          Text(title, style: TextStyle(fontSize: 12)),
          Text(subtitle,
              style: TextStyle(color: Colors.grey, fontSize: 10),
              textAlign: TextAlign.center),
        ],
      ),
    ),
  );
}
