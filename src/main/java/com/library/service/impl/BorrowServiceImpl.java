package com.library.service.impl;

import com.library.entity.Borrow;
import com.library.mapper.BookMapper;
import com.library.mapper.BorrowMapper;
import com.library.service.BorrowService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.Calendar;
import java.util.Date;
import java.util.List;

@Service
@Transactional
public class BorrowServiceImpl implements BorrowService {

    @Autowired
    private BorrowMapper borrowMapper;

    @Autowired
    private BookMapper bookMapper;

    @Override
    @Transactional(readOnly = true)
    public List<Borrow> findByUserId(Integer userId) {
        return borrowMapper.findByUserId(userId);
    }

    @Override
    @Transactional(readOnly = true)
    public List<Borrow> findAll() {
        return borrowMapper.findAll();
    }

    @Override
    public boolean borrowBook(Integer userId, Integer bookId) {
        // 检查是否已借未还
        List<Borrow> active = borrowMapper.findActiveBorrowByUserAndBook(userId, bookId);
        if (!active.isEmpty()) {
            return false;
        }
        // 扣减可借数量
        int rows = bookMapper.decreaseAvailable(bookId);
        if (rows == 0) {
            return false;
        }
        // 创建借阅记录，默认借期30天
        Borrow borrow = new Borrow();
        borrow.setUserId(userId);
        borrow.setBookId(bookId);
        Calendar cal = Calendar.getInstance();
        cal.add(Calendar.DAY_OF_MONTH, 30);
        borrow.setDueTime(cal.getTime());
        return borrowMapper.insert(borrow) > 0;
    }

    @Override
    public boolean returnBook(Integer borrowId, Integer userId) {
        Borrow borrow = borrowMapper.findById(borrowId);
        if (borrow == null || borrow.getStatus() == 1) {
            return false;
        }
        // 普通用户只能归还自己的书
        if (userId != null && !userId.equals(borrow.getUserId())) {
            return false;
        }
        bookMapper.increaseAvailable(borrow.getBookId());
        return borrowMapper.returnBook(borrowId) > 0;
    }
}
