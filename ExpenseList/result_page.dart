import 'package:flutter/material.dart';

class ResultPage extends StatefulWidget {
  const ResultPage({super.key});

  @override
  State<ResultPage> createState() => _ResultPageState();
}

class _ResultPageState extends State<ResultPage> {
  List<Map<String, dynamic>> expenses = [];
  bool isLoaded = false;
  double totalAmount = 0.0;

  @override
  Widget build(BuildContext context) {
    if (!isLoaded) {
      expenses =
          ModalRoute.of(context)!.settings.arguments
              as List<Map<String, dynamic>>;

      totalAmount = expenses.fold(
        0.0,
        (sum, expense) =>
            sum + (double.tryParse(expense["amount"]) ?? 0.0),
      );

      isLoaded = true;
    }

    return Scaffold(
      appBar: AppBar(
        title: const Text("Expense List"),
        backgroundColor: Colors.deepOrange,
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            const Icon(
              Icons.receipt_long,
              size: 80,
              color: Colors.deepOrange,
            ),

            const SizedBox(height: 20),

            const Text(
              "Added Expenses",
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),

            const SizedBox(height: 20),

            Expanded(
              child: ListView.builder(
                itemCount: expenses.length,
                itemBuilder: (context, index) {
                  return Dismissible(
                    key: ValueKey(
                      "${expenses[index]["title"]}_${expenses[index]["amount"]}_${expenses[index]["category"]}",
                    ),
                    direction: DismissDirection.endToStart,

                    background: Container(
                      color: Colors.red,
                      alignment: Alignment.centerRight,
                      padding: const EdgeInsets.only(right: 20),
                      child: const Icon(
                        Icons.delete,
                        color: Colors.white,
                      ),
                    ),

                    onDismissed: (direction) {
                      setState(() {
                        expenses.removeAt(index);

                        totalAmount = expenses.fold(
                          0.0,
                          (sum, expense) =>
                              sum +
                              (double.tryParse(expense["amount"]) ?? 0.0),
                        );
                      });

                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(
                          content: Text("Expense Deleted"),
                        ),
                      );
                    },

                    child: Card(
                      elevation: 3,
                      child: ListTile(
                        leading: CircleAvatar(
                          child: Text("${index + 1}"),
                        ),

                        title: Text(
                          expenses[index]["title"],
                        ),

                        subtitle: Text(
                          expenses[index]["category"],
                        ),

                        trailing: Text(
                          "PKR ${expenses[index]["amount"]}",
                          style: const TextStyle(
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),

            const SizedBox(height: 20),

            Card(
              color: Colors.orange.shade100,
              child: Padding(
                padding: const EdgeInsets.all(16),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text(
                      "Total Expenses",
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),

                    Text(
                      "PKR ${totalAmount.toStringAsFixed(2)}",
                      style: const TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Colors.deepOrange,
                      ),
                    ),
                  ],
                ),
              ),
            ),

            const SizedBox(height: 20),

            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                child: const Text(
                  "Add More",
                  style: TextStyle(
                    fontSize: 18,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
