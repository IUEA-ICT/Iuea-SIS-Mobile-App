# 📚 IUEA Student Information System (SIS) App

This is a Flutter-based mobile application for the **International University of East Africa (IUEA)** that allows students to manage their academic, financial, and personal information in one centralized platform.

---

## 🧭 Features

### 🎓 Academics
- Course Unit Registration
- View Registered Courses
- Retake / Missed Paper Requests
- Course Evaluation Submission
- Student ID Access

### 💵 Financials
- View Financial Summary
- Download Fees Payment Receipts

### 🧪 Examinations
- View Exam Schedules
- Manage Retake Requests

### 🏠 Hostel Booking
- Book and manage hostel accommodation

### 📋 Clearance
- Monitor Graduation Clearance Status

### 🧑‍🎓 Profile
- View and edit basic student information
- View contact, financial, and course-related info

---

## 🛠️ Tech Stack

- **Flutter** (SDK >= 3.0)
- **Dart** language
- **Firebase** (optional backend integration)
- **State Management** (Provider / Riverpod / Bloc - based on your implementation)
- **Responsive UI** (Mobile-first)

---

## 📁 Project Structure
/lib
│
├── main.dart
├── app.dart                         # Main App with routes
├── config/ADNA                          # Theme, Constants, Enums, etc.
│   ├── app_theme.dart
│   └── constants.dart
│
├── core/                            # Common utilities, widgets, services
│   ├── widgets/
│   ├── services/
│   └── utils/
│
├── features/                        # Main app features by tab/section
│   ├── dashboard/ABRAHAM
│   │   └── dashboard_screen.dart
│
│   ├── financials/ ADNA
│   │   ├── financials_screen.dart
│   │   └── fees_payment_receipt.dart
│
│   ├── academics/SEMIRA
│   │   ├── academics_screen.dart
│   │   ├── course_unit_registration.dart
│   │   ├── registered_course_units.dart
│   │   ├── retakes_missed_papers.dart/DANIEL
│   │   ├── course_evaluation.dart
│   │   └── student_id.dart/DANIEL
│
│   ├── examination/SEMIRA
│   │   ├── examination_screen.dart
│   │   └── retakes.dart
│
│   ├── hostel_booking/ADNA
│   │   └── hostel_booking_screen.dart
│
│   ├── clearance/ABRAHAM
│   │   ├── clearance_screen.dart
│   │   └── graduation_clearance.dart
│
│   ├── profile/DANIEL                     # For user profile info
│   │   ├── profile_screen.dart
│   │   ├── contact_info.dart
│   │   ├── financial_info.dart
│   │   └── course_details.dart
│
│   └── auth/DANIEL                        # If login/logout is involved
│       ├── login_screen.dart
│       └── auth_service.dart
