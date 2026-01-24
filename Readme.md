# BoardBase

[![Conventional Commits](https://github.com/christopher-dabrowski/BoardBase/actions/workflows/conventional-commits.yaml/badge.svg?branch=main)](https://github.com/christopher-dabrowski/BoardBase/actions/workflows/conventional-commits.yaml)

![GitHub commit activity](https://img.shields.io/github/commit-activity/t/christopher-dabrowski/BoardBase?style=for-the-badge&color=red)

![Static Badge](https://img.shields.io/badge/PostgreSQL-18.0-%234169E1?style=for-the-badge&logo=postgresql&logoColor=%234A77FF&color=%234169E1)
![Static Badge](https://img.shields.io/badge/Microsoft%20SQL%20Server-2022-%230065b1?style=for-the-badge)
![Static Badge](https://img.shields.io/badge/MongoDB-8.2.2-%2347A248?style=for-the-badge&logo=mongodb)
![Static Badge](https://img.shields.io/badge/Neo4j-2025.11.2-%234581C3?style=for-the-badge&logo=neo4j&logoColor=%234581C3)

Projekt akademicki do nauki zaawansowanych systemów baz danych.
Pierwsze dwa etapy skupiają się na na implementacji relacyjnej bazy danych gier planszowych z funkcjami do zarządzania informacjami o konkretnych grach planszowych, ich wersjach, dodatkach oraz śledzeniu rozgrywek i recenzji graczy.
Etapy 3 i 4 bazują na bazach NoSQL.

🚀 Sprawozdania z danych etapów są automatycznie generowane w formacie PDF z plików [Quarto](https://quarto.org/) przez [GitHub Actions](https://github.com/christopher-dabrowski/BoardBase/actions) i publikowane na orphan branchach.

:whale: Zastosowane bazy danych można łatwo uruchomić korzystając z [`docker-compose.yml`](./docker-compose.yml).

## Etap 1 - Projektowanie i implementacja bazy danych

[![Publish Case Study PDF](https://github.com/christopher-dabrowski/BoardBase/actions/workflows/case-study-pdf.yaml/badge.svg?branch=main)](https://github.com/christopher-dabrowski/BoardBase/actions/workflows/case-study-pdf.yaml)
[![Publish Milestone 1 PDF](https://github.com/christopher-dabrowski/BoardBase/actions/workflows/milestone1-pdf.yaml/badge.svg?branch=main)](https://github.com/christopher-dabrowski/BoardBase/actions/workflows/milestone1-pdf.yaml)

![Static Badge](https://img.shields.io/badge/PostgreSQL-18.0-%234169E1?style=for-the-badge&logo=postgresql&logoColor=%234A77FF&color=%234169E1)

Pierwszy etap projektu koncentruje się na zaprojektowaniu i wdrożeniu relacyjnej bazy danych zgodnie z najlepszymi praktykami. Obejmuje przygotowanie case study, wybór i konfigurację SZBD, stworzenie schematu bazy danych w 3NF z co najmniej 8 tabelami, wypełnienie danymi, konfigurację użytkowników oraz przygotowanie zapytań, perspektyw i indeksów. Kluczowe jest nie tylko stworzenie funkcjonalnej bazy, ale także jej dokładne udokumentowanie i uzasadnienie podjętych decyzji projektowych.

Kod SQL do konfiguracji bazy oraz zapytań jest w katalogu [`sql`](./sql).

> [!TIP]
> Pomysł na bazę jest rozpisany w [Case Study](https://github.com/christopher-dabrowski/BoardBase/blob/publish/case-study/Etap%201%20Case%20Study%20Krzysztof%20D%C4%85browski%20293101.pdf).

> [!IMPORTANT]
> Wyrenderowane [Sprawozdanie z etapu 1](https://github.com/christopher-dabrowski/BoardBase/blob/publish/milestone1/Etap%201%20Sprawozdanie%20Krzysztof%20D%C4%85browski%20293101.pdf).

## Etap 2 - Elementy programowalne i migracja na inną bazę

[![Publish Milestone 2 PDF](https://github.com/christopher-dabrowski/BoardBase/actions/workflows/milestone2-pdf.yaml/badge.svg?branch=main)](https://github.com/christopher-dabrowski/BoardBase/actions/workflows/milestone2-pdf.yaml)

![Static Badge](https://img.shields.io/badge/PostgreSQL-18.0-%234169E1?style=for-the-badge&logo=postgresql&logoColor=%234A77FF&color=%234169E1)
![Static Badge](https://img.shields.io/badge/Microsoft%20SQL%20Server-2022-%230065b1?style=for-the-badge)

Rozwinięcie relacyjnej bazy danych z pierwszego etapu o elementy programowalne takie jak procedury składowane, wyzwalacze i funkcje użytkownika.
Migracja bazy danych z PostgreSQL do MS SQL Server i związane z tym kłopoty :bomb:.

Kod SQL do konfiguracji bazy oraz zapytań jest w katalogu [`sql`](./sql).

> [!IMPORTANT]
> Wyrenderowane [Sprawozdanie z etapu 2](https://github.com/christopher-dabrowski/BoardBase/blob/publish/milestone2/Etap%202%20Sprawozdanie%20Krzysztof%20D%C4%85browski%20293101.pdf).

## Etap 3 - MongoDB

[![Publish Milestone 3 PDF](https://github.com/christopher-dabrowski/BoardBase/actions/workflows/milestone3-pdf.yaml/badge.svg?branch=main)](https://github.com/christopher-dabrowski/BoardBase/actions/workflows/milestone3-pdf.yaml)

![Static Badge](https://img.shields.io/badge/MongoDB-8.2.2-%2347A248?style=for-the-badge&logo=mongodb)

Użycie bazy dokumentowej MongoDB do analizy danych o grze Magic: The Gathering na podstawie zbiorów z [MTGJSON](https://mtgjson.com/).
Piki związane z tym etapem są w katalogu [`mongo`](./mongo).

> [!IMPORTANT]
> Wyrenderowane [Sprawozdanie z etapu 3](https://github.com/christopher-dabrowski/BoardBase/blob/publish/milestone3/Etap%203%20Sprawozdanie%20Krzysztof%20D%C4%85browski%20293101.pdf).

## Etap 4 - Baza grafowa Neo4j

[![Publish Milestone 4 PDF](https://github.com/christopher-dabrowski/BoardBase/actions/workflows/milestone4-pdf.yaml/badge.svg?branch=main)](https://github.com/christopher-dabrowski/BoardBase/actions/workflows/milestone4-pdf.yaml)

![Static Badge](https://img.shields.io/badge/Neo4j-2025.11.2-%234581C3?style=for-the-badge&logo=neo4j&logoColor=%234581C3)

Zastosowanie bazy grafowej Neo4j do analizy danych o świecie Pieśni Lodu i Ognia (Gra o Tron).

> [!IMPORTANT]
> Wyrenderowane [Sprawozdanie z etapu 4](https://github.com/christopher-dabrowski/BoardBase/blob/publish/milestone4/Etap%204%20Sprawozdanie%20Krzysztof%20D%C4%85browski%20293101.pdf).
