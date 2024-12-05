// ignore_for_file: unnecessary_new, unnecessary_this, prefer_collection_literals

class Doctor {
  String? name;
  String? medicalSpeciality;
  String? phoneNumber;
  String? city;
  String? street;

  Doctor({
    this.name,
    this.medicalSpeciality,
    this.phoneNumber,
    this.city,
    this.street,
  });

  Doctor.fromJson(Map<String, dynamic> json) {
    name = json['iname'];
    medicalSpeciality = json['medicalSpeciality'];
    phoneNumber = json['phoneNumber'];
    city = json['city'];
    street = json['street'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['name'] = this.name;
    data['medicalSpeciality'] = this.medicalSpeciality;
    data['phoneNumber'] = this.phoneNumber;
    data['city'] = this.city;
    data['street'] = this.street;

    return data;
  }
}
