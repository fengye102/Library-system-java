package com.library.mapper;

import com.library.entity.Borrow;
import java.util.List;

public interface BorrowMapper {
    Borrow findById(Integer id);
    List<Borrow> findByUserId(Integer userId);
    List<Borrow> findAll();
    List<Borrow> findActiveBorrowByUserAndBook(Integer userId, Integer bookId);
    int insert(Borrow borrow);
    int returnBook(Integer id);
}
