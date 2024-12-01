import 'package:flutter/material.dart';

class DetailsPage extends StatefulWidget {
  final String vehicleNo;
  final String driverName;

  const DetailsPage({super.key, required this.vehicleNo, required this.driverName});

  @override
  State<DetailsPage> createState() => _DetailsPageState();
}

class _DetailsPageState extends State<DetailsPage> {
  TimeOfDay? upTime;
  TimeOfDay? downTime;

  Future<void> _pickTime(bool isUpTime) async {
    final TimeOfDay? pickedTime = await showTimePicker(
      context: context,
      initialTime: TimeOfDay.now(),
    );

    if (pickedTime != null) {
      setState(() {
        if (isUpTime) {
          upTime = pickedTime;
        } else {
          downTime = pickedTime;
        }
      });
    }
  }

  void _startQRScan() {
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text('QR Scan functionality to be implemented')),
    );
  }

  void _submitDetails() {
    if (upTime != null && downTime != null) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(
            'Submitted!\nUp Time: ${upTime!.format(context)}\nDown Time: ${downTime!.format(context)}',
          ),
        ),
      );
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Please select both UP and DOWN times before submitting')),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        bottom: PreferredSize(
          preferredSize: const Size.fromHeight(40.0),
          child: Container(),
        ),
        backgroundColor: Colors.blue,
        leading: Image.asset(
          'assets/logo.png',
          height: 70,
          width: 70,
        ),
        title: const Text(
          'Details Page',
          style: TextStyle(color: Colors.white),
        ),
        foregroundColor: Colors.black,
      ),
      body: Stack(
        fit: StackFit.expand,
        children: [
          // Background Image
          Image.asset(
            'assets/now.png',
            fit: BoxFit.cover,
          ),
          // Semi-transparent overlay
          Container(
            color: Colors.black.withOpacity(0.4),
          ),
          // Main content
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Card(
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
              elevation: 5,
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Vehicle No: ${widget.vehicleNo}',
                      style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.black),
                    ),
                    const SizedBox(height: 10),
                    Text(
                      'Driver Name: ${widget.driverName}',
                      style: const TextStyle(fontSize: 16, color: Colors.black),
                    ),
                    const SizedBox(height: 20),
                    ElevatedButton(
                      onPressed: _startQRScan,
                      style: ElevatedButton.styleFrom(backgroundColor: Colors.red),
                      child: const Text('QR Scan', style: TextStyle(color: Colors.white)),
                    ),
                    const SizedBox(height: 20),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Column(
                          children: [
                            ElevatedButton(
                              onPressed: () => _pickTime(true),
                              style: ElevatedButton.styleFrom(backgroundColor: Colors.blue),
                              child: const Text('UP', style: TextStyle(color: Colors.white)),
                            ),
                            const SizedBox(height: 10),
                            Text(
                              upTime != null ? upTime!.format(context) : '9:00 AM',
                              style: const TextStyle(fontSize: 16, color: Colors.black),
                            ),
                          ],
                        ),
                        Column(
                          children: [
                            ElevatedButton(
                              onPressed: () => _pickTime(false),
                              style: ElevatedButton.styleFrom(backgroundColor: Colors.red),
                              child: const Text('DOWN', style: TextStyle(color: Colors.white)),
                            ),
                            const SizedBox(height: 10),
                            Text(
                              downTime != null ? downTime!.format(context) : '3:00 PM',
                              style: const TextStyle(fontSize: 16, color: Colors.black),
                            ),
                          ],
                        ),
                      ],
                    ),
                    const Spacer(),
                    // Submit Button
                    Center(
                      child: ElevatedButton(
                        onPressed: _submitDetails,
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.green,
                          padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 12),
                        ),
                        child: const Text(
                          'Submit',
                          style: TextStyle(color: Colors.white, fontSize: 16),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
