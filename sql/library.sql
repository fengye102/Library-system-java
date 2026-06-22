-- 图书借阅管理系统数据库
CREATE DATABASE IF NOT EXISTS library DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;
USE library;

-- 用户表
CREATE TABLE IF NOT EXISTS `user` (
    `id`       INT AUTO_INCREMENT PRIMARY KEY,
    `username` VARCHAR(50)  NOT NULL UNIQUE COMMENT '用户名',
    `password` VARCHAR(100) NOT NULL COMMENT '密码',
    `realname` VARCHAR(50)  NOT NULL COMMENT '真实姓名',
    `email`    VARCHAR(100) COMMENT '邮箱',
    `phone`    VARCHAR(20)  COMMENT '手机号',
    `role`     TINYINT      NOT NULL DEFAULT 0 COMMENT '角色：0普通用户，1管理员',
    `status`   TINYINT      NOT NULL DEFAULT 1 COMMENT '状态：0禁用，1启用',
    `create_time` DATETIME  DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- 图书表
CREATE TABLE IF NOT EXISTS `book` (
    `id`          INT AUTO_INCREMENT PRIMARY KEY,
    `name`        VARCHAR(200) NOT NULL COMMENT '书名',
    `author`      VARCHAR(100) NOT NULL COMMENT '作者',
    `publisher`   VARCHAR(100) COMMENT '出版社',
    `isbn`        VARCHAR(30)  COMMENT 'ISBN',
    `category`    VARCHAR(50)  COMMENT '分类',
    `total`       INT          NOT NULL DEFAULT 1 COMMENT '总数量',
    `available`   INT          NOT NULL DEFAULT 1 COMMENT '可借数量',
    `description` TEXT         COMMENT '简介',
    `create_time` DATETIME     DEFAULT CURRENT_TIMESTAMP COMMENT '入库时间'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- 借阅记录表
CREATE TABLE IF NOT EXISTS `borrow` (
    `id`          INT AUTO_INCREMENT PRIMARY KEY,
    `user_id`     INT      NOT NULL COMMENT '借阅用户ID',
    `book_id`     INT      NOT NULL COMMENT '图书ID',
    `borrow_time` DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '借阅时间',
    `return_time` DATETIME COMMENT '归还时间',
    `due_time`    DATETIME NOT NULL COMMENT '应还时间',
    `status`      TINYINT  NOT NULL DEFAULT 0 COMMENT '状态：0借阅中，1已归还',
    FOREIGN KEY (`user_id`) REFERENCES `user`(`id`),
    FOREIGN KEY (`book_id`) REFERENCES `book`(`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- 初始化管理员账号（密码：admin123）
INSERT INTO `user` (`username`, `password`, `realname`, `role`) VALUES
('admin', 'admin123', '系统管理员', 1);

-- 初始化普通用户（密码：user123）
INSERT INTO `user` (`username`, `password`, `realname`, `email`, `phone`, `role`) VALUES
('zhangsan', 'user123', '张三', 'zhangsan@example.com', '13800000001', 0),
('lisi',     'user123', '李四', 'lisi@example.com',     '13800000002', 0);

-- 初始化图书数据
INSERT INTO `book` (`name`, `author`, `publisher`, `isbn`, `category`, `total`, `available`) VALUES
('Java编程思想',     'Bruce Eckel',      '机械工业出版社', '9787111213826', '编程', 3, 3),
('深入理解Java虚拟机', '周志明',           '机械工业出版社', '9787111641247', '编程', 2, 2),
('Spring实战',       'Craig Walls',      '人民邮电出版社', '9787115417305', '框架', 3, 3),
('MyBatis从入门到精通', '刘增辉',          '电子工业出版社', '9787121309885', '框架', 2, 2),
('MySQL必知必会',    'Ben Forta',         '人民邮电出版社', '9787115118584', '数据库', 2, 2),
('算法（第4版）',    'Robert Sedgewick', '人民邮电出版社', '9787115293800', '算法', 1, 1);
