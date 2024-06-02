import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'Question1/manual_modeling/manual_modeling.dart';
import 'navigationbar.dart';

Future<void> main() async {
  runApp(const MyApp());

  /*final now = DateTime.now().toUtc();*/
  final company = Company(
    name: 'Acme Inc.',
    established: DateTime.utc(2024, 2, 5),
    isActive: true,
    departments: [],
    address: Address(street: '', city: '', state: '', postalCode: ''),
  );

  String formattedDate = DateFormat('d-MMM-yyyy').format(company.established);
  if (kDebugMode) {
    print('Established: $formattedDate');
  }

}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: NavigationBars(),
    );
  }
}
