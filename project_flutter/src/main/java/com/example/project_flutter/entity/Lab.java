package com.example.project_flutter.entity;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;
import org.springframework.stereotype.Component;

/**
 * @author 西云研究所
 * @date 2021/10/18
 */
@Component
@Data
@AllArgsConstructor
@NoArgsConstructor
public class Lab {
    private long lab_id;
    private long location_id;
    private long computer_id;
    private long user_id;
    private String lab_name;
    private int lab_hold;
    private int lab_computer_num;
    private String lab_need;
    private String computer_type;
    private String computer_cpu;
    private String computer_memory;
    private String computer_gpu;
    private String computer_disk_load;
    private String computer_os;
}
