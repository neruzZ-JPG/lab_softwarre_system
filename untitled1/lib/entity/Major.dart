class Major{
  int major_id;
  int department_id;
  String major_name;

  Major({
   this.major_id,
   this.department_id,
   this.major_name
});

  factory Major.fromJson(Map<String, dynamic> parsedJson){
    return new Major(
      major_id: parsedJson["major_id"],
      major_name: parsedJson["major_name"],
      department_id: parsedJson["department_id"]
    );
  }
}