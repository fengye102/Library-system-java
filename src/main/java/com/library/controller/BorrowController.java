package com.library.controller;

import com.library.entity.User;
import com.library.service.BorrowService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.HttpSession;

@Controller
@RequestMapping("/borrow")
public class BorrowController {

    @Autowired
    private BorrowService borrowService;

    // 普通用户：我的借阅记录
    @GetMapping("/my")
    public String myBorrow(HttpSession session, Model model) {
        User user = (User) session.getAttribute("loginUser");
        model.addAttribute("borrows", borrowService.findByUserId(user.getId()));
        return "borrow/myBorrow";
    }

    // 管理员：所有借阅记录
    @GetMapping("/all")
    public String allBorrow(Model model) {
        model.addAttribute("borrows", borrowService.findAll());
        return "borrow/allBorrow";
    }

    // 借书
    @GetMapping("/borrow/{bookId}")
    public String borrowBook(@PathVariable Integer bookId, HttpSession session) {
        User user = (User) session.getAttribute("loginUser");
        borrowService.borrowBook(user.getId(), bookId);
        return "redirect:/books";
    }

    // 普通用户还书
    @GetMapping("/return/{borrowId}")
    public String returnBook(@PathVariable Integer borrowId, HttpSession session) {
        User user = (User) session.getAttribute("loginUser");
        boolean admin = user.isAdmin();
        borrowService.returnBook(borrowId, admin ? null : user.getId());
        if (admin) {
            return "redirect:/borrow/all";
        }
        return "redirect:/borrow/my";
    }
}
