import 'package:flutter/material.dart';

class InputPage extends StatelessWidget {
  InputPage({super.key});

  final calculatorButtons = [
    "AC", "÷", "×", "←",
    "7", "8", "9", "−",
    "4", "5", "6", "+",
    "1", "2", "3", "=",
    "%", "0", ".", "",
  ];

  // Color theme
  final buttonColors = [
    const Color(0xFF6D1B1B), // AC - dark red
    const Color(0xFF4A2A75), // ÷
    const Color(0xFF4A2A75), // ×
    const Color(0xFF4A2A75), // ←

    const Color(0xFF111111), // 7
    const Color(0xFF111111), // 8
    const Color(0xFF111111), // 9
    const Color(0xFF4A2A75), // −

    const Color(0xFF111111), // 4
    const Color(0xFF111111), // 5
    const Color(0xFF111111), // 6
    const Color(0xFF4A2A75), // +

    const Color(0xFF111111), // 1
    const Color(0xFF111111), // 2
    const Color(0xFF111111), // 3
    const Color(0xFF4A2A75), // =

    const Color(0xFF111111), // %
    const Color(0xFF111111), // 0
    const Color(0xFF111111), // .
    const Color.fromARGB(255, 61, 60, 60),       // empty
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF181818),

      appBar: AppBar(
        title: const Row(
          children: [
            Text(
              "Calculator",
              style: TextStyle(
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(width: 8),
            Icon(Icons.calculate),
          ],
        ),
        backgroundColor: const Color(0xFF24113F),
        foregroundColor: Colors.white,
      ),

      body: Column(
        children: [
          Expanded(
            flex: 2,

            child: Container(
              width: double.infinity,
              padding: const EdgeInsets.all(25),

              alignment: Alignment.bottomRight,

              child: const Column(
                mainAxisAlignment: MainAxisAlignment.end,
                crossAxisAlignment: CrossAxisAlignment.end,

                children: [
                  Text(
                    "62 × 230",
                    style: TextStyle(
                      fontSize: 30,
                      color: Colors.white,
                    ),
                  ),

                  SizedBox(height: 10),

                  Text(
                    "14,260",
                    style: TextStyle(
                      fontSize: 20,
                      color: Colors.grey,
                    ),
                  ),
                ],
              ),
            ),
          ),

          Expanded(

            flex: 5,

            child: GridView.builder(
              padding: const EdgeInsets.all(16),

              gridDelegate:
                  const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 4,
                crossAxisSpacing: 10,
                mainAxisSpacing: 10,
                childAspectRatio: 1,
              ),

              itemCount: calculatorButtons.length,

              itemBuilder: (context, index) {
                return Card(
                  color: buttonColors[index],

                  elevation: 5,

                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(18),
                  ),

                  child: Center(
                    child: Text(
                      calculatorButtons[index],
                      style: const TextStyle(
                        fontSize: 24,
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
