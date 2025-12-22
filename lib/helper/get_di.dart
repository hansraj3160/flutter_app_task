import 'package:flutter_task_app/features/employee/domain/service/employee_service.dart';
import 'package:flutter_task_app/features/employee/domain/service/employee_service_interface.dart';
import 'package:get/get.dart';
import '../utils/app_constants.dart';
import '../api/api_client.dart';
import '../features/employee/domain/repository/employee_repository.dart';
import '../features/employee/domain/repository/employee_repository_interface.dart';

import '../features/employee/controller/employee_controller.dart';

Future<void> init() async {
  Get.lazyPut(() => ApiClient(appBaseUrl: AppConstants.baseUrl), fenix: true);
  Get.lazyPut<EmployeeRepositoryInterface>(
      () => EmployeeRepository(apiClient: Get.find()));
  Get.lazyPut<EmployeeServiceInterface>(
      () => EmployeeService(employeeRepositoryInterface: Get.find()));
  Get.lazyPut(() => EmployeeController(employeeServiceInterface: Get.find()));
}