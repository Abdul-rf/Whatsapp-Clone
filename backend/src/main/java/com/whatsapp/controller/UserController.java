package com.whatsapp.controller;

import com.whatsapp.entity.User;
import com.whatsapp.service.UserService;
import org.springframework.web.bind.annotation.*;
import com.whatsapp.dto.UserRequest;
import com.whatsapp.dto.UserResponse;
import java.util.List;
import jakarta.validation.Valid;

@RestController
@RequestMapping("/users")
public class UserController {

    private final UserService userService;

    public UserController(UserService userService) {
        this.userService = userService;
    }

    // POST /users
    @PostMapping
    public UserResponse createUser(@Valid @RequestBody UserRequest request) {

        return userService.registerUser(request);
    }

    // GET /users
    @GetMapping
    public List<User> getAllUsers() {

        return userService.getAllUsers();
    }

    // GET /users/{id}
    @GetMapping("/{id}")
    public User getUserById(@PathVariable Long id) {

        return userService.getUserById(id);
    }

    // DELETE /users/{id}
    @DeleteMapping("/{id}")
    public String deleteUser(@PathVariable Long id) {

        userService.deleteUser(id);

        return "User deleted successfully";
    }
}