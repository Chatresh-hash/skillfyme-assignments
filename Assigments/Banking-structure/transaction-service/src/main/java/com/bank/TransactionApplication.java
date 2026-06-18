package com.bank;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.web.bind.annotation.*;
import java.util.Map;
import java.util.UUID;

@SpringBootApplication
@RestController
@RequestMapping("/transactions")
public class TransactionApplication {

    public static void main(String[] args) {
        SpringApplication.run(TransactionApplication.class, args);
    }

    @GetMapping("/health")
    public Map<String, String> health() {
        return Map.of("status", "UP", "service", "Transaction Service");
    }

    @PostMapping
    public Map<String, Object> createTransaction(@RequestBody Map<String, Object> payload) {
        return Map.of(
            "transactionId", UUID.randomUUID().toString(),
            "status", "SUCCESS",
            "amount", payload.getOrDefault("amount", 0.0),
            "timestamp", System.currentTimeMillis()
        );
    }
}