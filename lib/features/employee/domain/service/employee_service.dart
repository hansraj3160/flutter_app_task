import 'package:get/get.dart';
import '../repository/employee_repository_interface.dart';
import 'employee_service_interface.dart';

class EmployeeService implements EmployeeServiceInterface {
  final EmployeeRepositoryInterface employeeRepositoryInterface;
  EmployeeService({required this.employeeRepositoryInterface});

  @override
  Future<Response> getEmployeeList() async {
    try {
      final employees = await employeeRepositoryInterface.getEmployees();
      return Response(body: employees, statusCode: 200);
    } catch (e) {
      return const Response(statusCode: 500, statusText: 'Error fetching data');
    }
  }
}