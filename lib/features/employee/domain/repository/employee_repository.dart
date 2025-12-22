import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../api/api_client.dart';
import '../../../../utils/app_constants.dart'; 
import '../model/employee_model.dart';
import 'employee_repository_interface.dart';

class EmployeeRepository implements EmployeeRepositoryInterface {
  final ApiClient apiClient;
  EmployeeRepository({required this.apiClient});

  @override
  Future<List<EmployeeModel>> getEmployees() async {
  
    Response response = await apiClient.getData(AppConstants.employeeUri);
    debugPrint("API Status: ${response.statusCode}");
    debugPrint("API Body: ${response.body}");
    if (response.statusCode == 200) {
      
     if (response.body['employees'] != null) {
        List<dynamic> data = response.body['employees'];
        return data.map((json) => EmployeeModel.fromJson(json)).toList();
      }
    }
    return [];
  }
}