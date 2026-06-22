package com.library.service;

import com.library.entity.Borrow;
import java.util.List;

public interface BorrowService {
    List<Borrow> findByUserId(Integer userId);
    List<Borrow> findAll();
    boolean borrowBook(Integer userId, Integer bookId);
    boolean returnBook(Integer borrowId, Integer userId);
}
