# BoardBase

[![Conventional Commits](https://github.com/christopher-dabrowski/BoardBase/actions/workflows/conventional-commits.yaml/badge.svg?branch=main)](https://github.com/christopher-dabrowski/BoardBase/actions/workflows/conventional-commits.yaml)

Projekt akademicki do nauki zaawansowanych systemów baz danych.
Projekt będzie skupiał się na implementacji bazy danych gier planszowych z funkcjami do zarządzania informacjami o konkretnych grach planszowych, ich wersjach, dodatkach oraz śledzeniu rozgrywek i recenzji graczy.

## Etap 1 - Projektowanie i implementacja bazy danych

Pierwszy etap projektu koncentruje się na zaprojektowaniu i wdrożeniu relacyjnej bazy danych zgodnie z najlepszymi praktykami. Obejmuje przygotowanie case study, wybór i konfigurację SZBD, stworzenie schematu bazy danych w 3NF z co najmniej 8 tabelami, wypełnienie danymi, konfigurację użytkowników oraz przygotowanie zapytań, perspektyw i indeksów. Kluczowe jest nie tylko stworzenie funkcjonalnej bazy, ale także jej dokładne udokumentowanie i uzasadnienie podjętych decyzji projektowych.

### 🎯 Wymagania krytyczne

- [x] **Case study** - krótki opis problematyki (~½ strony)
- [x] **SZBD** - wybrany, zainstalowany i skonfigurowany
- [ ] **Minimum 8 tabel** (nie-asocjacyjnych, nie-słownikowych)
- [ ] **Dane** - każda tabela zawiera min. 4 rekordy
- [ ] **Relacje** - zdefiniowane między tabelami
- [ ] **Min. 2 użytkowników** - z odpowiednimi uprawnieniami
- [ ] **Min. 2 perspektywy** - nietrywialne
- [ ] **Min. 2 indeksy** - z uzasadnieniem

### 📋 Case Study & Projekt

- [x] Napisać case study (~½ strony)
- [x] Stworzyć diagram ERD (może być odręczny, zdjęcie)
- [x] Opisać jakie dane będą przechowywane
- [x] Opisać użytkowników i ich potrzeby
- [x] Opisać usługi do udostępnienia
- [x] **Wgrać do ISOD** w rubryce "Case Study"

### 🗄️ System zarządzania bazą danych

- [x] Wybrać SZBD (SQL Server/PostgreSQL/MySQL/Oracle)
- [x] Zainstalować i skonfigurować (można Docker)
- [ ] Uzasadnić wybór w sprawozdaniu
- [x] Przedstawić efekty i konfigurację

### 🏗️ Struktura bazy danych (2.5 pkt)

- [ ] Zaprojektować schemat logiczny bazy danych
- [ ] Utworzyć bazę w 3NF
- [ ] Min. 8 tabel niezależnych (nie-asocjacyjnych, nie-słownikowych)
- [ ] Min. 1 schemat bazodanowy (jeśli SZBD pozwala)
- [ ] Tabele słownikowe i asocjacyjne (gdzie potrzeba)
- [ ] Określić odpowiednie typy danych
- [ ] Ustawić UNIQUE i NOT NULL gdzie potrzeba
- [ ] **Klucze główne** - wybrać i zaimplementować
- [ ] **Klucze obce** - utworzyć relacje
- [ ] **Klucze kompozytowe** - tam gdzie przydatne
- [ ] Umieścić czytelny schemat logiczny w sprawozdaniu
- [ ] Uzasadnić istotne decyzje (typy, klucze, ewentualne odejście od 3NF)

### 📊 Dane (0.5 pkt)

- [ ] Wypełnić wszystkie tabele danymi (min. 4 rekordy/tabela)
- [ ] Dane mają sens merytoryczny
- [ ] Można użyć generatorów danych syntetycznych

### 👥 Użytkownicy i uprawnienia

- [ ] Utworzyć min. 2 użytkowników
- [ ] Nadać odpowiednie uprawnienia
- [ ] Wykorzystać schematy bazodanowe (jeśli potrzeba)
- [ ] **Przetestować** dostęp użytkowników
- [ ] Udokumentować testy w sprawozdaniu

### 🔍 Zapytania SQL (2 pkt)

- [ ] Wykonać min. 2 zapytania SQL
- [ ] Zapytania nietrywialne (złożone)
- [ ] Min. 1 podzapytanie
- [ ] Udokumentować zapytania
- [ ] Zapytania spełniają funkcjonalności biznesowe

### 👁️ Perspektywy (Views) (1 pkt)

- [ ] Przygotować min. 2 perspektywy
- [ ] Perspektywy nietrywialne
- [ ] Informacje czytelne dla użytkownika
- [ ] Udostępnić właściwym użytkownikom
- [ ] Jeśli możliwe - dostęp tylko przez perspektywy dla niektórych użytkowników
- [ ] Wymienić i opisać pozostałe potrzebne perspektywy (jeśli nie zaimplementowano wszystkich)

### ⚡ Indeksy (2 pkt)

- [ ] Utworzyć min. 2 indeksy
- [ ] Wybrać odpowiedni typ indeksu dla każdej tabeli
- [ ] Uzasadnić wybór typu indeksu
- [ ] Uzasadnić wybór kolumn
- [ ] Indeksy kompozytowe (gdzie potrzebne)
- [ ] **Testy wydajności** - porównanie różnych typów indeksów
- [ ] Wgrać większą ilość danych syntetycznych (dla testów)
- [ ] Wyjaśnić różnice w działaniu (praktyczne przykłady)
- [ ] Porównać: indeks kompozytowy vs prosty vs dwa proste vs brak indeksów

### 📄 Sprawozdanie (1 pkt)

- [ ] Case study
- [ ] Uzasadnienie wyboru SZBD + konfiguracja
- [ ] Opis danych, użytkowników i usług
- [ ] Diagram ERD
- [ ] Schemat logiczny bazy danych (z typami, relacjami, kluczami)
- [ ] Uzasadnienie decyzji projektowych
- [ ] Dokumentacja zapytań SQL
- [ ] Dokumentacja perspektyw
- [ ] Dokumentacja i uzasadnienie indeksów
- [ ] Testy uprawnień użytkowników
- [ ] Testy wydajności indeksów
- [ ] Czytelna forma i struktura

### 🚀 Finalizacja

- [ ] Przegląd całości projektu
- [ ] Sprawdzenie wszystkich wymagań minimalnych
- [ ] Oddanie przed terminem (20.10.2025, 1:00)
