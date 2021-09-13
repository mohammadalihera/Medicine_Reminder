class Country {
  String name;
  String flag;
  String code;
  String phoneCode;

  Country({required this.name, required this.flag, required this.code, required this.phoneCode});

  factory Country.fromJson(Map<String, dynamic> json) {
    return new Country(
      name: json['name'],
      flag: json['flag'],
      code: json['code'],
      phoneCode: json['phoneCode'],
    );
  }

  @override
  String toString() {
    return 'Country{name: $name, flag: $flag, code: $code, phoneCode: $phoneCode}';
  }
}
