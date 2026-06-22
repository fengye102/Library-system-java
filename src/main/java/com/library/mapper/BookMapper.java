package com.library.mapper;

import com.library.entity.Book;
import java.util.List;

public interface BookMapper {
    Book findById(Integer id);
    List<Book> findAll();
    List<Book> search(String keyword);
    int insert(Book book);
    int update(Book book);
    int deleteById(Integer id);
    int decreaseAvailable(Integer id);
    int increaseAvailable(Integer id);
}
