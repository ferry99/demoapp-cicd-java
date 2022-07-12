package com.example.kafkademo.controller;

import org.springframework.http.MediaType;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;

@Controller
@RequestMapping("/app/demo")

public class TestController {

    @GetMapping(value = "" , produces = MediaType.TEXT_HTML_VALUE)
    @ResponseBody
    public String demo(){
        return "<html>\n"
                + "<header><title>Welcome</title></header>\n" +
                "<body>\n" +
                "<table>\n" +
                        "  <tr>\n" +
                        "    <th>Company</th>\n" +
                        "    <th>Contact</th>\n" +
                        "    <th>Country</th>\n" +
                        "  </tr>\n" +
                        "  <tr>\n" +
                        "    <td>Alfreds Futterkiste</td>\n" +
                        "    <td>Maria Anders</td>\n" +
                        "    <td>US</td>\n" +
                        "  </tr>\n" +
                        "  <tr>\n" +
                        "    <td>Centro comercial Moctezuma</td>\n" +
                        "    <td>Francisco Chang</td>\n" +
                        "    <td>Mexico</td>\n" +
                        "  </tr>\n" +
                        "  <tr>\n" +
                        "    <td>Ernst Handel</td>\n" +
                        "    <td>Roland Mendel</td>\n" +
                        "    <td>Austria</td>\n" +
                        "  </tr>\n" +
                        "  <tr>\n" +
                        "    <td>Island Trading</td>\n" +
                        "    <td>Helen Bennett</td>\n" +
                        "    <td>UK</td>\n" +
                        "  </tr>\n" +
                        "</table>\n"
                + "</body>\n"
                + "</html>";
    }

}
