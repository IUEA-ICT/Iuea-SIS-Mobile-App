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

//        Splash Screen

# Student Profile Menu

### 🧱 Overall Profile Structure

The profile screen is built as a `ListView` containing several distinct sections:

* `ProfileHeader` – Displays the student's profile picture, full name, and registration number.
* `BasicInformationCard` – Displays core academic details.
* `ContactInformationCard` – Displays administrative and personal contact details.
* `FinancialInformationCard` – Displays billing and payment information.
* `CourseDetailsCard` – Displays academic progress details (semester, year, status).

---

### 🧍‍♂️ ProfileHeader

Shows the student's key identity information:

* Profile picture (avatar)
* Full name: **Mugalu Wa Thumba Daniel**
* Registration number: **24/276/BSCS-S**

---

### 📘 Basic Information

Core academic data:

* Registration number **24/276/BSCS-S**
* Full name **Mugalu Wa Thumba Daniel**
* Program: **Bachelor of Science in Computer Science (BSCS)**
* Academic Award: **BACHELOR**

---

### ☎️ Contact Information

Administrative and personal contact data:

* Phone: **256772826718**
* Email: **[danielmugalu945@gmail.com](mailto:danielmugalu945@gmail.com)**
* Gender: **Male**
* Nationality: **CG**
* Passport No.: **OP1562669**
* Passport Expiry Date: **2028-12-18**
* Visa Status: **Valid**
* Visa Expiry Date: **2025-06-18**

---

### 💰 Financial Information

Billing and payment summary:

* Total Billed: **\$3,012.00**
* Total Paid: **\$3,112.00**
* Balance: **-\$100.00** *(credit)*

---

### 📚 Course Details

Academic progress details:

* Intake Period: *(to be filled)*
* Progress Semester: *(to be filled)*
* Progress Year: *(to be filled)*
* Student Status: *(to be filled)*

---

### 💡 Technical Notes

* Each section is encapsulated in a `Card` for clean display and modularity.
* Flutter icons such as `Icons.phone`, `Icons.email`, etc., are recommended.
* The layout uses `ListView`, `Padding`, `Column`, and `Text` for a responsive UI.

---

## Package structure

lib/
├── features/                        # Main features of the application
│
│   ├── profile/                     # User profile section
│   │   ├── profile_screen.dart             # Main profile screen
│   │   ├── profile_header.dart             # Profile picture, name, registration number
│   │   ├── basic_info.dart                 # Registration number, Full name, Program, academic award
│   │   ├── contact_info.dart               # Phone, E-mail, Gender, Nationality, Nassport N°, Passport Expiry Date, Visa Status, Visa Expiry Date
│   │   ├── financial_info.dart             # Total billed ($), Total Paid ($), Balance ($)
│   │   └── course_details.dart             # Intake Period, Progress Semester, Progress Year, Student Status
│
│   └── auth/                        # Authentication (login, logout)
│       ├── login_screen.dart
│       └── auth_service.dart
│
├── main.dart                        # Application entry point
