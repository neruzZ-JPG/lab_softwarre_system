import 'package:untitled1/project/entity/Location.dart';

import 'User.dart';

class Lab{
   int lab_id;
   int location_id;
   int user_id;
   String lab_name;
   int lab_hold;
   int lab_computer_num;
   String lab_need;
   String computer_type;
   String computer_cpu;
   String computer_memory;
   String computer_gpu;
   String computer_disk_load;
   String computer_os;

   User user;
   Location location;

   Lab({
      this.location_id,
      this.user_id,
      this.computer_cpu,
      this.computer_disk_load,
      this.computer_gpu,
      this.computer_memory,
      this.computer_os,
      this.computer_type,
      this.lab_computer_num,
      this.lab_hold,
      this.lab_id,
      this.lab_name,
      this.lab_need,
});

   factory Lab.fromJson(Map<String, dynamic>parsedJson){
      return Lab(
         location_id: parsedJson["location_id"],
         lab_computer_num: parsedJson["lab_computer_num"],
         lab_hold: parsedJson["lab_hold"],
         lab_id: parsedJson["lab_id"],
         lab_name: parsedJson["lab_name"],
         lab_need: parsedJson["lab_need"],
         computer_disk_load: parsedJson["computer_disk_load"],
         computer_cpu: parsedJson["computer_cpu"],
         computer_gpu: parsedJson["computer_gpu"],
         computer_memory: parsedJson["computer_memory"],
         computer_os: parsedJson["computer_os"],
         computer_type: parsedJson["computer_type"],
         user_id: parsedJson["user_id"],
      );
   }
}