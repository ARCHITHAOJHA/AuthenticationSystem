# AuthenticationSystem

# 🔐 Authify - Full Stack Authentication System

## 🚀 Project Overview

Authify is a full-stack authentication system built using **React** and **Spring Boot**. It provides secure user authentication with OTP email verification, ensuring safe and reliable access control.

---

## 🛠️ Tech Stack

* **Frontend:** React.js
* **Backend:** Spring Boot
* **Database:** MySQL
* **Authentication:** OTP via Email (SMTP - Gmail)
* **API:** RESTful APIs

---

## ✨ Features

* 🔑 User Registration & Login
* 📧 Email OTP Verification
* 🔒 Secure Authentication Flow
* 🌐 REST API Integration
* ⚡ Responsive UI using React
* 🛡️ Error Handling & Validation

---

## 📁 Project Structure

```
Authify/
│
├── frontend/        # React Application
├── backend/         # Spring Boot Application
│   ├── controller/
│   ├── service/
│   ├── model/
│   └── config/
│
└── README.md
```

---

## ⚙️ Setup Instructions

### 🔹 Backend (Spring Boot)

1. Navigate to backend folder:

```
cd backend
```

2. Configure environment variables:

```
MAIL_HOST=smtp.gmail.com
MAIL_PORT=587
MAIL_USERNAME=yourgmail@gmail.com
MAIL_PASSWORD=your_app_password
MAIL_FROM=yourgmail@gmail.com
```

3. Run the application:

```
mvn spring-boot:run
```

---

### 🔹 Frontend (React)

1. Navigate to frontend folder:

```
cd frontend
```

2. Install dependencies:

```
npm install
```

3. Start the app:

```
npm start
```

---

## 🔗 API Endpoints

| Method | Endpoint         | Description    |
| ------ | ---------------- | -------------- |
| POST   | /auth/register   | Register user  |
| POST   | /auth/send-otp   | Send OTP email |
| POST   | /auth/verify-otp | Verify OTP     |
| POST   | /auth/login      | User login     |

---

## 🧪 Testing

* Use Postman or frontend UI to test APIs
* Ensure SMTP configuration is correct for OTP emails

---

## ⚠️ Notes

* Use **Gmail App Password** (not normal password)
* Check spam folder if OTP is not received
* Ensure backend is running on port `8080` and frontend on `3000`

---

## 👩‍💻 Author

Developed as a full-stack project using React and Spring Boot.

---

## ⭐ Future Enhancements

* JWT-based authentication
* Password reset via email
* Role-based access control
* Deployment (AWS / Docker)

---
