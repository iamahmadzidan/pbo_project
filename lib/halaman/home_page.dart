import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(child: Column(
        children: [
          const SizedBox(height: 22,),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Column(
              children: [
                Text('Welcome back!'),
                SizedBox(height: 2),
                Text(
                  "Bruce wyne T", 
                  style: TextStyle(fontSize: 25,
                  fontWeight: FontWeight.bold),
                
                  )
              ]
            ),
          )

        ],
      )
      ),
    );
    
  }
}
