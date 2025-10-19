# BoardBase

[![Conventional Commits](https://github.com/christopher-dabrowski/BoardBase/actions/workflows/conventional-commits.yaml/badge.svg?branch=main)](https://github.com/christopher-dabrowski/BoardBase/actions/workflows/conventional-commits.yaml)

Projekt akademicki do nauki zaawansowanych systemów baz danych.
Projekt będzie skupiał się na implementacji bazy danych gier planszowych z funkcjami do zarządzania informacjami o konkretnych grach planszowych, ich wersjach, dodatkach oraz śledzeniu rozgrywek i recenzji graczy.

## Etap 1 - Projektowanie i implementacja bazy danych

Pierwszy etap projektu koncentruje się na zaprojektowaniu i wdrożeniu relacyjnej bazy danych zgodnie z najlepszymi praktykami. Obejmuje przygotowanie case study, wybór i konfigurację SZBD, stworzenie schematu bazy danych w 3NF z co najmniej 8 tabelami, wypełnienie danymi, konfigurację użytkowników oraz przygotowanie zapytań, perspektyw i indeksów. Kluczowe jest nie tylko stworzenie funkcjonalnej bazy, ale także jej dokładne udokumentowanie i uzasadnienie podjętych decyzji projektowych.

### 🎯 Wymagania krytyczne

- [x] **Case study** - krótki opis problematyki (~½ strony)
- [x] **SZBD** - wybrany, zainstalowany i skonfigurowany
- [x] **Minimum 8 tabel** (nie-asocjacyjnych, nie-słownikowych)
- [x] **Dane** - każda tabela zawiera min. 4 rekordy
- [x] **Relacje** - zdefiniowane między tabelami
- [x] **Min. 2 użytkowników** - z odpowiednimi uprawnieniami
- [x] **Min. 2 perspektywy** - nietrywialne
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
- [x] Uzasadnić wybór w sprawozdaniu
- [x] Przedstawić efekty i konfigurację

### 🏗️ Struktura bazy danych (2.5 pkt)

- [x] Zaprojektować schemat logiczny bazy danych
- [x] Utworzyć bazę w 3NF
- [x] Min. 8 tabel niezależnych (nie-asocjacyjnych, nie-słownikowych)
- [x] Min. 1 schemat bazodanowy (jeśli SZBD pozwala)
- [x] Tabele słownikowe i asocjacyjne (gdzie potrzeba)
- [x] Określić odpowiednie typy danych
- [x] Ustawić UNIQUE i NOT NULL gdzie potrzeba
- [x] **Klucze główne** - wybrać i zaimplementować
- [x] **Klucze obce** - utworzyć relacje
- [x] **Klucze kompozytowe** - tam gdzie przydatne
- [x] Umieścić czytelny schemat logiczny w sprawozdaniu
- [x] Uzasadnić istotne decyzje (typy, klucze, ewentualne odejście od 3NF)

### 📊 Dane (0.5 pkt)

- [x] Wypełnić wszystkie tabele danymi (min. 4 rekordy/tabela)
- [x] Dane mają sens merytoryczny

### 👥 Użytkownicy i uprawnienia

- [x] Utworzyć min. 2 użytkowników
- [x] Nadać odpowiednie uprawnienia
- [x] Wykorzystać schematy bazodanowe (jeśli potrzeba)
- [x] **Przetestować** dostęp użytkowników
- [x] Udokumentować testy w sprawozdaniu

### 🔍 Zapytania SQL (2 pkt)

- [x] Wykonać min. 2 zapytania SQL
- [x] Zapytania nietrywialne (złożone)
- [x] Min. 1 podzapytanie
- [x] Udokumentować zapytania
- [x] Zapytania spełniają funkcjonalności biznesowe

### 👁️ Perspektywy (Views) (1 pkt)

- [x] Przygotować min. 2 perspektywy
- [x] Perspektywy nietrywialne
- [x] Informacje czytelne dla użytkownika
- [x] Udostępnić właściwym użytkownikom
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

- [x] Case study
- [x] Uzasadnienie wyboru SZBD + konfiguracja
- [x] Opis danych, użytkowników i usług
- [x] Diagram ERD
- [x] Schemat logiczny bazy danych (z typami, relacjami, kluczami)
- [x] Uzasadnienie decyzji projektowych
- [x] Dokumentacja zapytań SQL
- [x] Dokumentacja perspektyw
- [x] Dokumentacja i uzasadnienie indeksów
- [x] Testy uprawnień użytkowników
- [x] Testy wydajności indeksów
- [x] Czytelna forma i struktura
