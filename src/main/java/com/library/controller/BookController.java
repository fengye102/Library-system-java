package com.library.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.library.entity.Book;
import com.library.service.BookService;

@Controller
@RequestMapping("/books")
public class BookController {

    @Autowired
    private BookService bookService;

    // 图书列表（普通用户/管理员均可查看）
    @GetMapping("")
    public String bookList(@RequestParam(required = false) String keyword, Model model) {
        if (keyword != null && !keyword.trim().isEmpty()) {
            model.addAttribute("books", bookService.search(keyword));
            model.addAttribute("keyword", keyword);
        } else {
            model.addAttribute("books", bookService.findAll());
        }
        return "book/bookList";
    }

    // 管理员：新增图书页
    @GetMapping("/add")
    public String addBookPage() {
        return "book/bookForm";
    }

    // 管理员：新增图书处理
    @PostMapping("/add")
    public String addBook(Book book) {
        bookService.add(book);
        return "redirect:/books";
    }

    // 管理员：编辑图书页
    @GetMapping("/edit/{id}")
    public String editBookPage(@PathVariable Integer id, Model model) {
        model.addAttribute("book", bookService.findById(id));
        return "book/bookForm";
    }

    // 管理员：编辑图书处理
    @PostMapping("/edit")
    public String editBook(Book book) {
        bookService.update(book);
        return "redirect:/books";
    }

    // 管理员：删除图书
    @GetMapping("/delete/{id}")
    public String deleteBook(@PathVariable Integer id) {
        bookService.delete(id);
        return "redirect:/books";
    }
}
