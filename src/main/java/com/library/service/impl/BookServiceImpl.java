package com.library.service.impl;

import com.library.entity.Book;
import com.library.mapper.BookMapper;
import com.library.service.BookService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

@Service
@Transactional
public class BookServiceImpl implements BookService {

    @Autowired
    private BookMapper bookMapper;

    @Override
    @Transactional(readOnly = true)
    public List<Book> findAll() {
        return bookMapper.findAll();
    }

    @Override
    @Transactional(readOnly = true)
    public List<Book> search(String keyword) {
        if (keyword == null || keyword.trim().isEmpty()) {
            return bookMapper.findAll();
        }
        return bookMapper.search(keyword.trim());
    }

    @Override
    @Transactional(readOnly = true)
    public Book findById(Integer id) {
        return bookMapper.findById(id);
    }

    @Override
    public boolean add(Book book) {
        if (book.getAvailable() == null) {
            book.setAvailable(book.getTotal());
        }
        return bookMapper.insert(book) > 0;
    }

    @Override
    public boolean update(Book book) {
        return bookMapper.update(book) > 0;
    }

    @Override
    public boolean delete(Integer id) {
        return bookMapper.deleteById(id) > 0;
    }
}
