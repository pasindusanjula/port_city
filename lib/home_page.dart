import 'package:flutter/material.dart';
import 'details_page.dart'; // Import the DetailsPage

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        bottom: PreferredSize(
          child: Container(),
          preferredSize: Size.fromHeight(40.0),
        ),
        backgroundColor: Colors.blue,
        title: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Image.asset(
              'assets/logo.png', // Replace with your logo path
              height: 70, // Adjust height
              width: 70, // Adjust width
            ),
            const SizedBox(width: 15), // Space between logo and text
            const Expanded(
              child: Text(
                'Mahapola Ports and Maritime Academy Sri Lanka',
                maxLines: 3, // Limit to 2 lines
                overflow: TextOverflow.ellipsis, // Add ellipsis if text overflows
                style: TextStyle(
                  fontSize: 18,
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ],
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.menu),
            onPressed: () {
              // Add functionality for the menu
            },
          ),
        ],
      ),
      body: Stack(
        fit: StackFit.expand,
        children: [
          // Background Image
          Image.asset(
            'assets/now.png', // Replace with your background image path
            fit: BoxFit.cover,
          ),
          // Semi-transparent overlay
          Container(
            color: Colors.black.withOpacity(0.4),
          ),
          // Main content
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 20),
                // Header Text
                const Center(
                  child: Text(
                    'Today List',
                    style: TextStyle(
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                ),
                const SizedBox(height: 20),
                // List of Cards
                Expanded(
                  child: ListView(
                    children: [
                      // First Card
                      _buildCard(
                        context,
                        vehicleModel: 'Car',
                        vehicleNo: 'KB 9138',
                        driverName: 'A K D Silva',
                      ),
                      const SizedBox(height: 10),
                      // Second Card
                      _buildCard(
                        context,
                        vehicleModel: 'Van',
                        vehicleNo: 'KV 9188',
                        driverName: 'W P D Alwis',
                      ),
                      const SizedBox(height: 10),
                      // Third Card
                      _buildCard(
                        context,
                        vehicleModel: 'Bus',
                        vehicleNo: 'NC 0138',
                        driverName: 'W S Lakmal',
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  // Helper method to create cards
  Widget _buildCard(
      BuildContext context, {
        required String vehicleModel,
        required String vehicleNo,
        required String driverName,
      }) {
    return GestureDetector(
      onTap: () {
        // Navigate to the details page when the card is tapped
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => DetailsPage(
              vehicleNo: vehicleNo,
              driverName: driverName,
            ),
          ),
        );
      },
      child: Card(
        color: Colors.white.withOpacity(0.9),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15),
        ),
        elevation: 4,
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Vehicle Model : $vehicleModel',
                style: const TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 8),
              Text(
                'Vehicle No : $vehicleNo',
                style: const TextStyle(
                  fontSize: 16,
                ),
              ),
              const SizedBox(height: 8),
              Text(
                'Driver name : $driverName',
                style: const TextStyle(
                  fontSize: 16,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
