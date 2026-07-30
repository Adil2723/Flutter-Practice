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

  String selectedCurrency = "PKR";
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
      "currency": selectedCurrency,
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

                  // Title
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
                    decoration: InputDecoration(
                      labelText: "Amount",
                      hintText: "200",
                      border: const OutlineInputBorder(),
                      suffixIcon: DropdownButton<String>(
                        value: selectedCurrency,
                        underline: const SizedBox(),
                        items: const [
                          DropdownMenuItem(
                            value: "PKR",
                            child: Text("Rs"),
                          ),
                          DropdownMenuItem(
                            value: "USD",
                            child: Text("\$"),
                          ),
                          DropdownMenuItem(
                            value: "EUR",
                            child: Text("€"),
                          ),
                          DropdownMenuItem(
                            value: "GBP",
                            child: Text("£"),
                          ),
                          DropdownMenuItem(
                            value: "CNY",
                            child: Text("¥"),
                          ),
                        ],
                        onChanged: (value) {
                          setState(() {
                            selectedCurrency = value!;
                          });
                        },
                      ),
                    ),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return "Please enter an amount";
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

                  const SizedBox(height: 30),

                  const Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      "Added Items",
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),

                  const SizedBox(height: 10),

                  ListView.builder(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    itemCount: expenses.length,
                    itemBuilder: (context, index) {
                      return Card(
                        child: ListTile(
                          leading: CircleAvatar(
                            child: Text("${index + 1}"),
                          ),
                          title: Text(expenses[index]["title"]),
                          subtitle: Text(expenses[index]["category"]),
                          trailing: Text(
                            "${expenses[index]["currency"]} ${expenses[index]["amount"]}",
                            style: const TextStyle(
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      );
                    },
                  ),

                  const SizedBox(height: 20),

                  SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                      onPressed: () {
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
