class UserData {
  int id;
  String firstName;
  String lastName;
  String mailId;
  String password;
  String dob;
  String gender;
  UserData({required this.id,required this.firstName,required this.lastName,required this.mailId, required this.password, required this.dob, required this.gender});
  Map<String, dynamic> toMap() {
    return {'id': id, 'firstName': firstName,'lastName':lastName,'mailId':mailId,'password':password, 'dob':dob,'gender':gender};

  }
}