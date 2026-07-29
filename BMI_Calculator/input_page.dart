import 'package:flutter/material.dart';

class InputPage extends StatefulWidget {
  const InputPage({super.key});

  @override
  State<InputPage> createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {
  final _formKey = GlobalKey<FormState>();

  final heightController = TextEditingController();
  final weightController = TextEditingController();

  String selectedHeightUnit = "cm";
  String selectedWeightUnit = "kg";


  double convertHeight(double height, String unit) {
    switch (unit) {
      case "cm":
        return height / 100;
      case "m":
        return height;
      case "inch":
        return height * 0.0254;
      case "feet":
        return height * 0.3048;
      default:
        return height;
    }
  }

  double convertWeight(double weight, String unit) {
    switch (unit) {
      case "kg":
        return weight;
      case "g":
        return weight / 1000;
      case "lb":
        return weight * 0.45359237;
      default:
        return weight;
    }
  }

  double calculateBMI(double heightInMeters, double weightInKilograms) {
    if (heightInMeters <= 0) {
      return 0;
    }
    return weightInKilograms / (heightInMeters * heightInMeters);
  }

  @override
  void dispose() {
    heightController.dispose();
    weightController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("BMI Calculator"),
        backgroundColor: const Color.fromARGB(255, 52, 19, 110),
      ),
      body: Center(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(25),
            child: Form(
              key: _formKey,
              child: Column(
                children: [
                  const CircleAvatar(
                    radius: 45,
                    backgroundColor: Colors.deepPurple,
                    child: Icon(
                      Icons.monitor_weight,
                      size: 45,
                      color: Colors.white,
                    ),
                  ),

                  const SizedBox(height: 25),

                  const Text(
                    "Enter Your Details",
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                    ),
                  ),

                  const SizedBox(height: 25),

                  // HEIGHT
                  TextFormField(
                    controller: heightController,
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(
                      labelText: "Height",
                      hintText: "Enter Height",
                      border: const OutlineInputBorder(),

                      suffixIcon: DropdownButton<String>(
                        value: selectedHeightUnit,
                        underline: const SizedBox(),
                        items: const [
                          DropdownMenuItem(
                            value: "cm",
                            child: Text("cm"),
                          ),
                          DropdownMenuItem(
                            value: "m",
                            child: Text("m"),
                          ),
                          DropdownMenuItem(
                            value: "feet",
                            child: Text("ft"),
                          ),
                          DropdownMenuItem(
                            value: "inch",
                            child: Text("in"),
                          ),
                          
                        ],
                        onChanged: (value) {
                          setState(() {
                            selectedHeightUnit = value!;
                          });
                        },
                      ),
                    ),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return "Height is required";
                      }

                      return null;
                    },
                  ),

                  const SizedBox(height: 20),

                  // WEIGHT
                  TextFormField(
                    controller: weightController,
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(
                      labelText: "Weight",
                      hintText: "Enter Weight",
                      border: const OutlineInputBorder(),

                      suffixIcon: DropdownButton<String>(
                        value: selectedWeightUnit,
                        underline: const SizedBox(),
                        items: const [
                          DropdownMenuItem(
                            value: "kg",
                            child: Text("kg"),
                          ),
                          DropdownMenuItem(
                            value: "g",
                            child: Text("g"),
                          ),
                          DropdownMenuItem(
                            value: "lb",
                            child: Text("lb"),
                          ),
                        ],
                        onChanged: (value) {
                          setState(() {
                            selectedWeightUnit = value!;
                          });
                        },
                      ),
                    ),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return "Weight is required";
                      }

                      return null;
                    },
                  ),

                  const SizedBox(height: 30),

                  SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                      onPressed: () {
                      if (_formKey.currentState!.validate()) {

                        double height = double.parse(heightController.text);
                        double weight = double.parse(weightController.text);

                        double heightInMeters = convertHeight(height, selectedHeightUnit);
                        double weightInKg = convertWeight(weight, selectedWeightUnit);

                        double bmi = calculateBMI(heightInMeters, weightInKg);

                        Navigator.pushNamed(
                          context,
                            "/bmi",
                            arguments: {
                            "height": height,
                            "weight": weight,
                            "heightUnit": selectedHeightUnit,
                            "weightUnit": selectedWeightUnit,
                            "bmi": bmi,
                            },
                        );
                      }
                    },
                      child: const Padding(
                        padding: EdgeInsets.symmetric(vertical: 15),
                        child: Text(
                          "Calculate BMI",
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
