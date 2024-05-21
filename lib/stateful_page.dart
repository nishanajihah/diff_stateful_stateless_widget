import 'package:flutter/material.dart';

class StatefulPage extends StatefulWidget {
  const StatefulPage({super.key});

  @override
  // Use State as it is not a private type
  State<StatefulPage> createState() => _StatefulPageState();

  // This is private type
  // _StatefulPageState createState() => _StatefulPageState();
}

class _StatefulPageState extends State<StatefulPage> {

  int count = 0;

// NOTIFIER FUNCTION CALL -------------------------------
// This approach can help be more reactive and efficient
// as it does no require the entire widget tree to be rebuilt when the count value changes.

// /// A ValueNotifier that holds the current count.
//   final countNotifier = ValueNotifier<int>(0);

//   /// Increments the count by 1.
//   void addCounter() {
//     countNotifier.value++;
//   }

//   /// Decrements the count by 1.
//   void minusCounter() {
//     countNotifier.value--;
//   }

//   /// Resets the count to 0.
//   void resetCounter() {
//     countNotifier.value = 0;
// }


// STATEFUL FUNCTION CALL -----------------------------
// Use a single setState to update all 3 methods
// This approach reduces the amount of dupicated code

/// Updates the counter by the given value.
  void updateCounter(int value) {
    setState(() {
      count += value;
    });
  }

  /// Increments the counter by 1.
  void addCounter() {
    updateCounter(1);
  }

  /// Decrements the counter by 1.
  void minusCounter() {
    updateCounter(-1);
  }

  /// Resets the counter to 0.
  void resetCounter() {
    updateCounter(-count);
  }


// NORMAL FUNCTION CALL ------------------

// /// Increments the counter by 1.
//   void addCounter() {
//     setState(() {
//       count++;
//     });
//   }

//   /// Decrements the counter by 1.
//   void minusCounter() {
//     setState(() {
//       count--;
//     });
//   }

//   /// Resets the counter to 0.
//   void resetCounter() {
//     setState(() {
//       count = 0;
//     });
//   }

  ButtonStyle elevatedButtonStyle = ButtonStyle(
    backgroundColor: WidgetStateProperty.all<Color>(Colors.amberAccent),
    elevation: WidgetStateProperty.all<double>(5),
    shape: WidgetStateProperty.all<RoundedRectangleBorder>(
      RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
    ),
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Stateful Widget'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text('Counter Numbers', style: TextStyle(fontSize: 20.0),),
            Text('$count', style: TextStyle(fontSize: 100.0, color: Colors.amber[800]),),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton(
                  style: elevatedButtonStyle,
                  onPressed: addCounter,
                  child: const Text('Increase', style: TextStyle(fontSize: 15.0, color: Colors.black87),),
                ),
                const SizedBox(width: 10.0),
                ElevatedButton(
                  style: elevatedButtonStyle,
                  onPressed: minusCounter,
                  child: const Text('Decrease', style: TextStyle(fontSize: 15.0, color: Colors.black87),),
                ),
              ],
            ),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.transparent,
                foregroundColor: Colors.transparent,
                elevation: 0.0,
                shadowColor: Colors.transparent,
              ),
              onPressed: resetCounter,
              child: const Text('Reset', style: TextStyle(fontSize: 15.0, color: Colors.black87),),
            ),
          ],
        ),
      ),
    );
  }
}
