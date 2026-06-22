package com.library.controller;

import com.library.entity.User;
import com.library.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.HttpSession;
import java.util.HashMap;
import java.util.Map;

@Controller
public class UserController {

    @Autowired
    private UserService userService;

    // 登录页
    @GetMapping("/login")
    public String loginPage() {
        return "login";
    }

    // 登录处理
    @PostMapping("/login")
    public String login(String username, String password, HttpSession session, Model model) {
        User user = userService.login(username, password);
        if (user == null) {
            model.addAttribute("error", "用户名或密码错误");
            return "login";
        }
        session.setAttribute("loginUser", user);
        return "redirect:/index";
    }

    // 首页
    @GetMapping("/index")
    public String index() {
        return "index";
    }

    // 退出登录
    @GetMapping("/logout")
    public String logout(HttpSession session) {
        session.invalidate();
        return "redirect:/login";
    }

    // 注册页
    @GetMapping("/register")
    public String registerPage() {
        return "register";
    }

    // 注册处理
    @PostMapping("/register")
    public String register(User user, Model model) {
        if (userService.existsUsername(user.getUsername())) {
            model.addAttribute("error", "用户名已存在");
            return "register";
        }
        boolean success = userService.register(user);
        if (success) {
            return "redirect:/login?registered=1";
        }
        model.addAttribute("error", "注册失败，请重试");
        return "register";
    }

    // AJAX 注册（返回 JSON，供前端成功动画使用）
    @PostMapping("/register/ajax")
    @ResponseBody
    public Map<String, Object> registerAjax(User user) {
        Map<String, Object> result = new HashMap<>();
        if (userService.existsUsername(user.getUsername())) {
            result.put("success", false);
            result.put("error", "用户名已存在");
            return result;
        }
        boolean ok = userService.register(user);
        result.put("success", ok);
        if (!ok) result.put("error", "注册失败，请重试");
        return result;
    }

    // 管理员：用户列表
    @GetMapping("/admin/users")
    public String userList(Model model) {
        model.addAttribute("users", userService.findAll());
        return "admin/userList";
    }

    // 管理员：新增用户页
    @GetMapping("/admin/users/add")
    public String addUserPage() {
        return "admin/userForm";
    }

    // 管理员：新增用户处理
    @PostMapping("/admin/users/add")
    public String addUser(User user, Model model) {
        if (userService.existsUsername(user.getUsername())) {
            model.addAttribute("error", "用户名已存在");
            return "admin/userForm";
        }
        userService.add(user);
        return "redirect:/admin/users";
    }

    // 管理员：编辑用户页
    @GetMapping("/admin/users/edit/{id}")
    public String editUserPage(@PathVariable Integer id, Model model) {
        model.addAttribute("user", userService.findById(id));
        return "admin/userForm";
    }

    // 管理员：编辑用户处理
    @PostMapping("/admin/users/edit")
    public String editUser(User user) {
        userService.update(user);
        return "redirect:/admin/users";
    }

    // 管理员：删除用户
    @GetMapping("/admin/users/delete/{id}")
    public String deleteUser(@PathVariable Integer id) {
        userService.delete(id);
        return "redirect:/admin/users";
    }
}
