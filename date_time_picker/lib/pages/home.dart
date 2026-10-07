import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  TextEditingController timePicker = TextEditingController();
  TextEditingController datePicker = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFFDF5F8),

      appBar: AppBar(
        title: const Text(
          "Date & Time Picker",
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 21,
          ),
        ),
        elevation: 0,
        centerTitle: true,
        backgroundColor: Colors.transparent,
        foregroundColor: Colors.pink,
      ),

      body: Padding(
        padding: const EdgeInsets.all(24.0),

        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [

            const SizedBox(height: 25),

            const Text(
              "Choose a Date & Time",
              style: TextStyle(
                fontSize: 28,
                fontWeight: FontWeight.bold,
                color: Color(0xFF2D2D2D),
              ),
            ),

            const SizedBox(height: 8),

            const Text(
              "Select your preferred date and time below.",
              style: TextStyle(
                fontSize: 15,
                color: Colors.grey,
              ),
            ),

            const SizedBox(height: 35),

            // TIME FIELD
            TextField(
              controller: timePicker,
              readOnly: true,
              decoration: InputDecoration(
                prefixIcon: const Icon(
                  Icons.access_time_rounded,
                  color: Colors.pink,
                ),
                labelText: 'Pick a time',
                labelStyle: const TextStyle(
                  color: Colors.pink,
                  fontSize: 16,
                ),
                filled: true,
                fillColor: Colors.white,

                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(16),
                  borderSide: BorderSide.none,
                ),

                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(16),
                  borderSide: BorderSide.none,
                ),

                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(16),
                  borderSide: const BorderSide(
                    color: Colors.pink,
                    width: 2,
                  ),
                ),

                contentPadding: const EdgeInsets.symmetric(
                  vertical: 18,
                  horizontal: 16,
                ),
              ),

              onTap: () async {
                var time = await showTimePicker(
                  context: context,
                  initialTime: TimeOfDay.now(),
                );

                if (time != null) {
                  setState(() {
                    timePicker.text = time.format(context);
                  });
                }
              },
            ),

            const SizedBox(height: 22),

            // DATE FIELD
            TextField(
              controller: datePicker,
              readOnly: true,
              decoration: InputDecoration(
                prefixIcon: const Icon(
                  Icons.calendar_month_rounded,
                  color: Colors.pink,
                ),
                labelText: "Pick a date",
                labelStyle: const TextStyle(
                  color: Colors.pink,
                  fontSize: 16,
                ),
                filled: true,
                fillColor: Colors.white,

                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(16),
                  borderSide: BorderSide.none,
                ),

                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(16),
                  borderSide: BorderSide.none,
                ),

                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(16),
                  borderSide: const BorderSide(
                    color: Colors.pink,
                    width: 2,
                  ),
                ),

                contentPadding: const EdgeInsets.symmetric(
                  vertical: 18,
                  horizontal: 16,
                ),
              ),

              onTap: () async {
                DateTime? datetime = await showDatePicker(
                  context: context,
                  initialDate: DateTime.now(),
                  firstDate: DateTime(1958),
                  lastDate: DateTime(2100),
                );

                if (datetime != null) {
                  String formattedDate =
                      DateFormat('yyyy-MM-dd').format(datetime);

                  setState(() {
                    datePicker.text = formattedDate;
                  });
                }
              },
            ),
          ],
        ),
      ),
    );
  }
}