import 'package:flutter/material.dart';

import 'home_page.dart';

class PasiApp extends StatelessWidget {
  const PasiApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.blue,
          bottom: const PreferredSize(
            child: SizedBox(), // Empty space for additional height
            preferredSize: Size.fromHeight(40.0), // Add extra height if needed
          ),
          title: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              // Scaled and padded logo
              Padding(
                padding: const EdgeInsets.only(top: 10.0, bottom: 10.0), // Padding above and below
                child: Image.asset(
                  'assets/logo.png', // Your logo image path
                  height: 70, // Adjust height for clarity
                  width: 70, // Adjust width for clarity
                ),
              ),
              const SizedBox(width: 15), // Adjust spacing between image and text
              // Title text with proper padding and alignment
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.only(top: 10.0), // Move text slightly down
                  child: Text(
                    'Mahapola Ports and Maritime Academy Sri Lanka',
                    maxLines: 3, // Limit to 3 lines
                    overflow: TextOverflow.ellipsis, // Ellipsis for overflow
                    style: const TextStyle(
                      fontSize: 18, // Reduce font size slightly
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
            ],
          ),
          actions: [
            IconButton(
              icon: const Icon(Icons.menu),
              onPressed: () {}, // Add functionality for the menu if needed
            ),
          ],
        ),
        body: Stack(
          fit: StackFit.expand,
          children: [
            // Background Image
            Image.asset(
              'assets/now.png', // Path to your background image
              fit: BoxFit.cover,
            ),
            // Semi-transparent overlay
            Container(
              color: Colors.black.withOpacity(0.4),
            ),
            // Main content
            SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    const SizedBox(height: 30), // Space from the top
                    // Title Text
                    const Text(
                      'WELCOME\nTO PORTS AUTHORITY TRANSPORT SYSTEM',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                        letterSpacing: 1.2,
                      ),
                    ),
                    const SizedBox(height: 30), // Space between title and form
                    // Login Form
                    Container(
                      padding: const EdgeInsets.all(20.0),
                      decoration: BoxDecoration(
                        color: Colors.white.withOpacity(0.9),
                        borderRadius: BorderRadius.circular(15),
                      ),
                      child: Column(
                        children: [
                          const Text(
                            'LOGIN',
                            style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                              color: Colors.black,
                            ),
                          ),
                          const SizedBox(height: 20),
                          // ID Field
                          TextField(
                            decoration: InputDecoration(
                              labelText: 'Enter your ID',
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10),
                              ),
                              filled: true,
                              fillColor: Colors.white,
                            ),
                          ),
                          const SizedBox(height: 20),
                          // Password Field
                          TextField(
                            obscureText: true,
                            decoration: InputDecoration(
                              labelText: 'Password',
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10),
                              ),
                              filled: true,
                              fillColor: Colors.white,
                            ),
                          ),
                          const SizedBox(height: 20),
                          // Login Button
                          ElevatedButton(
                            onPressed: () {
                              Navigator.push(
                                  context, MaterialPageRoute(
                                  builder: (context)=>HomePage()
                              )
                              );
                              // Add login functionality here
                            },
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.orange,
                              padding: const EdgeInsets.symmetric(
                                vertical: 15.0,
                                horizontal: 40.0,
                              ),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10),
                              ),
                            ),
                            child: const Text(
                              'Login',
                              style: TextStyle(
                                fontSize: 18,
                                color: Colors.white,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
