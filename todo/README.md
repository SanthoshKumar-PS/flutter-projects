# 📝 Taskly App

A sleek, intuitive mobile application for managing your daily tasks, Taskly is built with Flutter for the frontend and a robust Node.js backend. Users can register, log in, and securely create and manage their to-do lists.
* **Real-time updates:** Tasks sync instantly across devices, so your list is always up-to-date.
* **User-friendly design:** An intuitive interface makes managing tasks a breeze for everyone.
---

## ✨ Features
🔑 User authentication: Register and log in securely.

➕ Create, view, and manage your tasks.

🔒 Token-based authentication for secure API interactions.

⚡ Fast and responsive UI.

🎨 Clean and user-friendly interface.

👤 Sidebar drawer for profile viewing and logout.

---
## 🚀 Getting Started
Follow these steps to get Taskly up and running on your local machine.


### Prerequisites - Make sure you have the following installed:
* Flutter SDK: For the mobile application.
* Node.js: For the backend server.
* MongoDB: The database for storing task data.

1. **Clone the repository:**

* git clone
* cd taskly_app

2. **Backend Setup:**

First, navigate to the backend directory and install the necessary dependencies.

* cd backend
* npm install

Next, configure your MongoDB connection in the backend code (e.g., in a .env file or configuration file). Then, start the backend server:

* npm start

3. **Frontend Setup:**

Now, navigate to the pubspec.yaml and install the Flutter dependencies.

* cd ..
* flutter pub get
4. **Finally, run the Flutter application:**

* flutter run

---

## 🛠️ Tech Stack
* Flutter – Cross-platform UI framework for mobile.
* Dart – Programming language for Flutter.
* Node.js – JavaScript runtime for the backend server.
* Express.js – Web application framework for Node.js.
* MongoDB – NoSQL database for data storage.
* Mongoose – MongoDB object data modeling for Node.js.
* Provider – State management solution for Flutter.

---

## 🔐 Authentication & Data Flow
When a user registers or logs in, the backend generates a token for authentication. This token is then used by the Flutter application to securely make requests to the backend, such as creating a new task. The backend verifies this token before adding the task to the database, ensuring data integrity and user authorization.

---

## 🙋‍♂️ Author
**Santhosh Kumar P S**

📧 Email: santhoshkumarsakthi2003@gmail.com