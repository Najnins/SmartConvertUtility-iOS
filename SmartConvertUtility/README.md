**SmartConvertUtility**

**All-in-One Conversion & Student Utility App built with SwiftUI.**

**Overview**

SmartConvertUtility is an iOS application designed to provide essential unit conversions and student productivity tools in one centralized platform.

Students and everyday users frequently need to convert temperature, weight, currency, or calculate GPA and BMI. Instead of switching between multiple apps, SmartConvertUtility combines these tools into a single clean and user-friendly mobile application.

**Features**
*Converter Tools*
Temperature Converter (Celsius, Fahrenheit, Kelvin)
Weight Converter (kg, pound, gram)
Length Converter (meter, km, mile, inch)
Volume Converter (liter, milliliter, ounce)
Speed Converter (km/h ↔ mph)
Data Storage Converter (KB, MB, GB, TB)
Currency Converter (API ready)
Student Tools
GPA Calculator
BMI Calculator
Study Timer (Pomodoro)
Time Zone Converter
**Additional Features**
Favorites for quick conversions
Conversion History
Clean SwiftUI interface
Modular MVVM architecture

**Architecture**

The application follows the MVVM (Model–View–ViewModel) architecture.

View (SwiftUI UI)
      ↓
ViewModel (Business Logic)
      ↓
Model (Data Structures)
      ↓
Services / Storage
Technologies Used

Swift

SwiftUI

MVVM Architecture

Combine Framework

Xcode

Project Structure
SmartConvertUtility
│
├── Models
├── ViewModels
├── Views
│   ├── Root
│   ├── Converter
│   ├── GPA
│   ├── BMI
│   ├── Timer
│   ├── TimeZone
│   └── Extra
│
├── Services
└── Resources
Screens

Launch Screen
Home Screen
Converter Screen
GPA Calculator
BMI Calculator
Study Timer
Time Zone Converter
Favorites
History

**Team Members**

Najnin Sultana
Arad Tahmasebifar
Shaheer Ansari
Niaj Hossain

**Future Improvements**

Currency API integration
CoreData persistent storage
Dark Mode customization
Cloud synchronization
Additional converters

**License**
This project is for educational purposes.
