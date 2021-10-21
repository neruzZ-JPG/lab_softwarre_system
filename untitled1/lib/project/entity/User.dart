class User{
  int user_id;
  int department_id;
  String user_account;
  String user_phone_number;
  int user_role;
  String user_name;

  User({
    this.user_id,
    this.department_id,
    this.user_account,
    this.user_phone_number,
    this.user_role,
    this.user_name
});

  factory User.fromJson(Map<String, dynamic> parsedJson){
    return User(
        user_id: parsedJson["user_id"],
        department_id: parsedJson["department_id"],
        user_account: parsedJson["user_account"],
        user_phone_number: parsedJson["user_phone_number"],
        user_role: parsedJson["user_role"],
        user_name: parsedJson["user_name"]
    );
  }
}