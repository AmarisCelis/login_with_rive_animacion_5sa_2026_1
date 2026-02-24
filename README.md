# 🐻✨ Interactive Rive Animated Login Screen
![Status](https://img.shields.io/badge/Status-In--Progress-yellow?style=for-the-badge)
![Platform](https://img.shields.io/badge/Platform-Flutter-blue?style=for-the-badge&logo=flutter)
![Flutter](https://img.shields.io/badge/Flutter-%2302569B.svg?style=for-the-badge&logo=Flutter&logoColor=white)
![Dart](https://img.shields.io/badge/dart-%230175C2.svg?style=for-the-badge&logo=dart&logoColor=white)
![Rive](https://img.shields.io/badge/Rive-Animation-black?style=for-the-badge)

Welcome to the **Interactive Animated Login Screen**! This project transforms a standard, boring login form into an engaging and dynamic user experience. By integrating a reactive 2D character, the UI responds in real-time to the user's input, making the authentication process fun and highly interactive.

<p align="center">🐻 🐾 🐻 🐾 🐻 🐾 🐻 🐾 🐻</p>

## 🎓 Academic Context

* **Course:** Graficacion
* **Professor:** Rodrigo Fidel Gaxiola Sosa
* **Project Type:** Interactive UI / Animation Implementation

<p align="center">🐻 🐾 🐻 🐾 🐻 🐾 🐻 🐾 🐻</p>

## 🚀 Key Functionalities

This application is designed to showcase how UI elements can seamlessly communicate with complex animations. The core features include:

* 🕵️ **Real-Time Eye Tracking (Checking Mode):** When the user clicks on the "Email" text field, the bear mascot smoothly transitions into a state where it follows the cursor/typing action, visually confirming that the user is interacting with that specific field.
* 🙈 **Privacy Protection (Hands-Up Mode):** Security and fun combined! As soon as the user focuses on the "Password" text field, the application triggers a state change, causing the bear to cover its eyes to "protect" the user's password.
* 👁️ **Dynamic Password Visibility:** A functional toggle button allows the user to reveal or obscure their password. This works independently of the animation but complements the overall login logic.
* 🧠 **Smart Focus Management:** Utilizing Flutter's `FocusNode` API, the application listens to which text field is currently active and immediately sends the corresponding boolean signals (`true` or `false`) to the animation's controller.
* 🧹 **Resource Management:** Memory leaks are prevented by properly disposing of the `FocusNode` controllers when the screen is destroyed.

<p align="center">🐻 🐾 🐻 🐾 🐻 🐾 🐻 🐾 🐻</p>

## 🎨 What is Rive & What is a State Machine?

To understand how this magic happens, it is essential to know the core technologies driving the animation:

### What is Rive? 🐻
[Rive](https://rive.app/) is a cutting-edge platform for creating highly interactive animations. Unlike traditional formats like GIFs or MP4s that just play a fixed sequence of frames, Rive animations are rendered in real-time. This means they are incredibly lightweight, scale perfectly without losing quality, and, most importantly, can be manipulated via code at runtime. 

### What is a State Machine? ⚙️
A **State Machine** is essentially the "brain" of the animation. Instead of a single timeline, a State Machine contains multiple timelines (states) and rules (transitions) on how to move between them. 
In this project, the State Machine is named `Login Machine`. It listens for specific **SMI (State Machine Inputs)** from our Flutter code:

### 🎛️ State Machine Inputs (SMI)

| Input Name | Type | Action Triggered |
| :--- | :---: | :--- |
| `isChecking` | **Boolean** | 🕵️ Tracks typing and follows the cursor |
| `isHandsUp` | **Boolean** | 🙈 Covers eyes for password privacy |
| `trigSuccess` | **Trigger** | 🎉 Plays success animation (Ready for future implementation) |
| `trigFail` | **Trigger** | 😔 Plays error animation (Ready for future implementation) |


<p align="center">🐻 🐾 🐻 🐾 🐻 🐾 🐻 🐾 🐻</p>

## 💻 Technologies & Tools Used

* 🦋 **Flutter:** The open-source UI software development kit created by Google. Used to build the application's structure and layout.
* 🎯 **Dart:** The object-oriented programming language used to write the Flutter logic.
* 🎬 **Rive Flutter Package (`rive`):** The official runtime library used to load the `.riv` file, instantiate the `StateMachineController`, and pass inputs from the UI to the animation.

<p align="center">🐻 🐾 🐻 🐾 🐻 🐾 🐻 🐾 🐻</p>

## 📂 Project Structure

The project maintains a clean and straightforward architecture. Here are the main files located inside the `lib` directory:

> **lib/**
>  ┣ 📂 **screens/**
>  ┃ ┗ 📜 `login_screen.dart`   
>  ┗ 📜 `main.dart`

### 📝 File Deep-Dive
<details>
  <summary>🔍 <b>Click here for an in-depth explanation of the files</b></summary>
  <br>
  
1. **1. `lib/main.dart`**
   * This is the entry point of the application.
   * It initializes the `MaterialApp`, sets up the global `ThemeData` (using a deep purple seed color), and defines `LoginScreen` as the home widget.

2. **`lib/screens/login_screen.dart`**
   * The core of the project. It is a `StatefulWidget` that holds the entire UI layout.
   * **Animation Initialization:** Uses `RiveAnimation.asset` to load `animated_login_bear.riv` and binds the `StateMachineController` during the `onInit` callback.
   * **Input Binding:** Extracts the `SMI` inputs (`_isChecking`, `_isHandsUp`) from the artboard so they can be modified dynamically.
   * **Listeners:** Implements `FocusNode` listeners inside `initState()` to detect exactly when the user enters or leaves the email and password fields, automatically adjusting the bear's posture.

  
</details>

<p align="center">🐾 🐻 🐾 🐻 🐾 🐻 🐾</p>

## 🛠️ How to wake up the bear (Quick Start)

Want to run this project on your own machine? It's super easy!

1. Clone this repository:
   ```bash
   git clone https://github.com/AmarisCelis/login_with_rive_animacion_5sa_2026_1.git

<p align="center">🐻 🐾 🐻 🐾 🐻 🐾 🐻 🐾 🐻</p>

## 🎬 Live Demo

Below is a demonstration of the interactive login screen in action. Notice how the bear reacts instantly to the user's focus on different text fields!

![App Demo Example](demo.gif)

<p align="center">🐻 🐾 🐻 🐾 🐻 🐾 🐻 🐾 🐻</p>

## 🐾 Interactive UX Behaviors
The bear mascot isn't just a static image; it reacts to your journey through the login:
* **Focus Detection:** The bear "wakes up" and follows your typing when you enter the Email field.
* **Visual Privacy:** It protects your security by covering its eyes the moment you click on the Password field.
* **State Persistence:** The animation state is managed dynamically, ensuring smooth transitions.

## 🚀 Future Roadmap
Even though the core logic is ready, I plan to implement:
* **Success/Fail Triggers:** Connect the `trigSuccess` and `trigFail` inputs to actual backend validation.
* **Custom Backgrounds:** Add dynamic backgrounds that change based on the time of day.

## 💡 Project Insight
This project was born from the desire to make the authentication process less robotic. Using **Rive** allowed me to create a bridge between design and functionality without the heavy weight of traditional video files.

<p align="center">🐻 🐾 🐻 🐾 🐻 🐾 🐻 🐾 🐻</p>

## 🏆 Credits & Acknowledgments

La hermosa animación utilizada en este proyecto es un recurso de la **comunidad de Rive**.

* 🔗 **Original Animation Link:** [Remix of Login Machine REMIX]( https://rive.app/marketplace/3645-7621-remix-of-login-machine/)
* 🧑‍🎨 **Author:** [dexterc](https://rive.app/@dexterc/)

<p align="center">🐻 🐾 🐻 🐾 🐻 🐾 🐻 🐾 🐻</p>

## 👩‍💻 Developer

**Flutter Implementation & Code:** Developed by **Amaris Celis**

[![GitHub](https://img.shields.io/badge/GitHub-AmarisCelis-181717?style=flat-square&logo=github)](https://github.com/AmarisCelis)

<p align="center">🐻 🐾 🐻 🐾 🐻 🐾 🐻 🐾 🐻</p>