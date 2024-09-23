import 'package:flutter/material.dart';
import 'package:restaurant_app/model/data_model.dart';

class RestaurantDetailScreen extends StatelessWidget {
  final Restaurant restaurant;
  const RestaurantDetailScreen({super.key, required this.restaurant});

  @override
  Widget build(BuildContext context) {
    double screen = MediaQuery.of(context).size.width;
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.blue,
          foregroundColor: Colors.white,
        ),
        body: Padding(
          padding: const EdgeInsets.all(16.0),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(10),
                  child: Image.network(restaurant.pictureId),
                ),
                const SizedBox(height: 20),
                Text(
                  restaurant.name,
                  style: const TextStyle(
                      fontWeight: FontWeight.bold, fontSize: 24),
                ),
                Row(
                  children: [
                    const Icon(
                      Icons.location_on,
                      size: 15,
                    ),
                    const SizedBox(width: 3),
                    Text(restaurant.city),
                    Container(
                      margin: const EdgeInsets.symmetric(horizontal: 10),
                      child: const Text(" |"),
                    ),
                    const Icon(
                      Icons.star,
                      size: 15,
                    ),
                    const SizedBox(width: 3),
                    Text("${restaurant.rating}"),
                  ],
                ),
                const SizedBox(height: 20),
                const Text(
                  'DESKRIPSI',
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                Text(restaurant.description),
                const SizedBox(height: 30),
                const Text(
                  'MAKANAN',
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                SizedBox(
                  height: 150,
                  width: screen,
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: restaurant.menus.foods.length,
                    itemBuilder: (context, index) {
                      final food = restaurant.menus.foods[index];
                      return Padding(
                        padding: index != 0 &&
                                index != restaurant.menus.foods.length - 1
                            ? const EdgeInsets.symmetric(horizontal: 5)
                            : index == 0
                                ? const EdgeInsets.only(right: 5)
                                : const EdgeInsets.only(left: 5),
                        child: Stack(
                          children: [
                            ClipRRect(
                              borderRadius: BorderRadius.circular(10),
                              child: Image.asset(
                                'assets/images/food.jpg',
                                width: 200,
                                height: 150,
                                fit: BoxFit.cover,
                              ),
                            ),
                            Positioned(
                              bottom: 5,
                              left: 10,
                              child: Text(
                                food.name,
                                style: const TextStyle(
                                    fontWeight: FontWeight.w500),
                              ),
                            ),
                          ],
                        ),
                      );
                    },
                  ),
                ),
                const SizedBox(height: 40),
                const Text(
                  'MINUMAN',
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                SizedBox(
                  height: 150,
                  width: screen,
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: restaurant.menus.drinks.length,
                    itemBuilder: (context, index) {
                      final drink = restaurant.menus.drinks[index];
                      return Padding(
                        padding: index != 0 &&
                                index != restaurant.menus.drinks.length - 1
                            ? const EdgeInsets.symmetric(horizontal: 5)
                            : index == 0
                                ? const EdgeInsets.only(right: 5)
                                : const EdgeInsets.only(left: 5),
                        child: Stack(
                          children: [
                            ClipRRect(
                              borderRadius: BorderRadius.circular(10),
                              child: Image.asset(
                                'assets/images/drink.jpg',
                                width: 200,
                                height: 150,
                                fit: BoxFit.cover,
                              ),
                            ),
                            Positioned(
                              bottom: 5,
                              left: 10,
                              child: Text(
                                drink.name,
                                style: const TextStyle(
                                    fontWeight: FontWeight.w500),
                              ),
                            ),
                          ],
                        ),
                      );
                    },
                  ),
                ),
                const SizedBox(height: 20),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
