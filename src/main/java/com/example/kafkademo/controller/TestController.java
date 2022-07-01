package com.example.kafkademo.controller;

import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

@RestController
@RequestMapping("/app/demo")

public class TestController {

    @GetMapping(value = "")
    public Object demo(){
        return "Hello world";
    }

}
