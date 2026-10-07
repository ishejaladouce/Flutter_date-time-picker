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
      appBar: AppBar(
        title: const Text("Date and Time Picker"),
        elevation: 0,
        centerTitle: true,
      ),

      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          children: [
            TextField(
              controller: timePicker,
              decoration: InputDecoration(
                border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
                labelText: 'Pick a current Time',
                labelStyle: const TextStyle(
                  fontSize: 16,
                  color: Colors.blue,
        
                )
              ),
              onTap: ()async {
                var time = await showTimePicker(
                  context: context, initialTime: TimeOfDay.now());

                  if (time != null){
                    setState(() {
                      timePicker.text = time.format(context);
                    });
                  }
              },
            ),
        
            const SizedBox(height: 20,),
        
            TextField(
              controller: datePicker,
              decoration: InputDecoration(
                border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
                labelText: "Pick today's Date",
                labelStyle: const TextStyle(
                  fontSize: 16,
                  color: Colors.blue,
        
                ),
              ),
              onTap: ()async {
                DateTime? datetime = await showDatePicker(
                  context: context,
                  initialDate: DateTime.now(), 
                  firstDate: DateTime(1958), 
                  lastDate: DateTime(2100));

                  if(datetime!=null){
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