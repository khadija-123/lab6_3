import 'package:flutter/material.dart';

class CakeShopDashboard extends StatelessWidget {
  const CakeShopDashboard({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Cake Shop Dashboard"),
        backgroundColor: Colors.pinkAccent,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: GridView.count(
          crossAxisCount: 2,
          crossAxisSpacing: 16,
          mainAxisSpacing: 16,
          children: [
            _buildCard(
              context,
              color: Colors.green,
              title: "Total Sales",
              value: "\Rs 150,000",
              icon: Icons.attach_money,
              onTap: () => _showDetails(context, "Sales Data"),
            ),
            _buildCard(
              context,
              color: Colors.blue,
              title: "New Orders",
              value: "12 Orders",
              icon: Icons.shopping_cart,
              onTap: () => _showDetails(context, "View Orders"),
            ),
            _buildCard(
              context,
              color: Colors.orange,
              title: "Best-Selling Cakes",
              value: "Chocolate Cake",
              icon: Icons.cake,
              onTap: () => _showDetails(context, "View Best Sellers"),
            ),
            _buildCard(
              context,
              color: Colors.purple,
              title: "Customer Feedback",
              value: "4.8/5",
              icon: Icons.feedback,
              onTap: () => _showDetails(context, "Customer Reviews"),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildCard(
    BuildContext context, {
    required Color color,
    required String title,
    required String value,
    required IconData icon,
    required VoidCallback onTap,
  }) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(16),
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16),
        ),
        elevation: 5,
        color: color,
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                icon,
                color: Colors.white,
                size: 40,
              ),
              const SizedBox(height: 10),
              Text(
                title,
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 8),
              Text(
                value,
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void _showDetails(BuildContext context, String detailTitle) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text(detailTitle),
          content: const Text("Here are more details about this item."),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: const Text("Close"),
            ),
          ],
        );
      },
    );
  }
}
