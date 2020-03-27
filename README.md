# schoolboy3000

Instruction link: https://enappd.com/blog/setup-flutter-in-windows-and-mac/36/  
  
Stepid alustamiseks:
1. Tõmba Android studio, kõige uuem versioon.
2. installeeri flutteri ja darti sdk'd, veendu, et nende path oleks õige projekti seadistades. flutteril võid path'iks bin kausta panna.
flutter - https://flutter.dev/docs/get-started/install
dart - https://dart.dev/get-dart  
2.1. Peale flutteri installimist ja environment pathis selle lisamist tuleb teha projekti kaustas käsureal: flutter pub get (muidu ei leia Android SDK package:flutter/material.dart-i ülesse)  
3. Seadista endale Virtual Device(AVD Manager), näiteks Pixel 2, seejärel API 28.
4. Pane Virtual emulaator käima(AVD Manager), muidu ei tuvasta flutter device'i ja rakendus ei saagi joosta.
5. Zipi endale githubist see repo, paki lahti ja jooksuta.
6. Githubi lisades ärge asendage .git kausta!
7. Enjoy!  
  
Easy way to get thing running. 
1. Create New Flutter Project through Android SDK.  
2. Copy lib content to your created project along with .git folder correspondingly.  
3. Done.  
  
Rakenduse käivitamiseks telefonis näiteks käivita käsureal: flutter run