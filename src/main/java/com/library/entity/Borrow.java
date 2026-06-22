package com.library.entity;

import java.util.Date;

public class Borrow {
    private Integer id;
    private Integer userId;
    private Integer bookId;
    private Date borrowTime;
    private Date returnTime;
    private Date dueTime;
    /** 0: 借阅中, 1: 已归还 */
    private Integer status;

    // 关联对象，用于展示
    private User user;
    private Book book;

    public Integer getId() { return id; }
    public void setId(Integer id) { this.id = id; }

    public Integer getUserId() { return userId; }
    public void setUserId(Integer userId) { this.userId = userId; }

    public Integer getBookId() { return bookId; }
    public void setBookId(Integer bookId) { this.bookId = bookId; }

    public Date getBorrowTime() { return borrowTime; }
    public void setBorrowTime(Date borrowTime) { this.borrowTime = borrowTime; }

    public Date getReturnTime() { return returnTime; }
    public void setReturnTime(Date returnTime) { this.returnTime = returnTime; }

    public Date getDueTime() { return dueTime; }
    public void setDueTime(Date dueTime) { this.dueTime = dueTime; }

    public Integer getStatus() { return status; }
    public void setStatus(Integer status) { this.status = status; }

    public User getUser() { return user; }
    public void setUser(User user) { this.user = user; }

    public Book getBook() { return book; }
    public void setBook(Book book) { this.book = book; }
}
