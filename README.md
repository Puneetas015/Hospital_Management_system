# 🏥 Hospital — Modern Healthcare & Appointment AI Management Suite
## Complete End-to-End Clinic Operations & Administrative Portal

---

## ✨ Empowering Healthcare Through Minimalist Automation

**Puneet Hospital Management System** is a secure, production-ready healthcare management application designed to streamline medical workflows by synchronizing patient interactions, administrative operations, and secure clinical records. By utilizing classic relational databases, dynamic validation loops, and a premium administrative role paradigm, the platform provides hospital staff and patients with a unified dashboard to manage schedules smoothly.

Built completely using **ASP.NET Web Forms (C#)**, **ADO.NET**, **Microsoft SQL Server (`.mdf`)**, and styled entirely following a photography-first premium **Apple Design Analysis** framework, this platform showcases how highly secure role restrictions and dynamic light/dark UI themes can exist seamlessly inside a single enterprise dashboard.

---

## 🖼️ Interface & Module Walkthrough

### 📊 Administrative Command Hub
An exclusive administrative center built to track, search, alter, and manage patient appointments at a macro level. Features localized state memory toggles for operational efficiency.

### 🌓 Theme Switcher Architecture
A system-wide persistent light and dark mode manager that seamlessly transforms surface tokens between light canvas layers (`#ffffff` / `#f5f5f7`) and deep museum-style slate backdrops (`#000000` / `#272729`).

### 📑 Patient Registration & Portal
A modern public-facing portal allowing patients to browse available departments (Neurology, Cardiology, Pediatrics, etc.), create localized profiles, and book custom clinical slots.

---

## 🛠️ System Architecture Summary

## Prerequisites
- Visual Studio Community 2022 (or professional builds)
- .NET Framework 4.7.2+
- Microsoft SQL Server Express LocalDB (for `.mdf` file attachments)
- Standard web browser engine (Edge, Chrome, or Safari)

---

## Step 1 — Project Setup

```bash
# Clone the repository and navigate to the project root directory
git clone [https://github.com/Puneetas015/Hospital_Management_system.git](https://github.com/Puneetas015/Hospital_Management_system.git)
cd Hospital_Management_System_With_ASP.NET-main

# Clean the old Visual Studio build files locally
# Open Visual Studio, click "Build" -> "Clean Solution"

# Initialize local environment configurations (.gitignore handles .vs/ and bin/ automatically)
git status
```

---
## Step 2 — Configuration & Database Binding

1) Open the solution file Hospital_management_System.sln inside Visual Studio Community.
2) Ensure your internal project database engine targets the localized schema file App_Data/Puneet.mdf.
3) Verify your connection string properties inside the core Web.config schema file:

```bash
XML
<connectionStrings>
  <add name="HospitalDB" 
       connectionString="Data Source=(LocalDB)\MSSQLLocalDB;AttachDbFilename=|DataDirectory|\Puneet.mdf;Integrated Security=True" 
       providerName="System.Data.SqlClient" />
</connectionStrings>
```

## Step 3 — Secure Administrative Access Setup
To access the restricted Check Appointments operational dashboard (UpdateAppoinment.aspx), use the hardcoded master administrative credentials. Normal patient logins will automatically redirect away from this view to preserve strict clinical privacy.

• Admin Username: Puneetas015
• Admin Password: 123456

## Step 4 — Running the Application
```bash
# Press F5 or click the 'Play' button in Visual Studio to launch the IIS Express web engine server
# Default application server routing context will spin up at:
http://localhost:44306/Users/Home.aspx
```
---

## Admin Panel Features
Visit the UpdateAppoinment.aspx interface logged in as Admin to run complete CRUD cycles:

• Create/Book: Input fresh slots with automated strict DateTime.ParseExact validation.
• Read: View real-time patient rosters inside a clean, modern grid.
• Update: Click Edit/Update to open a dynamic contextual input tray inline.
• Delete: Instantly wipe out canceled appointment files via parameterized SQL calls.

## Troubleshooting

| Issue | Root Cause Analysis & Fix |
|---|---|
| `Database connection failed / Instance not found` | LocalDB instance not initialized or offline. Open terminal and run `sqllocaldb start mssqllocaldb` to spin up the local database engine database instance. |
| `Check Appointments tab not visible in navbar` | Strict role authorization fallback. The tab is hidden dynamically by default. You must log in explicitly via `Loginpage.aspx` using the Admin profile (`Puneetas015`). |
| `String or binary data would be truncated` | Schema size mismatch. Mobile number database column limits are bounded to nvarchar(50). Ensure your standard mobile inputs do not exceed parameter allocation bounds. |
| `Access Denied / Direct URL redirection loop` | Explicit URL hacking prevention. If you attempt to bypass credentials and load `UpdateAppoinment.aspx` anonymously, the `Page_Load` route guard will automatically terminate the session and redirect to `Loginpage.aspx`. |
| `FormatExceptions / Date processing crashes` | String-to-DateTime casting failure. The core operational system implements structural validation. Ensure calendar date picker values strictly parse against the execution template format: `dd/MM/yyyy`. |
