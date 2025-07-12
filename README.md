# nourish
Group project for holistic skin &amp; soul care app
# 🌿 Nourish — Skin & Soul Care App

**Nourish** is a group Flutter app built for a university hackathon.  
It combines AI skin analysis with personal journaling and spiritual encouragement.

---

## 📱 Features

- Upload and scan your skin using AI
- Receive personalized skincare tips and verses
- Log thoughts, prayers, and emotions in a private journal
- Simple, modern UI — built for Android

---

## 👥 Team Members & Tasks

| Member     | GitHub Username   | Role                   | Assigned Tasks |
|------------|-------------------|------------------------|----------------|
| Whitney    | `@git-Whitney`    | Team Lead & Integrator | 🗂️ Folder structure<br>🔁 Screen navigation<br>📦 Integration<br>📝 PR reviews |
| Wilson     | `@Wilsonthoma`    | UI/UX Designer         | 🎨 Design Welcome/Login/Dashboard<br>🎨 Style screens<br>🔘 Button layouts |
| Selina     | `@doctor-nails`   | Scan/AI                | 🤳 Scan screen<br>🧠 AI mock result<br>📷 Image picker |
| Joan       | `@Joan6316`       | Journal/Verse          | 📓 Journal screen<br>📖 Verse of the day<br>💾 Save/load notes |
| Steve      | `@Vohtieno`       | Testing/Deployment     | 🧪 Test screens<br>📱 Android builds<br>🔍 User feedback |
| Patience   | `@Pesh638`        | Content & Help         | ❓ Help screen<br>💬 Onboarding messages<br>📜 About Us<br>🔤 Text proofreading |


## 🚀 Getting Started

### 🔧 Prerequisites

- Flutter SDK installed
- Android Studio (or VS Code with Flutter extension)
- Git

### 💻 Local Setup (Clone & Run)

1. Accept the GitHub invite ✅
2. Clone the project:
   ```bash
   git clone https://github.com/git-Whitney/nourish.git
   cd nourish
   flutter pub get

## ✅ Team To-Do Checklist

_Use this section to track everyone's progress. Mark tasks as complete using ✅ or [x]_

---

### 👩‍💻 Whitney  (Team Lead / Integration)
- [ ] Create `README.md` and push project to GitHub ✅
- [ ] Set up folder structure in `lib/screens/`
- [ ] Set up navigation between screens (`main.dart`)
- [ ] Help teammates with Flutter setup
- [ ] Review pull requests and manage merges
- [ ] Assist others with integration and debugging

---

### 🎨 Wilson (UI/UX Design)
- [ ] Build `welcome_screen.dart` with logo + start button
- [ ] Design `login_screen.dart` (form, buttons, layout)
- [ ] Design `dashboard_screen.dart` with main options
- [ ] Ensure consistent color scheme, font, and spacing
- [ ] Add UI icons or animation (optional)

---

### 🤖 Selina (Skin Analysis & AI)
- [ ] Create `scan_screen.dart`
- [ ] Integrate `image_picker` plugin
- [ ] Simulate AI analysis result (e.g. dry/oily skin output)
- [ ] Create `result_screen.dart` to show diagnosis
- [ ] Display tip and Bible verse with result

---

### 📓 Joan (Devotionals & Journal)
- [ ] Create `journal_screen.dart` with text input
- [ ] Save and retrieve notes locally (use provider/shared_preferences)
- [ ] Add verse of the day (static or API-based)
- [ ] Show gratitude or mood selection (optional)
- [ ] Style journal for a calming experience

---


### 🧪 Steve (Testing & Deployment)
- [ ] Test app on physical Android devices
- [ ] Fix bugs or layout issues reported by team
- [ ] Run `flutter build apk` and share for review
- [ ] Check responsiveness (small vs. large phones)
- [ ] Assist others with Git if needed

---
---

### 📜 Patience (Content & Help)

- [ ] Create `help_screen.dart` to explain how the app works
- [ ] Write short onboarding text for `welcome_screen.dart` and `login_screen.dart`
- [ ] Build `about_us_screen.dart` with team names, app purpose, and hackathon note
- [ ] Suggest 3–5 daily skincare tips to appear after scan or on dashboard
- [ ] Proofread all button text, labels, and screen titles for clarity and grammar
- [ ] Optional: Suggest or design splash screen content (logo + app title loading page)


## 📅 Weekly Goals

> 💡 Adjust based on team pace. Each member should aim to finish their screen by Week 2–3.

---

### ✅ Week 1 – Planning & Setup
- [x] Finalize idea, app name, and team roles
- [x] Create GitHub repo and invite collaborators
- [x] Set up Flutter project structure
- [x] Create initial wireframe/prototype and assign screens
- [x] Each member sets up Flutter + Git locally

---

### 🚧 Week 2 – Screen Development
- [ ] Each member builds their assigned screen(s)
- [ ] Add navigation between screens via `main.dart`
- [ ] UI polish (colors, layout, font, icons)
- [ ] Start content drafting (welcome text, verses, tips)
- [ ] Begin basic testing (run on Chrome/phone)

---

### 🛠️ Week 3 – Integration & Feature Testing
- [ ] Connect screens together
- [ ] Implement features like image picker, local storage
- [ ] Finalize journal + AI logic (mock okay)
- [ ] Test on real Android devices
- [ ] Team code review & bug fixing

---

### 🎯 Week 4 – Polish & Submission
- [ ] Final styling tweaks and text proofreading
- [ ] Add splash screen and about/help pages
- [ ] Generate APK and test final build
- [ ] Update `README.md` and project board
- [ ] Submit project and prepare demo/presentation
