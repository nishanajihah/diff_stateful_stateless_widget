import 'package:flutter/material.dart';
import 'stateful_page.dart';
import 'stateless_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      // home: StatefulCounter(),
      home: Builder(
        builder: (context) => Scaffold(
          appBar: AppBar(
            title: const Text('Stateless VS Stateful'),
          ),
          body: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton(
                  onPressed: () {
                    Navigator.of(context).push(
                      MaterialPageRoute(
                          builder: (context) => const StatefulPage()),
                    );
                  },
                  child: const Text('Stateful Widget'),
                ),
                ElevatedButton(
                  onPressed: () {
                    Navigator.of(context).push(
                      MaterialPageRoute(
                          builder: (context) => const StatelessPage()),
                    );
                  },
                  child: const Text('Stateless Widget'),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

// void

// class MyApp extends StatelessWidget {
//   const MyApp({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text('Stateless VS Stateful'),
//       ),
//       body: Center(
//         child: ElevatedButton(
//           onPressed: () {
//             Navigator.push(
//               context,
//               MaterialPageRoute(builder: (context) => const StatefulPage()),
//             );
//           },
//           child: const Text('Stateful Widget'),
//         ),
//       ),
//     );
//   }
// }

/// A stateless widget is a widget that does not maintain any state.
/// This means that the widget's properties cannot change over time.
///
/// Stateless widgets are useful for creating simple, reusable widgets that do not need to maintain any state.
/// For example, a stateless widget could be used to create a button or a label.
// class MyApp extends StatelessWidget {
//   const MyApp({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       // home: StatefulCounter(),
//       home: Scaffold(
//         appBar: AppBar(
//           title: const Text('Stateless VS Stateful'),
//         ),
//         body: const Center(
//           child: Text('This is a static text display in stateless widget'),
//         ),
//       ),
//     );
//   }
// }

// Stateful widgets are used for dynamic UI elements that respond to user interactions or external data updates.
// Stateful widgets have state management mechanisms (like setState) to rebuild the UI when their state changes.
// class StatefulCounter extends StatefulWidget {
//   const StatefulCounter({super.key});

//   @override
//   _StatefulCounterState createState() => _StatefulCounterState();
// }

// class _StatefulCounterState extends State<StatefulCounter> {

//   int count = 0;

//   void addCounter(){
//     setState(() {
//       count++;
//     });
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Row(
//       mainAxisAlignment: MainAxisAlignment.center,
//       children: [
//         Text('Count: $count'),
//         const SizedBox(width: 10),
//         ElevatedButton(
//           onPressed: addCounter,
//           child: const Text('Increment'),
//         )
//       ],
//     );
//   }
// }
