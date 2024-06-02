import 'package:intl/intl.dart';

mixin DateTimeHelper {
  String formatDate(DateTime date) {
    final formatter = DateFormat('d-MMM, yyyy');
    return formatter.format(date.toUtc());
  }
}

class Address with DateTimeHelper {
  final String street;
  final String city;
  final String state;
  final String postalCode;

  Address({
    required this.street,
    required this.city,
    required this.state,
    required this.postalCode,
  });
}

class Availability with DateTimeHelper {
  final bool online;
  final bool inStore;

  Availability({
    required this.online,
    required this.inStore,
  });
}

class Department with DateTimeHelper {
  final String deptId;
  final String name;
  final String manager;
  final double budget;
  final int year;
  final Availability availability;
  final String meetingTime;

  Department({
    required this.deptId,
    required this.name,
    required this.manager,
    required this.budget,
    required this.year,
    required this.availability,
    required this.meetingTime,
  });
}

class Company with DateTimeHelper {
  final bool isActive;
  final String name;
  final Address address;
  final DateTime established;
  final List<Department> departments;

  Company({
    required this.isActive,
    required this.name,
    required this.address,
    required this.established,
    required this.departments,
  });
}