package com.example.project_flutter;

import com.example.project_flutter.service.CourseService;
import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;

@SpringBootTest
class ProjectFlutterApplicationTests {

    @Autowired
    private CourseService courseService;

    @Test
    void contextLoads() {
    }

    @Test
    void testAddCourse(){
        courseService.addCourse(0,"111","1",1,1,1);
    }

}
