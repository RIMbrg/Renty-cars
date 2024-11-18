class Driver {
  final String fName;
  final String lName;
  final String email;
  final String phone;
  final String residency;
  final int age;

  Driver(
      {required this.fName,
      required this.lName,
      required this.email,
      required this.phone,
      required this.residency,
      required this.age});

  factory Driver.dummy() {
    return Driver(
        fName: 'Simon',
        lName: 'Darcy',
        email: 'sidarcy@gmail.com',
        phone: '0871324584',
        residency: 'US',
        age: 30);
  }
}