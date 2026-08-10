import "package:flutter/material.dart";

class InputPage extends StatelessWidget {
  InputPage({super.key});

  final categories = [
    "Food",
    "Transportation",
    "Shopping",
    "Entertainment",
    "Health",
    "Education",
    "Bills",
    "Travel",
  ];

  final colors = [
  Colors.red,
  Colors.blue,
  Colors.green,
  Colors.orange,
  Colors.purple,
  Colors.teal,
  Colors.yellow,
  Colors.pink,
];

final icons = [
  Icons.fastfood,
  Icons.directions_car,
  Icons.shopping_cart,
  Icons.receipt,
  Icons.local_hospital,
  Icons.school,
  Icons.receipt_long,
  Icons.flight,
];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Expense Listing App"),
      ),
      body: GridView.builder(
        padding: const EdgeInsets.all(16),
        
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          crossAxisSpacing: 10,
          mainAxisSpacing: 10,
        ),
        itemCount: categories.length,
        itemBuilder: (context, index) {
          return Card(
            color: colors[index],
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(icons[index], size: 50, color: Colors.white),
                  const SizedBox(height: 8),
                  Text(
                    categories[index],
                    style: const TextStyle(color: Colors.white),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
      
