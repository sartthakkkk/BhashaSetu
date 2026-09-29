# BhashaSetu (भाषा सेतु)

*A bridge between Hindi/English-medium teachers and tribal-language-speaking children in Jharkhand.*

Built for *Smart India Hackathon (SIH)*  
Problem Statement ID: <SIH26042> | Team: <Team Optimistics>

---

## The Problem

In Jharkhand's tribal-area primary schools, most teachers are trained to teach in Hindi/English, while many students speak *Santhali, Ho or Mundari* at home. This language gap makes it hard to deliver Foundational Literacy and Numeracy (FLN) in the early years, when children learn best in their mother tongue.

## Our Solution

BhashaSetu is a teacher-enablement app based on *Mother Tongue-Based Multilingual Education (MTB-MLE)*. It lets a teacher speak in Hindi/English and get the same content in the child's tribal language, with text, phonetic pronunciation and audio, without needing to know the language beforehand.

## Key Features

| Module | What it does |
|---|---|
| *Live Classroom Translation* | Push-to-talk Hindi/English input. Shows the tribal-language translation, transliteration and phonetic pronunciation, then plays it aloud. Includes quick classroom commands, a custom text option and slow-speed playback. |
| *NIPUN Studio* | Filter by grade (Balvatika, Class 1, Class 2) and FLN competency (numeracy, oral expression, phonological awareness, picture vocabulary, classroom habits). Get bilingual flashcards and generate printable Hindi + tribal-language worksheets mapped to NIPUN Bharat learning outcomes. |
| *FLN Curriculum Hub* | Pre-translated weekly lesson scripts and classroom dialogues. Tap any step to hear its pronunciation. |
| *Offline & AI Engine Hub* | Shows offline status, sync state, on-device voice packs and device benchmarks (RAM and latency targets). Includes a scenario sandbox for testing custom phrases. |

*Supported languages:* Santhali (Ol Chiki), Ho, Mundari  
*Target users:* Government primary school teachers in tribal areas of Jharkhand

## Design Goals

- Works fully *offline* after the first sync
- Voice-to-voice translation in under *3 seconds*
- Runs on low-cost devices with *2 GB RAM* (Android 9+ and iOS)
- Large buttons and a simple interface for teachers with limited tech experience
- Background sync for curriculum and translation updates

## Current Status: Working Prototype

This repository contains the *front-end prototype* that demonstrates the full user experience and flow. To be transparent about what is and isn't real yet:

- *Working:* UI and navigation, language switching, flashcard and worksheet browsing, curriculum scripts, Hindi text-to-speech via flutter_tts.
- *Simulated with sample data:* translations come from a built-in phrase library (lib/data/palash_mock_data.dart). Voice recognition, latency, sync and printing are simulated.
- *Planned:* on-device speech recognition and translation models, native tribal-language voice packs, real PDF export and Bluetooth printing, background sync with a state education content server.

## Tech Stack

- *Flutter* (Dart SDK ^3.11.1), Material 3 dark theme
- flutter_tts for speech output
- flutter_animate for animations
- google_fonts for typography
- Platform folders included for Android, iOS, web, macOS and Windows

## Project Structure


lib/
├── main.dart                  # App entry point
├── core/
│   ├── theme/                 # Colors, typography, glass-style UI
│   └── services/              # Text-to-speech service
├── data/                      # App state and sample data
├── models/                    # Language, grade, competency, flashcard models
├── screens/                   # Live translation, NIPUN Studio, Curriculum, Offline Hub
└── widgets/                   # Navbar, flashcards, mic orb, waveform, worksheet dialog
assets/images/                 # Logos
ai_contexts/                   # Software requirement specification (SRS)


## Getting Started

*Prerequisites:* [Flutter SDK](https://docs.flutter.dev/get-started/install) (3.11 or later) and an Android emulator/device, or Chrome.

bash
# 1. Clone the repository
git clone https://github.com/<sartthakkkk>/<Bhashasetu>.git
cd <Bhashasetu>

# 2. Install dependencies
flutter pub get

# 3. Run the app
flutter run


To build an Android APK:

bash
flutter build apk --release


## Documentation

The full high-level requirements are in [ai_contexts/palash_mtb_mle_srs.md](ai_contexts/palash_mtb_mle_srs.md).
