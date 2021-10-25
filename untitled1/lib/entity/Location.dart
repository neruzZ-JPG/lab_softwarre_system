class Location{
  int location_id;
  String location_building;
  String location_room;

  Location({
    this.location_building,
    this.location_id,
    this.location_room,
});

  factory Location.fromJson(Map<String, dynamic>parsedJson){
    return new Location(
      location_building: parsedJson["location_building"],
      location_id: parsedJson["location_id"],
      location_room: parsedJson["location_room"],
    );
  }
}