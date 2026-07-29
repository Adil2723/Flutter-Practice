import 'package:flutter/material.dart';

class ResultPage extends StatelessWidget {
  const ResultPage({super.key});

  String getRemarks(double bmi) {
    if (bmi < 18.5) {
      return "Underweight";
    } else if (bmi < 25) {
      return "Balanced Weight";
    } else if (bmi < 30) {
      return "Overweight";
    } else {
      return "Obese";
    }
  }

  @override
  Widget build(BuildContext context) {

    final data =
        ModalRoute.of(context)!.settings.arguments
            as Map<String, dynamic>;

    double height = data["height"];
    double weight = data["weight"];
    String heightUnit = data["heightUnit"];
    String weightUnit = data["weightUnit"];
    double bmi = data["bmi"];

    return Scaffold(
      appBar: AppBar(
        title: const Text("BMI Result"),
        backgroundColor: const Color.fromARGB(255, 52, 19, 110),
      ),

      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(25),

          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [

              const CircleAvatar(
                radius: 45,
                backgroundColor: Colors.deepPurple,
                child: Icon(
                  Icons.monitor_weight,
                  color: Colors.white,
                  size: 45,
                ),
              ),

              const SizedBox(height: 30),

              const Text(
                "BMI Readings",
                style: TextStyle(
                  fontSize: 25,
                  fontWeight: FontWeight.bold,
                ),
              ),

              const SizedBox(height: 30),

              Card(
                elevation: 5,
                child: Padding(
                  padding: const EdgeInsets.all(20),
                  child: Column(
                    children: [

                      ListTile(
                        leading: const Icon(Icons.height),
                        title: const Text("Height"),
                        trailing: Text(
                          "$height $heightUnit",
                        ),
                      ),

                      const Divider(),

                      ListTile(
                        leading: const Icon(Icons.monitor_weight),
                        title: const Text("Weight"),
                        trailing: Text(
                          "$weight $weightUnit",
                        ),
                      ),

                      const Divider(),

                      ListTile(
                        leading: const Icon(Icons.calculate),
                        title: const Text("BMI"),
                        trailing: Text(
                          bmi.toStringAsFixed(2),
                          style: const TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 18,
                          ),
                        ),
                      ),

                    ],
                  ),
                ),
              ),

              const SizedBox(height: 25),

              Text(
                "Remarks",
                style: TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                ),
              ),

              const SizedBox(height: 10),

              Text(
                getRemarks(bmi),
                style: const TextStyle(
                  fontSize: 20,
                  color: Colors.deepPurple,
                  fontWeight: FontWeight.bold,
                ),
              ),

              const SizedBox(height: 40),

              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: const Padding(
                    padding: EdgeInsets.symmetric(vertical: 15),
                    child: Text(
                      "Calculate Again",
                      style: TextStyle(
                        fontSize: 18,
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
