# 🐻✨ Interactive Rive Animated Login Screen

Welcome to the **Interactive Animated Login Screen**! This project transforms a standard, boring login form into an engaging and dynamic user experience. By integrating a reactive 2D character, the UI responds in real-time to the user's input, making the authentication process fun and highly interactive.

---

## 🎓 Academic Context

* **Course:** Graficacion
* **Professor:** Rodrigo Fidel Gaxiola Sosa
* **Project Type:** Interactive UI / Animation Implementation

---

## 🚀 Key Functionalities

This application is designed to showcase how UI elements can seamlessly communicate with complex animations. The core features include:

* 🕵️ **Real-Time Eye Tracking (Checking Mode):** When the user clicks on the "Email" text field, the bear mascot smoothly transitions into a state where it follows the cursor/typing action, visually confirming that the user is interacting with that specific field.
* 🙈 **Privacy Protection (Hands-Up Mode):** Security and fun combined! As soon as the user focuses on the "Password" text field, the application triggers a state change, causing the bear to cover its eyes to "protect" the user's password.
* 👁️ **Dynamic Password Visibility:** A functional toggle button allows the user to reveal or obscure their password. This works independently of the animation but complements the overall login logic.
* 🧠 **Smart Focus Management:** Utilizing Flutter's `FocusNode` API, the application listens to which text field is currently active and immediately sends the corresponding boolean signals (`true` or `false`) to the animation's controller.
* 🧹 **Resource Management:** Memory leaks are prevented by properly disposing of the `FocusNode` controllers when the screen is destroyed.

---

## 🎨 What is Rive & What is a State Machine?

To understand how this magic happens, it is essential to know the core technologies driving the animation:

### What is Rive? 🐻
[Rive](https://rive.app/) is a cutting-edge platform for creating highly interactive animations. Unlike traditional formats like GIFs or MP4s that just play a fixed sequence of frames, Rive animations are rendered in real-time. This means they are incredibly lightweight, scale perfectly without losing quality, and, most importantly, can be manipulated via code at runtime. 

### What is a State Machine? ⚙️
A **State Machine** is essentially the "brain" of the animation. Instead of a single timeline, a State Machine contains multiple timelines (states) and rules (transitions) on how to move between them. 
In this project, the State Machine is named `Login Machine`. It listens for specific **SMI (State Machine Inputs)** from our Flutter code:

* `isChecking` (Boolean): Triggers the eye-tracking animation.
* `isHandsUp` (Boolean): Triggers the hands-covering-eyes animation.
* `trigSuccess` / `trigFail` (Triggers): Prepared inputs for future implementation to show a happy or sad reaction upon login attempt.

---

## 💻 Technologies & Tools Used

* 🦋 **Flutter:** The open-source UI software development kit created by Google. Used to build the application's structure and layout.
* 🎯 **Dart:** The object-oriented programming language used to write the Flutter logic.
* 🎬 **Rive Flutter Package (`rive`):** The official runtime library used to load the `.riv` file, instantiate the `StateMachineController`, and pass inputs from the UI to the animation.

---

## 📂 Project Structure

The project maintains a clean and straightforward architecture. Here are the main files located inside the `lib` directory:

> **lib/**
>  ┣ 📂 **screens/**
>  ┃ ┗ 📜 `login_screen.dart`   
>  ┗ 📜 `main.dart`

### 📝 File Deep-Dive

1. **`lib/main.dart`**
   * This is the entry point of the application.
   * It initializes the `MaterialApp`, sets up the global `ThemeData` (using a deep purple seed color), and defines `LoginScreen` as the home widget.

2. **`lib/screens/login_screen.dart`**
   * The core of the project. It is a `StatefulWidget` that holds the entire UI layout.
   * **Animation Initialization:** Uses `RiveAnimation.asset` to load `animated_login_bear.riv` and binds the `StateMachineController` during the `onInit` callback.
   * **Input Binding:** Extracts the `SMI` inputs (`_isChecking`, `_isHandsUp`) from the artboard so they can be modified dynamically.
   * **Listeners:** Implements `FocusNode` listeners inside `initState()` to detect exactly when the user enters or leaves the email and password fields, automatically adjusting the bear's posture.

---

## 🎬 Live Demo

Below is a demonstration of the interactive login screen in action. Notice how the bear reacts instantly to the user's focus on different text fields!

![App Demo Example](demo.gif)

> 💡 **Tip:** Replace `demo_placeholder.gif` with the actual path to your repository's demo file.

---

## 🏆 Credits & Acknowledgments

The beautiful animation used in this project was created by the talented community at Rive.

* 🔗 **Original Animation Link:** [Animated Login Character on Rive Marketplace](https://rive.app/marketplace/2244-7248-animated-login-character/)
* 🧑‍🎨 **Details:** Remix of login machine remix de Dexterc. All credits for the 2D rigging and state machine design go to the original creator.

---

