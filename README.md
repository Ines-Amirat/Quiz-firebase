# Quiz Culture App — Flutter & Firebase

##  Description

**Quiz Culture App** est une application mobile développée avec **Flutter** et connectée à **Firebase**.  
Elle permet aux utilisateurs de s’inscrire, se connecter, répondre à un quiz scientifique et ajouter de nouvelles questions stockées dans **Cloud Firestore**.

Ce projet a été réalisé dans le cadre d’un **TP de Développement Mobile Avancé (Master 2 Génie Logiciel)**.

---

##  Fonctionnalités
- 🔐 Authentification (Login / Register / Logout)
- 🏠 Page d’accueil moderne avec avatar local
- ❓ Quiz dynamique basé sur Firestore
- ➕ Ajout de questions depuis l’application
- 📊 Calcul du score en temps réel
- 🔄 Gestion d’état avec **BLoC**
- ☁️ Backend Firebase (Authentication + Firestore)

---

## 🧱 Architecture du projet

```text
lib/
 ├─ presentation/
 │   └─ pages/
 │       ├─ login_page.dart
 │       ├─ register_page.dart
 │       ├─ home_page.dart
 │       ├─ quiz_page.dart
 │       └─ add_question_page.dart
 ├─ business_logic/
 │   └─ blocs/
 │       ├─ quiz_bloc.dart
 │       ├─ quiz_event.dart
 │       └─ quiz_state.dart
 └─ data/
     ├─ models/
     │   └─ question_model.dart
     └─ repositories/
         └─ quiz_repository.dart
```         


## Technologies utilisées
Flutter

Dart

Firebase Authentication

Cloud Firestore

flutter_bloc

Material Design


## Firebase – Structure Firestore
Collection : questions

json

{
  "theme": "science",
  "question": "Quel est le symbole chimique de l’eau ?",
  "answers": ["O2", "CO2", "H2O", "NaCl"],
  "correctIndex": 2
}


 
 ## Installation & Exécution
1️⃣ Cloner le projet
bash
Copier le code
git clone https://github.com/your-username/quiz_culture_app.git
cd quiz_culture_app
2️⃣ Installer les dépendances
bash
Copier le code
flutter pub get
3️⃣ Configurer Firebase
bash
Copier le code
firebase login
flutterfire configure
Cette commande génère automatiquement firebase_options.dart.

4️⃣ Lancer l’application
bash
Copier le code
flutter run
🧪 Test & Validation
Inscription et connexion fonctionnelles

Chargement dynamique des questions

Ajout de questions en temps réel

Score calculé correctement

## UML
Les diagrammes UML (classes et séquence) ont été réalisés avec PlantUML et intégrés au rapport sous forme de captures d’écran.

## Remarques
Firebase Storage n’a pas été utilisé.

Un avatar local est utilisé à des fins de démonstration.

Le projet respecte les objectifs pédagogiques du module.

