class Software {
  int software_id;
  int catogory_id;
  String software_name;
  String software_need;

  Software(
      {this.catogory_id,
      this.software_id,
      this.software_name,
      this.software_need});

  factory Software.fromJson (Map<String, dynamic> parsedJson){
    return Software(
      catogory_id: parsedJson["catogory_id"],
      software_id: parsedJson["software_id"],
      software_name : parsedJson["software_name"],
      software_need: parsedJson["software_need"]
    );
  }

}
