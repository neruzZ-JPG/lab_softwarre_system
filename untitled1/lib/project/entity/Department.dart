class Department{
  int depatment_id;
  String department_name;

  Department({
    this.depatment_id,
    this.department_name
});

  factory Department.fromJson(Map<String, dynamic> parsedJson){
    return Department(
      depatment_id: parsedJson["department_id"],
      department_name: parsedJson["department_name"]
    );
  }
}