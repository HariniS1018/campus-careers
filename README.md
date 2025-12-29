# CampusCareers 🎓💼

CampusCareers is a web-based application designed to streamline the process of managing campus recruitment opportunities. It provides separate interfaces for **admins** (to create and manage opportunities) and **applicants** (to view and apply for opportunities). The system also supports password recovery, interview management, and session handling.

---

## 📂 Project Structure
CampusCareers/ ├── src/ │    ├── controller/         # Servlets/Controllers handling requests │    │     ├── AddOpportunity.java │    │     ├── AdminLoginController.java │    │     ├── ApplicantLoginController.java │    │     ├── ApplyOpportunity.java │    │     ├── DeleteOpportunity.java │    │     ├── EditOpportunity.java │    │     ├── FetchAppliedOpportunity.java │    │     ├── FetchOpportunity.java │    │     ├── LogOutController.java │    │     └── RecoverPasswordController.java │    ├── dao/                # Data Access Objects for DB operations │    │     ├── ApplyInterviewDAO.java │    │     ├── InterviewDAO.java │    │     └── RecoverPassword.java │    ├── model/              # JavaBeans / POJOs │    │     ├── Admin.java │    │     ├── Applicant.java │    │     ├── Interview.java │    │     └── OfferCourse.java │    └── util/ │          └── DBConnection.java   # Database connection utility │ ├── WebContent/ │    ├── jsp/                # JSP pages (views) │    │     ├── AddOpportunity.jsp │    │     ├── AdminLogin.jsp │    │     ├── ApplicantLogin.jsp │    │     ├── EditOpportunity.jsp │    │     ├── Index.jsp │    │     ├── RecoverPassword.jsp │    │     ├── ViewAppliedOpportunity.jsp │    │     ├── ViewOpportunityAdmin.jsp │    │     └── ViewOpportunityApplicant.jsp │    ├── css/                # Stylesheets │    │     ├── add_opportunity.css │    │     ├── footer.css │    │     ├── header.css │    │     ├── index.css │    │     ├── login.css │    │     ├── recover_password.css │    │     └── view_opportunity.css │    └── images/             # Static assets │ ├── .gitignore └── README.md

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
   git clone https://github.com/your-username/CampusCareers.git