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
public class Catogory {
    private long catogory_id;
    private String catogory_name;
}
