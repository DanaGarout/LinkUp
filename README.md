# 💬 LinkUp – Real-Time Chat Application

**LinkUp** is a modern real-time messaging application built using **Flutter** for the frontend, **Django (REST API)** for the backend, and **Agora Chat SDK** for real-time communication.

The app focuses on secure authentication, clean UI/UX, scalable architecture, and production-ready development practices.

---

## ✨ Features

- User authentication (Sign up / Login / Forgot password)
- Secure backend powered by Django REST Framework
- Real-time one-to-one messaging using Agora Chat
- Chat list with latest message preview
- User profile management
- Clean and modern UI design
- Scalable frontend–backend architecture
- Responsive layout for multiple screen sizes

---

## 📱 Screenshots

> Screenshots are available in the `/screenshots` folder.

---

## 🛠️ Tech Stack

### Frontend
- **Flutter**
- **Dart**
- State Management (Provider / Riverpod / Bloc)

### Backend
- **Django**
- **Django REST Framework**
- JWT Authentication

### Real-Time Messaging
- **Agora Chat SDK**

### Tools & Services
- RESTful APIs
- Figma (UI/UX Design)
- Git & GitHub

---

## 🏗️ Architecture Overview

```text
Flutter App
   │
   │ REST API (Auth, Users)
   ▼
Django Backend (DRF)
   │
   │ Chat Services
   ▼
Agora Chat SDK
