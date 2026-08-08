import 'package:flutter/material.dart';

class InputPage extends StatefulWidget {
  const InputPage({super.key});

  @override
  State<InputPage> createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {
  List<Map<String, dynamic>> expenses = [];

  final _formKey = GlobalKey<FormState>();

  final titleController = TextEditingController();
  final amountController = TextEditingController();

  String selectedCategory = "Food";

  @override
  void dispose() {
    titleController.dispose();
    amountController.dispose();
    super.dispose();
  }

  void addExpense() {
    expenses.add({
      "title": titleController.text,
      "amount": amountController.text,
      "category": selectedCategory,
    });

    titleController.clear();
    amountController.clear();

    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Expense Form"),
        backgroundColor: Colors.deepOrange,
      ),
      body: Center(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(25),
            child: Form(
              key: _formKey,
              child: Column(
                children: [
                  const Icon(
                    Icons.receipt_long,
                    size: 80,
                    color: Colors.deepOrangeAccent,
                  ),

                  const SizedBox(height: 25),

                  // Expense Title
                  TextFormField(
                    controller: titleController,
                    decoration: const InputDecoration(
                      labelText: "Expense Title",
                      hintText: "Milk",
                      border: OutlineInputBorder(),
                    ),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return "Please enter a title";
                      }
                      return null;
                    },
                  ),

                  const SizedBox(height: 20),

                  // Amount
                  TextFormField(
                    controller: amountController,
                    keyboardType: TextInputType.number,
                    decoration: const InputDecoration(
                      labelText: "Amount",
                      hintText: "200",
                      border: OutlineInputBorder(),
                      suffixText: "PKR",
                    ),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return "Please enter an amount";
                      }

                      if (double.tryParse(value) == null) {
                        return "Enter a valid number";
                      }

                      return null;
                    },
                  ),

                  const SizedBox(height: 20),

                  // Category
                  DropdownButtonFormField<String>(
                    initialValue: selectedCategory,
                    decoration: const InputDecoration(
                      labelText: "Category",
                      border: OutlineInputBorder(),
                    ),
                    items: const [
                      DropdownMenuItem(
                        value: "Food",
                        child: Text("Food"),
                      ),
                      DropdownMenuItem(
                        value: "Transport",
                        child: Text("Transport"),
                      ),
                      DropdownMenuItem(
                        value: "Shopping",
                        child: Text("Shopping"),
                      ),
                      DropdownMenuItem(
                        value: "Bills",
                        child: Text("Bills"),
                      ),
                      DropdownMenuItem(
                        value: "Other",
                        child: Text("Other"),
                      ),
                    ],
                    onChanged: (value) {
                      setState(() {
                        selectedCategory = value!;
                      });
                    },
                  ),

                  const SizedBox(height: 30),

                  // Add Item Button
                  SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                      onPressed: () {
                        if (_formKey.currentState!.validate()) {
                          addExpense();
                        }
                      },
                      child: const Text("Add Item"),
                    ),
                  ),

                  const SizedBox(height: 20),

                  // Finish Button
                  SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                      onPressed: () {
                        if (expenses.isEmpty) {
                          ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(
                              content: Text(
                                "Please add at least one expense.",
                              ),
                            ),
                          );
                          return;
                        }

                        Navigator.pushNamed(
                          context,
                          "/display",
                          arguments: expenses,
                        );
                      },
                      child: const Text("Finish"),
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
