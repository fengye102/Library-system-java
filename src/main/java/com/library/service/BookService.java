package com.library.service;

import com.library.entity.Book;
import java.util.List;

public interface BookService {
    List<Book> findAll();
    List<Book> search(String keyword);
    Book findById(Integer id);
    boolean add(Book book);
    boolean update(Book book);
    boolean delete(Integer id);
}
