import 'package:flutter_task_app/features/employee/domain/service/employee_service_interface.dart';
import 'package:get/get.dart';
import '../domain/model/employee_model.dart';

class EmployeeController extends GetxController implements GetxService {
  final EmployeeServiceInterface employeeServiceInterface;
  EmployeeController({required this.employeeServiceInterface});

  var employeeList = <EmployeeModel>[].obs;
  var isLoading = true.obs;

  @override
  void onInit() {
    super.onInit();
    fetchEmployees();
  }

  Future<void> fetchEmployees() async {
    isLoading(true);
    Response response = await employeeServiceInterface.getEmployeeList();
    if (response.statusCode == 200) {
      employeeList.assignAll(response.body);
    } else {
      Get.snackbar("Error", "Failed to load employees");
    }
    isLoading(false);
  }
}