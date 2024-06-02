import 'package:intl/intl.dart';
import 'package:json_annotation/json_annotation.dart';

part 'company.g.dart';

mixin DateTimeHelper {
  String formatDate(DateTime date) {
    final formatter = DateFormat('d-MMM, yyyy');
    return formatter.format(date.toUtc());
  }
}

@JsonSerializable()
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

  factory Address.fromJson(Map<String, dynamic> json) => _$AddressFromJson(json);
  Map<String, dynamic> toJson() => _$AddressToJson(this);
}

@JsonSerializable()
class Availability with DateTimeHelper {
  final bool online;
  final bool inStore;

  Availability({
    required this.online,
    required this.inStore,
  });

  factory Availability.fromJson(Map<String, dynamic> json) => _$AvailabilityFromJson(json);
  Map<String, dynamic> toJson() => _$AvailabilityToJson(this);
}

@JsonSerializable()
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

  factory Department.fromJson(Map<String, dynamic> json) => _$DepartmentFromJson(json);
  Map<String, dynamic> toJson() => _$DepartmentToJson(this);
}

@JsonSerializable()
class Company with DateTimeHelper {
  final bool isActive;
  final String name;
  final Address? address;
  final DateTime established;
  final List<Department> departments;

  Company({
    required this.isActive,
    required this.name,
    this.address,
    required this.established,
    required this.departments,
  });

  factory Company.fromJson(Map<String, dynamic> json) => _$CompanyFromJson(json);
  Map<String, dynamic> toJson() => _$CompanyToJson(this);
}