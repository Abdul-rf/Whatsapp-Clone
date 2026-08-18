package com.whatsapp.controller;

import com.whatsapp.dto.AuthRequest;
import com.whatsapp.dto.AuthResponse;
import com.whatsapp.service.AuthService;

import org.springframework.web.bind.annotation.*;

@RestController
@RequestMapping("/auth")
public class AuthController {

    private final AuthService authService;

    public AuthController(AuthService authService) {
        this.authService = authService;
    }

    @PostMapping("/login")
    public AuthResponse login(
            @RequestBody AuthRequest request) {

        return authService.login(request);
    }
}