package com.library.entity;

import java.util.Date;

public class User {
    private Integer id;
    private String username;
    private String password;
    private String realname;
    private String email;
    private String phone;
    /** 0: 普通用户, 1: 管理员 */
    private Integer role;
    /** 0: 禁用, 1: 启用 */
    private Integer status;
    private Date createTime;

    public Integer getId() { return id; }
    public void setId(Integer id) { this.id = id; }

    public String getUsername() { return username; }
    public void setUsername(String username) { this.username = username; }

    public String getPassword() { return password; }
    public void setPassword(String password) { this.password = password; }

    public String getRealname() { return realname; }
    public void setRealname(String realname) { this.realname = realname; }

    public String getEmail() { return email; }
    public void setEmail(String email) { this.email = email; }

    public String getPhone() { return phone; }
    public void setPhone(String phone) { this.phone = phone; }

    public Integer getRole() { return role; }
    public void setRole(Integer role) { this.role = role; }

    public Integer getStatus() { return status; }
    public void setStatus(Integer status) { this.status = status; }

    public Date getCreateTime() { return createTime; }
    public void setCreateTime(Date createTime) { this.createTime = createTime; }

    public boolean isAdmin() { return Integer.valueOf(1).equals(this.role); }
}
