# High-Level Software Requirement Specification (SRS)
## Project: PALASH MTB-MLE AI-Assisted Education App

### 1. Introduction
**1.1 Purpose**
The purpose of this document is to outline the high-level software requirements for the PALASH Mother Tongue-Based Multilingual Education (MTB-MLE) application. 

**1.2 Project Background**
Jharkhand’s primary schools face a critical bottleneck: teachers are primarily Hindi-medium trained, while students natively speak tribal languages like Ho, Mundari, and Santhali. This app acts as a technology bridge, enabling teachers to deliver Foundational Literacy and Numeracy (FLN) instruction in the students' mother tongues without requiring prior language training.

---

### 2. Target Audience
* **Primary Users:** Government primary school teachers in tribal areas of Jharkhand.
* **Secondary Users (Beneficiaries):** Primary school students speaking Ho, Mundari, and Santhali.
* **Administrators:** State education officials for content updates and syncing.

---

### 3. Functional Requirements (What the App Must Do)

**3.1 Real-Time Voice-to-Voice Translation**
* The app must allow a teacher to speak in Hindi and instantly play the translated audio in the selected tribal language.
* Must support standard classroom commands, interactive dialogue, and conversational prompts.

**3.2 Curriculum Translation Engine**
* The app must translate standard Hindi FLN curriculum content (lesson scripts, activity instructions, assessments) into contextually accurate text and audio in the target tribal languages.

**3.3 Bilingual Content Generator (Worksheets & Flashcards)**
* The app must feature a tool to automatically generate printable, bilingual (Hindi & Tribal Language) worksheets.
* Must generate visual flashcards mapped to the **NIPUN Bharat** learning outcomes framework.
* Must allow teachers to select the grade, subject, and specific learning outcome to generate relevant materials.

**3.4 Offline Operation (Zero-Internet Mode)**
* Once the app is downloaded and synchronized, all core features (translation, voice generation, and worksheet creation) MUST function 100% offline.
* The app must store required dictionaries, translations, and illustrations locally on the device.

---

### 4. Non-Functional Requirements (How the App Must Perform)

**4.1 Performance & Speed**
* **Latency:** Voice-to-voice translation must have a maximum delay of **3 seconds** from the time the teacher stops speaking to the audio output.
* **Content Generation:** Worksheets and flashcards should render instantly for local viewing and printing.

**4.2 Hardware & Platform Constraints**
* **Operating System:** Must support older and low-cost devices (Android 9+ and standard iOS).
* **Memory Limits:** Must operate smoothly on devices with a maximum of **2 GB RAM**.
* **Storage:** The total app size (including all offline models, audio files, and templates) must be highly compressed to fit on standard entry-level tablets.

**4.3 Reliability & Syncing**
* The app must not crash when internet connectivity drops during usage.
* Must feature a "Background Sync" mechanism that silently updates curriculum databases and translation improvements when the device detects a stable Wi-Fi/Mobile network.

---

### 5. User Interface (UI) and Experience (UX)

**5.1 Simplicity & Accessibility**
* The interface must be highly intuitive, catering to teachers who may have limited technical expertise.
* Large, clear buttons for recording audio and generating materials.
* Easy toggle switches to change the target tribal language (e.g., Switch from Santhali to Ho).

**5.2 Core Modules / Screens**
1. **Classroom Mode:** A dedicated screen for live voice translation (Push-to-Talk style interface).
2. **Curriculum Mode:** A digital library of pre-translated lesson plans and scripts.
3. **Studio Mode (Generator):** A screen to select parameters (Class, Topic) and view/export auto-generated worksheets and flashcards as PDFs.

---

### 6. Out of Scope (For Phase 1)
* Two-way translation (translating student tribal speech back to Hindi) is complex and will be deferred to later versions.
* Gamified student-facing digital assessments (this app is strictly a teacher-enablement tool).
