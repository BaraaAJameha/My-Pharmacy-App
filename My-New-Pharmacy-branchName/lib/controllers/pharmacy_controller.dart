// ignore_for_file: avoid_print
/*
import 'package:get/get.dart';
import 'package:reminder/db/db_handler.dart';

import '../models/pharmacy.dart';

class PharamcyController extends GetxController {
  @override
  void onReady() {
    getPharmacies();
    super.onReady();
  }

  var pharmacylist = <Pharmacy>[].obs;

  Future<int> addPharmacy({Pharmacy? pharmacy}) async {
    return DataHelper.insert(pharmacy);
  }

  void getPharmacies() async {
    List<Map<String, dynamic>> pharmacies = await DataHelper.query();
    print(pharmacies);
    pharmacylist
        .assignAll(pharmacies.map((data) => Pharmacy.fromJson(data)).toList());
  }

  void delete(Pharmacy pharmacy) {
    DataHelper.delete(pharmacy);
    getPharmacies();
  }
}
*/