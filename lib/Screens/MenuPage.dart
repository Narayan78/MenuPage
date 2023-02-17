import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:food_menu/Methods/FoodList.dart';
import 'package:food_menu/Screens/FoodDetails.dart';
import '../Methods/alartDialog.dart';

final priceProvider = StateProvider<double>((ref) => 0);

class MenuPage extends ConsumerWidget {
  const MenuPage({Key? key}) : super(key: key);

  void onOrder(WidgetRef ref, int price) {
    ref.read(priceProvider.notifier).update((state) => state + price);
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final price = ref.watch(priceProvider);

    return Scaffold(
      backgroundColor: Colors.black87,
      appBar: AppBar(
        actions: [
          TextButton(
            onPressed: () {},
            child: const Text(
              "Add ",
              style: TextStyle(color: Colors.white, fontSize: 20),
            ),
          )
        ],
        centerTitle: true,
        toolbarHeight: 90,
        title: Image.asset(
          "assets/MenuIcon.png",
          height: 80,
        ),
        backgroundColor: Colors.black87,
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(15.0),
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15.0),
                color: Colors.grey[850],
              ),
              child: const TextField(
                decoration: InputDecoration(
                  hintText: " Search",
                  hintStyle: TextStyle(
                      color: Color.fromARGB(255, 255, 255, 255),
                      fontSize: 20,
                      fontWeight: FontWeight.bold),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(15.0)),
                  ),
                ),
              ),
            ),
          ),
          Row(
            children: [
              const Text(
                "Food Menu",
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 30,
                    fontWeight: FontWeight.bold),
              ),
              const SizedBox(
                width: 90,
              ),
              Text(
                "Total Price: $price",
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 15,
                ),
              ),
            ],
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: ListView.builder(
                itemBuilder: (BuildContext context, int index) {
                  return Padding(
                    padding: const EdgeInsets.all(3.0),
                    child: InkWell(
                      child: Container(
                        decoration: BoxDecoration(
                          color: Colors.grey[500],
                          borderRadius: BorderRadius.circular(15.0),
                        ),
                        height: 100,
                        width: 100,
                        child: Row(
                          children: [
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Image.network(
                                FoodList[index].imageUrl,
                                height: 100,
                                width: 100,
                                
                              ),
                            ),
                            const SizedBox(
                              width: 5,
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                const SizedBox(
                                  height: 10,
                                ),
                                Text(
                                  FoodList[index].name,
                                  style: const TextStyle(
                                      color: Colors.white,
                                      fontSize: 25,
                                      fontWeight: FontWeight.bold),
                                ),
                                Text(
                                  FoodList[index].description,
                                  style: const TextStyle(
                                    color: Colors.white,
                                    fontSize: 18,
                                  ),
                                ),
                                Text(
                                  "Rs   ${FoodList[index].price}   Only",
                                  style: const TextStyle(
                                    color: Colors.white,
                                    fontSize: 18,
                                  ),
                                ),
                              ],
                            ),
                            Column(
                              children: [
                                const SizedBox(
                                  height: 50,
                                ),
                                InkWell(
                                  child: Container(
                                    height: 30,
                                    width: 55,
                                    decoration: BoxDecoration(
                                      color: const Color.fromARGB(
                                          255, 53, 226, 186),
                                      borderRadius: BorderRadius.circular(10.0),
                                    ),
                                    child: const Center(child: Text("Order")),
                                  ),
                                  onTap: () {
                                    onOrder(ref, int.parse(FoodList[index].price));
                                  },
                                ),
                              ],
                            )
                          ],
                        ),
                      ),
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => FoodDetailsPage(
                              index: index,
                            ),
                          ),
                        );
                      },
                    ),
                  );
                },
                itemCount: FoodList.length,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
