# AUTHIFY - QUICK REFERENCE GUIDE

## 🎯 System Overview
Full-stack Spring Boot authentication system with JWT, email verification, and dashboard

## 📍 Quick Navigation
- **Backend API Base:** `http://localhost:8080/api/v1.0`
- **Frontend:** `http://localhost:5173`
- **Database:** MySQL (authify_app)

---

## 🔑 Key Endpoints Quick Reference

### 🔓 Public Endpoints (No Auth Required)
```
POST   /register                  - Register new user
POST   /login                     - Login user, get JWT token
POST   /logout                    - Logout user
POST   /send-otp                  - Send email verification OTP
POST   /verify-otp                - Verify email with OTP
POST   /send-reset-otp            - Send password reset OTP
POST   /reset-password            - Reset password with OTP
```

### 🔒 Protected Endpoints (Auth Required)
```
GET    /profile                   - Get user profile
PUT    /profile                   - Update user profile
GET    /dashboard                 - Get dashboard info
GET    /dashboard/stats           - Get user statistics (login count, last login)
GET    /is-authenticated          - Check if user is authenticated
```

---

## 📊 Database Schema

### tbl_users Columns
| Column | Type | Description |
|--------|------|-------------|
| id | BIGINT | Primary key |
| user_id | VARCHAR | Unique user identifier |
| name | VARCHAR | User's full name |
| email | VARCHAR | User's email (unique) |
| password | VARCHAR | BCrypt hashed password |
| verify_otp | VARCHAR | 6-digit OTP for email verification |
| is_account_verified | BOOLEAN | Email verification status |
| verify_otp_expire_at | BIGINT | OTP expiration time (ms) |
| reset_otp | VARCHAR | 6-digit OTP for password reset |
| reset_otp_expire_at | BIGINT | Reset OTP expiration time (ms) |
| login_count | BIGINT | Total login count |
| last_login_time | BIGINT | Last login timestamp (ms) |
| created_at | TIMESTAMP | Account creation time |
| updated_at | TIMESTAMP | Last update time |

---

## 🔄 User Flow

### Registration & Email Verification
```
1. POST /register
   ├─ Request: { email, password, name }
   ├─ Response: ProfileResponse with userId
   └─ Action: User receives email with verification prompt

2. POST /send-otp (Optional if not auto-sent)
   └─ Resend verification OTP to email

3. POST /verify-otp
   ├─ Request: { otp }
   └─ Response: Email verified, isAccountVerified = true
```

### Login & Dashboard Access
```
1. POST /login
   ├─ Request: { email, password }
   ├─ Response: JWT token + cookie
   ├─ Action: loginCount incremented, lastLoginTime updated
   └─ Token valid for: 10 hours

2. GET /dashboard
   ├─ Headers: Authorization: Bearer <JWT_TOKEN>
   └─ Response: Dashboard info + user details

3. GET /dashboard/stats
   ├─ Headers: Authorization: Bearer <JWT_TOKEN>
   └─ Response: User stats (loginCount, lastLoginTime)
```

### Profile Management
```
1. GET /profile
   ├─ Headers: Authorization: Bearer <JWT_TOKEN>
   └─ Response: Current user profile

2. PUT /profile
   ├─ Headers: Authorization: Bearer <JWT_TOKEN>
   ├─ Request: { name, email }
   └─ Response: Updated profile
```

### Password Reset
```
1. POST /send-reset-otp
   ├─ Query: ?email=user@example.com
   └─ Action: OTP sent to email

2. POST /reset-password
   ├─ Request: { email, otp, newPassword }
   └─ Action: Password updated
```

---

## 🔐 Security Features

- ✅ **JWT Authentication** - 10-hour validity
- ✅ **BCrypt Hashing** - Password encryption
- ✅ **CORS Enabled** - Only localhost:5173 allowed
- ✅ **HttpOnly Cookies** - Secure token storage
- ✅ **Email Verification** - Required for account access
- ✅ **Stateless Sessions** - No server-side session storage
- ✅ **CSRF Protection** - Disabled for stateless API
- ✅ **SameSite Strict** - Cookie security policy

---

## 🛠️ Configuration Files

### application.properties
```properties
# Database
spring.datasource.url=jdbc:mysql://localhost:3306/authify_app
spring.datasource.username=root
spring.datasource.password=sqlojha2005#
spring.jpa.hibernate.ddl-auto=update

# JWT
jwt.secret.key=thisisthesecretkeyievercreatedinmydevelopmentcareer

# API Context
server.servlet.context-path=/api/v1.0

# Email (SMTP)
spring.mail.host=smtp-relay.brevo.com
spring.mail.port=587
spring.mail.username=9f0e99001@smtp-brevo.com
```

---

## 📦 Project Structure

```
authify/
├── config/          - Security & app configuration
├── controller/      - REST API endpoints (Auth, Profile, Dashboard)
├── entity/          - Database entities (UserEntity)
├── io/              - DTOs (Request/Response objects)
├── repository/      - Database access layer (UserRepository)
├── service/         - Business logic (Auth, Profile, Dashboard, Email)
├── filter/          - JWT validation filter
├── util/            - Utility classes (JwtUtil)
└── resources/       - Configuration & templates
```

---

## 🐛 Recent Fixes (v1.1)

1. ✅ Fixed email typos (Resset → Reset)
2. ✅ Added missing OTP endpoints to security config
3. ✅ Added login tracking (loginCount, lastLoginTime)
4. ✅ Fixed dashboard statistics (real data)
5. ✅ Improved error messages
6. ✅ Added Dashboard & Profile components

---

## 🚀 Startup Commands

### Backend
```bash
# Using Maven Wrapper
cd authify
.\mvnw spring-boot:run

# Or using Maven
mvn spring-boot:run

# Or using Java
mvn clean install
java -jar target/authify-0.0.1-SNAPSHOT.jar
```

### Frontend (Separate project)
```bash
# Assuming React/Vue setup on localhost:5173
npm install
npm run dev
```

---

## 📋 Testing Checklist

- [ ] Register new user
- [ ] Send verification OTP
- [ ] Verify email with OTP
- [ ] Login with verified email
- [ ] Access dashboard
- [ ] Check login statistics
- [ ] Update profile
- [ ] Send password reset OTP
- [ ] Reset password
- [ ] Login with new password

---

## ⚠️ Common Issues & Solutions

### Issue: "Email not found for the email"
- **Cause:** User doesn't exist or wrong email
- **Solution:** Register user first

### Issue: "Invalid OTP"
- **Cause:** Wrong OTP or expired
- **Solution:** Request new OTP (expires in 24 hours)

### Issue: JWT Token Expired
- **Cause:** Token valid for 10 hours only
- **Solution:** Login again to get new token

### Issue: CORS Error
- **Cause:** Frontend not on localhost:5173
- **Solution:** Update CORS config in SecurityConfig

---

## 📞 Support Information

**Project:** Authify  
**Version:** 1.1  
**Java:** 21+  
**Spring Boot:** 4.0.1  
**Database:** MySQL 8.0+  

---

**Last Updated:** March 30, 2026  
**Status:** ✅ Production Ready

