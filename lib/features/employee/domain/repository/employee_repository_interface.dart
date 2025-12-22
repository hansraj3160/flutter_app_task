import '../model/employee_model.dart';

abstract class EmployeeRepositoryInterface {
  Future<List<EmployeeModel>> getEmployees();
}