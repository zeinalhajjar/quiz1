import 'package:freezed_annotation/freezed_annotation.dart';

part 'model_company.freezed.dart';
part 'model_company.g.dart';

@freezed
class Company with _$Company {
  factory Company({
    @JsonKey(name: 'is_active') required int isActive,
    required String name,
    required Address address,
    @JsonKey(name: 'established') required DateTime established,
    required List<Department> departments,
  }) = _Company;

  factory Company.fromJson(Map<String, dynamic> json) =>
      _$CompanyFromJson(json);
}

@freezed
class Address with _$Address {
  factory Address({
    required String street,
    required String city,
    required String state,
    @JsonKey(name: 'postalCode')
    required String postalCode,
  }) = _Address;

  factory Address.fromJson(Map<String, dynamic> json) =>
      _$AddressFromJson(json);
}

@freezed
class Department with _$Department {
  factory Department({
    @JsonKey(name: 'deptId') required String deptId,
    required String name,
    required String manager,
    required double budget,
    required int year,
    required Availability availability,
    @JsonKey(name: 'meeting_time') required String meetingTime,
  }) = _Department;

  factory Department.fromJson(Map<String, dynamic> json) =>
      _$DepartmentFromJson(json);
}

@freezed
class Availability with _$Availability {
  factory Availability({
    required bool online,
    @JsonKey(name: 'inStore') required bool inStore,
  }) = _Availability;

  factory Availability.fromJson(Map<String, dynamic> json) =>
      _$AvailabilityFromJson(json);
}
