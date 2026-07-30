import 'package:flutter/material.dart';

class ResultPage extends StatelessWidget {
  const ResultPage({super.key});

  @override
  Widget build(BuildContext context) {
    final expenses =
        ModalRoute.of(context)!.settings.arguments
            as List<Map<String, dynamic>>;

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

                  return Card(
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
                        "${expenses[index]["currency"]} ${expenses[index]["amount"]}",
                        style: const TextStyle(
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  );
                },
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
                  style: TextStyle(fontSize: 18),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
