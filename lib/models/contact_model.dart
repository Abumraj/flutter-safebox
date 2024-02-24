class Contacts {
  String? id;
  String displayName;
  String name;
  Phones? phones;
  Emails? emails;
  Addresses? addresses;

  Contacts({
    this.id,
    required this.displayName,
    required this.name,
    this.phones,
    this.emails,
    this.addresses,
  });

  factory Contacts.fromJson(Map<String, dynamic> json) {
    return Contacts(
      id: json['id'],
      displayName: json['displayName'],
      name: json['name'],
      phones: json['phones'] != null ? Phones.fromJson(json['phones']) : null,
      emails: json['emails'] != null ? Emails.fromJson(json['emails']) : null,
      addresses: json['addresses'] != null
          ? Addresses.fromJson(json['addresses'])
          : null,
    );
  }
}

class Phones {
  String phone1;
  String? phone2;
  String? phone3;

  Phones({
    required this.phone1,
    this.phone2,
    this.phone3,
  });

  factory Phones.fromJson(Map<String, dynamic> json) {
    return Phones(
      phone1: json['phone1'],
      phone2: json['phone2'],
      phone3: json['phone3'],
    );
  }
}

class Emails {
  String? email1;
  String? email2;
  String? email3;

  Emails({
    this.email1,
    this.email2,
    this.email3,
  });

  factory Emails.fromJson(Map<String, dynamic> json) {
    return Emails(
      email1: json['email1'],
      email2: json['email2'],
      email3: json['email3'],
    );
  }
}

class Addresses {
  String? address1;
  String? address2;

  Addresses({
    this.address1,
    this.address2,
  });

  factory Addresses.fromJson(Map<String, dynamic> json) {
    return Addresses(
      address1: json['address1'],
      address2: json['address2'],
    );
  }
}
