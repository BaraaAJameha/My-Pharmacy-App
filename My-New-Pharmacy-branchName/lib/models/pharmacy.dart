// ignore_for_file: unnecessary_new, unnecessary_this, prefer_collection_literals

class Pharmacy {
  String? name;
  String? phoneNumber;
  String? city;
  String? street;

  Pharmacy({
    this.name,
    this.phoneNumber,
    this.city,
    this.street,
  });

  Pharmacy.fromJson(Map<String, dynamic> json) {
    name = json['iname'];
    phoneNumber = json['phoneNumber'];
    city = json['city'];
    street = json['street'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['name'] = this.name;
    data['phoneNumber'] = this.phoneNumber;
    data['city'] = this.city;
    data['street'] = this.street;

    return data;
  }
}
