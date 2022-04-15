package com.example.security1.repository;

import com.example.security1.model.User;
import org.springframework.data.jpa.repository.JpaRepository;


// CRUD 함수를 JpaRepository가 들고 있음
// @Repository라는 어노테이션이 없어도 ioC됩니다. 이유는 JpaRepository 상속했기 때문에
public interface UserRepository extends JpaRepository<User, Integer> {
    // select * from user where username = 1?
    public User findByUserName(String userName);

    // select * from user where email = 1?
    public User findByEmail(String email);

}
