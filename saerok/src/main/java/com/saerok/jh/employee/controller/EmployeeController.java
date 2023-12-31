package com.saerok.jh.employee.controller;

import java.io.File;
import java.io.IOException;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import com.saerok.jh.employee.model.service.EmployeeService;

import jakarta.servlet.http.HttpSession;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;

@Controller
@RequiredArgsConstructor
@Slf4j
public class EmployeeController {
   @Autowired
   private final EmployeeService service;

   // 사원등록 화면전환
   @GetMapping("/insertemp")
   public String insertEmployee() {
      return "employee/insertemployee";

   }

   // 사원등록 
     @PostMapping("/insertempEnd")
       public String insertEmployeeEnd(MultipartFile oriFileName,
                                       @RequestParam Map<String, Object> param,
                                       Model model, HttpSession session) {
       
           BCryptPasswordEncoder encoder = new BCryptPasswordEncoder();
           String pwd = (String)param.get("empPw");
           String  newpwd= encoder.encode(pwd);
           System.out.println("기존비밀번호" + pwd);
           System.out.println("암호화된 비밀번호" + newpwd);
           param.put("empPw",newpwd);
        
           int result = 0;
           log.debug("{}",oriFileName.getOriginalFilename());
           log.debug("{}",param);
           try {
               if (!oriFileName.isEmpty()) {
                   // 원본 파일명
                  
                   String originalFileName = oriFileName.getOriginalFilename();

                   // 서버에 저장할 파일명 생성 (현재 시간을 사용)
                   String destFileName = System.currentTimeMillis() + "_" + originalFileName;

                   // 파일을 서버에 저장하는 로직
                   String path = session.getServletContext().getRealPath("/resources/upload/profile/"); 
                   File destFile = new File(path,destFileName);
                   oriFileName.transferTo(destFile);

                   param.put("oriFileName",oriFileName); 
                   param.put("destFileName", destFileName); 
                   result = service.insertEmployeeEnd(param);
               }

               String msg, loc;
               if (result > 0) {
                   msg = "사원등록성공";
                   loc = "index";    //employee/empList jsp 아니라 controller
               } else {
                   msg = "사원등록실패";
                   loc = "index";
               }

               model.addAttribute("msg", msg);
               model.addAttribute("loc", loc);

           } catch (IOException e) {
               e.printStackTrace();
               model.addAttribute("msg", "파일 업로드 실패!!!");
               model.addAttribute("loc", "index");
           }

           return "common/msg";
       }

     // 사원리스트 화면전환
     @GetMapping("/selectemp")
     public String selectEmployee() {
        return "employee/empList";

     }
     
     
     
     
     
     
     
     
     

}