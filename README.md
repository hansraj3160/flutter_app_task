# 🚀 Titan Group Partners - Technical Assessment

## Overview
This project is a technical submission for the **Flutter Developer** position at Titan Group Partners. It demonstrates a full-stack implementation using a **PHP (Laravel) Backend API** and a **Flutter Frontend Application** utilizing **Clean Architecture** with **GetX** state management.

The app fetches a list of employees from the backend and displays them in a clean, responsive UI with error handling and loading states.

---

## 🛠️ Tech Stack

### **Frontend (Flutter)**
* **Framework:** Flutter (Dart)
* **State Management:** GetX
* **Architecture:** Clean Architecture (Feature-based)
    * *Layers:* Presentation (UI/Controllers), Domain (Repository Interfaces/Entities), Data (API Client/Repositories).
* **Networking:** HTTP Package with Custom API Client.

### **Backend (PHP/Laravel)**
* **Framework:** Laravel (PHP)
* **API:** RESTful JSON Endpoint.
* **Server:** Local Development Server (Artisan).

---

## 📂 Project Structure (Flutter)

## The Flutter application follows a scalable folder structure:
 lib/ 
 ├── api/ # Network Layer (ApiClient, Interceptors) 
 ├── features/ 
 │ └── employee/ # Feature: Employee List 
 │ ├── controller/ # State Management (GetXController) 
 │ ├── domain/ # Business Logic 
 │ │ ├── model/ # Data Models 
 │ │ ├── repository/ # Repository Interfaces 
 │ │ └── services/ # Service Interfaces 
 │ └── presentation/ # UI Widgets & Screens 
 ├── helper/ # Dependency Injection (get_di.dart) 
 ├── utils/ # Constants (AppConstants, Strings) 
 └── main.dart # Entry Point 
---

## ⚙️ Setup & Installation Guide

### 1️⃣ Backend Setup (Laravel)

1.  Navigate to the backend folder:
    ```bash
    cd backend_folder
    ```
2.  Install dependencies (if required):
    ```bash
    composer install
    ```
3.  **Start the Server (Important):**
    To allow the mobile device/emulator to access the API, run the server on `0.0.0.0`:
    ```bash
    php artisan serve --host=0.0.0.0 --port=8000
    ```
    *The API will be accessible at: `http://YOUR_LOCAL_IP:8000/api/employees`*

### 2️⃣ Frontend Setup (Flutter)

1.  Navigate to the Flutter project folder:
    ```bash
    cd flutter_demo_app
    ```
2.  Install dependencies:
    ```bash
    flutter pub get
    ```
3.  **Configure IP Address:**
    * Open `lib/utils/app_constant.dart`.
    * Replace the `baseUrl` with your machine's local IP address (find it using `ipconfig` or `ifconfig`).
    ```dart
    static const String baseUrl = '[http://192.168.1.](http://192.168.1.)X:8000';
    ```
4.  Run the application:
    ```bash
    flutter run
    ```

---

## 📱 Features Implemented

* ✅ **Fetch Data:** Retrieves employee records from the Laravel API.
* ✅ **Clean UI:** Displays data in a styled ListView with Avatars.
* ✅ **State Management:** Handles Loading, Success, and Error states efficiently.
* ✅ **Error Handling:** "Retry" mechanism if the API call fails or internet is unavailable.
* ✅ **Network Handling:** Custom `ApiClient` that manages timeouts and headers.

---

