# CampusCareers 🎓💼

CampusCareers is a web-based application designed to streamline the process of managing campus recruitment opportunities. It provides separate interfaces for **admins** (to create and manage opportunities) and **applicants** (to view and apply for opportunities). The system also supports password recovery, interview management, and session handling.

---

## 📂 Project Structure 
(can be viewed in doc.txt file)

---

## 📂 Outputs
output screenshots are found in outputs folder

---

## 🚀 Features

- **Admin Panel**
  - Login/logout functionality
  - Add, edit, and delete opportunities
  - View all opportunities created by admins

- **Applicant Panel**
  - Login/logout functionality
  - View available opportunities
  - Apply for active opportunities
  - View applied opportunities

- **Password Recovery**
  - Reset password via recovery flow

- **Interview Management**
  - DAO layer for handling interview-related data

- **Database Integration**
  - Centralized `DBConnection.java` utility for JDBC connections

---

## 🛠️ Tech Stack

- **Backend:** Java Servlets, JSP  
- **Frontend:** JSP, HTML, CSS  
- **Database:** MySQL (or any JDBC-compatible DB)  
- **Build Tool:** Apache Tomcat (for deployment)  
- **Version Control:** Git  

---

## ⚙️ Setup Instructions

1. **Clone the repository**
   ```bash
   git clone https://github.com/HariniS1018/campus-careers.git
   ```

2. **Configure Database**
   - Create a MySQL database (e.g., `campus_careers`).
   - Update `DBConnection.java` with your DB credentials.

3. **Deploy on Tomcat**
   - Copy the project into Tomcat’s `webapps` directory.
   - Start Tomcat server.

4. **Access Application**
   - Open browser and go to:  
     ```
     http://localhost:8080/CampusCareers/Index.jsp
     ```
---

## 👥 User Roles

- **Admin**
  - Manages opportunities
  - Views all opportunities
- **Applicant**
  - Views and applies for opportunities
  - Tracks applied opportunities

---

## 📸 Screens (JSP Pages)

- `Index.jsp` → Index page  
- `AdminLogin.jsp` → Admin login  
- `ApplicantLogin.jsp` → Applicant login  
- `AddOpportunity.jsp` → Add new opportunity  
- `EditOpportunity.jsp` → Edit existing opportunity  
- `ViewOpportunityAdmin.jsp` → Admin view of opportunities  
- `ViewOpportunityApplicant.jsp` → Applicant view of opportunities  
- `ViewAppliedOpportunity.jsp` → List of applied opportunities  
- `RecoverPassword.jsp` → Password reset  

---