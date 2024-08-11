// ignore_for_file: avoid_print
/*
import 'package:get/get.dart';
import 'package:reminder/db/data_base_handler.dart';

import '../models/doctor.dart';

class DoctorController extends GetxController {
  @override
  void onReady() {
    getDoctors();
    super.onReady();
  }

  var doctorlist = <Doctor>[].obs;

  Future<int> addDoctor({Doctor? doctor}) async {
    return DatabaseHandler.insert(doctor);
  }

  void getDoctors() async {
    List<Map<String, dynamic>> doctors = await DatabaseHandler.query();
    print(doctors);
    doctorlist.assignAll(doctors.map((data) => Doctor.fromJson(data)).toList());
  }

  void delete(Doctor doctor) {
    DatabaseHandler.delete(doctor);
    getDoctors();
  }
}
*/