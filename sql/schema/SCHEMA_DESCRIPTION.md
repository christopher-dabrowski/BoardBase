# BoardBase Database Schema Description

## Overview

This is a PostgreSQL database for managing board games, including information about games, categories, mechanics, ratings, reviews, collections, and game session logs.

**Schema:** `main`
**Database:** `boardbase`

---

## Custom Types

### want_level_enum

Enumerated type for wishlist priority levels:

- `MUST_HAVE` - Highest priority
- `WANT_TO_PLAY` - High priority
- `NICE_TO_HAVE` - Medium priority
- `SOMEDAY` - Low priority

---

## Tables

### 1. category (Dictionary Table)

Board game categories (e.g., Strategy, Party, Family).

**Columns:**

- `category_id` INTEGER (PK, IDENTITY) - Unique category identifier
- `name` VARCHAR(50) NOT NULL UNIQUE - Category name (e.g., "Strategy", "Cooperative")
- `description` VARCHAR(500) - Detailed category description

**Constraints:**

- Name cannot be empty (trimmed)
- Name must be unique

**Sample categories:** Strategy, Party, Cooperative, Family, Economic, Adventure, Horror, Abstract

---

### 2. mechanic (Dictionary Table)

Game mechanics/mechanisms (e.g., Deck Building, Worker Placement).

**Columns:**

- `mechanic_id` INTEGER (PK, IDENTITY) - Unique mechanic identifier
- `name` VARCHAR(60) NOT NULL UNIQUE - Mechanic name (e.g., "Worker Placement")
- `description` VARCHAR(500) - Detailed mechanic description

**Constraints:**

- Name cannot be empty (trimmed)
- Name must be unique

**Sample mechanics:** Deck Building, Worker Placement, Area Control, Tile Placement, Dice Rolling, Set Collection, Resource Management, Hand Management

---

### 3. publisher (Dictionary Table)

Board game publishers.

**Columns:**

- `publisher_id` INTEGER (PK, IDENTITY) - Unique publisher identifier
- `name` VARCHAR(100) NOT NULL - Publisher name
- `website_url` VARCHAR(100) - Publisher website (must start with http:// or https://)
- `description` VARCHAR(1000) - Publisher description

**Constraints:**

- Name cannot be empty (trimmed)
- Website URL must match pattern: `^https?://.+`

**Sample publishers:** Stonemaier Games, Days of Wonder, Czech Games Edition, Fantasy Flight Games, KOSMOS

---

### 4. board_game (Core Table)

General information about board games (game-agnostic, not tied to specific releases).

**Columns:**

- `board_game_id` INTEGER (PK, IDENTITY) - Unique game identifier
- `name` VARCHAR(100) NOT NULL - Game name
- `description` VARCHAR(1000) - Game description
- `designer` VARCHAR(50) - Game designer name(s)
- `declared_minimal_player_count` INTEGER - Minimum players (nullable)
- `declared_maximum_player_count` INTEGER - Maximum players (nullable)
- `declared_minimal_age` INTEGER - Minimum age recommendation (nullable)

**Constraints:**

- Name cannot be empty (trimmed)
- Min players ≤ Max players (when both provided)
- Min players > 0 (when provided)
- Minimal age: 0-99 (when provided)

**Sample games:** Wingspan, Ticket to Ride, Catan, Pandemic, Azul, 7 Wonders, Carcassonne, Splendor

---

### 5. app_user (Core Table)

Application users who can rate, review, and log game sessions.

**Columns:**

- `user_id` INTEGER (PK, IDENTITY) - Unique user identifier
- `username` VARCHAR(30) NOT NULL UNIQUE - Username
- `email` VARCHAR(100) NOT NULL UNIQUE - Email address
- `password_hash` BYTEA NOT NULL - Password hash (binary)
- `is_admin` BOOLEAN DEFAULT FALSE NOT NULL - Admin flag

**Constraints:**

- Username cannot be empty (trimmed)
- Username must be unique
- Email must be unique
- Email must match format: `^[A-Za-z0-9._%+-]+@[A-Za-z0-9.-]+\.[A-Za-z]{2,}$`

**Sample usernames:** board_gamer_42, game_master_89, dice_roller_21, strategy_king, casual_player

---

### 6. award (Dictionary Table)

Awards that board games can receive (e.g., Spiel des Jahres).

**Columns:**

- `award_id` INTEGER (PK, IDENTITY) - Unique award identifier
- `name` VARCHAR(150) NOT NULL - Award name
- `awarding_body` VARCHAR(100) NOT NULL - Organization giving the award
- `description` VARCHAR(1000) - Award description
- `awarded_date` DATE - When the award was given
- `category` VARCHAR(80) - Award category (e.g., "Game of the Year", "Family Game")

**Constraints:**

- Name cannot be empty (trimmed)

**Sample awards:** Spiel des Jahres, Kennerspiel des Jahres, Golden Geek Award, As d'Or, Mensa Select

---

### 7. location (Related Table)

Physical locations where games can be played.

**Columns:**

- `location_id` INTEGER (PK, IDENTITY) - Unique location identifier
- `name` VARCHAR(100) NOT NULL - Location name
- `address` VARCHAR(200) - Physical address
- `description` VARCHAR(500) - Location description
- `owner_user_id` INTEGER NOT NULL (FK → app_user) - User who created/owns this location

**Constraints:**

- Name cannot be empty (trimmed)
- Must have an owner user
- Cascade delete when owner user is deleted

**Sample locations:** Home - Living Room, Board Game Cafe "Dice Tower", John's Game Den, Community Center Hall, Game Store Back Room

---

### 8. game_release (Related Table)

Specific releases/editions of board games (language-specific, publisher-specific).

**Columns:**

- `game_release_id` INTEGER (PK, IDENTITY) - Unique release identifier
- `board_game_id` INTEGER NOT NULL (FK → board_game) - Related game
- `publisher_id` INTEGER NOT NULL (FK → publisher) - Publisher of this release
- `release_date` DATE - When this release came out
- `language` VARCHAR(30) NOT NULL - Language of this release

**Constraints:**

- Language cannot be empty (trimmed)
- Cascade delete when board game is deleted
- Restrict delete when publisher is deleted (can't delete publisher if releases exist)

**Sample languages:** English, Polish, German, French, Spanish, Italian, Japanese

---

### 9. price (Related Table)

Historical pricing information for game releases.

**Columns:**

- `price_id` INTEGER (PK, IDENTITY) - Unique price record identifier
- `game_release_id` INTEGER NOT NULL (FK → game_release) - Related game release
- `amount` NUMERIC(10, 2) NOT NULL - Price amount (2 decimal places)
- `currency` CHAR(3) NOT NULL - Currency code (ISO 4217, e.g., "USD", "PLN")
- `start_date` DATE NOT NULL DEFAULT CURRENT_DATE - When this price started
- `end_date` DATE - When this price ended (NULL if current price)

**Constraints:**

- Amount ≥ 0
- Currency must be 3 uppercase letters
- Start date ≤ End date (when end_date provided)
- Cascade delete when game release is deleted

**Sample currencies:** USD, EUR, PLN, GBP, JPY, CAD

---

### 10. rating (Related Table)

User ratings for board games (one rating per user per game).

**Columns:**

- `rating_id` INTEGER (PK, IDENTITY) - Unique rating identifier
- `board_game_id` INTEGER NOT NULL (FK → board_game) - Rated game
- `user_id` INTEGER NOT NULL (FK → app_user) - User who rated
- `enjoyment` INTEGER NOT NULL - Overall enjoyment (1-10 scale)
- `minimal_player_count` INTEGER - User's suggested min players
- `maximum_player_count` INTEGER - User's suggested max players
- `best_player_count` INTEGER - User's suggested best player count
- `minimal_age` INTEGER - User's suggested minimum age
- `complexity` INTEGER - Perceived complexity (1-5 scale, 5 = most complex)
- `rated_at` TIMESTAMP DEFAULT CURRENT_TIMESTAMP NOT NULL - When rating was created

**Constraints:**

- Enjoyment: 1-10
- Complexity: 1-5 (when provided)
- Min players ≤ Max players (when both provided)
- Min players > 0 (when provided)
- Best players > 0 (when provided)
- Max players > 0 (when provided)
- Minimal age: 0-99 (when provided)
- UNIQUE constraint on (user_id, board_game_id) - one rating per user per game
- Cascade delete when game is deleted
- Set NULL when user is deleted

---

### 11. review (Related Table)

User-written reviews for board games.

**Columns:**

- `review_id` INTEGER (PK, IDENTITY) - Unique review identifier
- `board_game_id` INTEGER NOT NULL (FK → board_game) - Reviewed game
- `user_id` INTEGER NOT NULL (FK → app_user) - User who wrote review
- `review_text` VARCHAR(5000) NOT NULL - Review content
- `hours_spent_playing` INTEGER - Total hours user spent playing this game
- `reviewed_at` TIMESTAMP DEFAULT CURRENT_TIMESTAMP NOT NULL - When review was created

**Constraints:**

- Review text cannot be empty (trimmed)
- Hours spent ≥ 0 (when provided)
- Cascade delete when game or user is deleted

---

### 12. play (Related Table)

Log of game sessions (play history).

**Columns:**

- `play_id` INTEGER (PK, IDENTITY) - Unique play session identifier
- `board_game_id` INTEGER NOT NULL (FK → board_game) - Game that was played
- `location_id` INTEGER (FK → location) - Where the game was played
- `winner_user_id` INTEGER (FK → app_user) - Winner of this session
- `play_date` DATE NOT NULL DEFAULT CURRENT_DATE - When the game was played
- `player_count` INTEGER - How many players participated
- `duration_in_minutes` INTEGER - Session duration
- `note` VARCHAR(1000) - Additional notes about the session

**Constraints:**

- Player count > 0 (when provided)
- Duration > 0 (when provided)
- Cascade delete when game is deleted
- Set NULL when location or winner is deleted

---

### 13. game_wish (Related Table)

User wishlist for board games they want to acquire.

**Columns:**

- `game_wish_id` INTEGER (PK, IDENTITY) - Unique wish identifier
- `board_game_id` INTEGER NOT NULL (FK → board_game) - Desired game
- `user_id` INTEGER NOT NULL (FK → app_user) - User who wants the game
- `note` VARCHAR(500) - Notes about why they want it, where to buy, etc.
- `want_level` want_level_enum NOT NULL - Priority level
- `wished_at` TIMESTAMP DEFAULT CURRENT_TIMESTAMP NOT NULL - When added to wishlist

**Constraints:**

- UNIQUE constraint on (user_id, board_game_id) - one wish per user per game
- Cascade delete when game or user is deleted

---

### 14. board_game_category (Association Table)

Many-to-many relationship: Board games can belong to multiple categories.

**Columns:**

- `board_game_id` INTEGER NOT NULL (FK → board_game, PK)
- `category_id` INTEGER NOT NULL (FK → category, PK)

**Constraints:**

- Composite primary key (board_game_id, category_id)
- Cascade delete when game or category is deleted

---

### 15. board_game_mechanic (Association Table)

Many-to-many relationship: Board games can use multiple mechanics.

**Columns:**

- `board_game_id` INTEGER NOT NULL (FK → board_game, PK)
- `mechanic_id` INTEGER NOT NULL (FK → mechanic, PK)

**Constraints:**

- Composite primary key (board_game_id, mechanic_id)
- Cascade delete when game or mechanic is deleted

---

### 16. user_game_release (Association Table)

Many-to-many relationship: Users can own multiple game releases (their collection).

**Columns:**

- `user_id` INTEGER NOT NULL (FK → app_user, PK)
- `game_release_id` INTEGER NOT NULL (FK → game_release, PK)
- `acquired_at` TIMESTAMP DEFAULT CURRENT_TIMESTAMP NOT NULL - When user acquired the game

**Constraints:**

- Composite primary key (user_id, game_release_id)
- Cascade delete when user or game release is deleted

---

### 17. play_participant (Association Table)

Many-to-many relationship: Track which users participated in play sessions.

**Columns:**

- `play_id` INTEGER NOT NULL (FK → play, PK)
- `user_id` INTEGER NOT NULL (FK → app_user, PK)

**Constraints:**

- Composite primary key (play_id, user_id)
- Cascade delete when play or user is deleted

---

### 18. award_board_game (Association Table)

Many-to-many relationship: Awards can be given to multiple games, games can receive multiple awards.

**Columns:**

- `award_id` INTEGER NOT NULL (FK → award, PK)
- `board_game_id` INTEGER NOT NULL (FK → board_game, PK)
- `received_place` INTEGER - Placement in award (1 for winner, 2 for runner-up, etc.)

**Constraints:**

- Composite primary key (award_id, board_game_id)
- Place > 0 (when provided)
- Cascade delete when award or game is deleted

---

## Relationships Summary

### One-to-Many Relationships

- `app_user` → `location` (user owns locations)
- `app_user` → `rating` (user creates ratings)
- `app_user` → `review` (user writes reviews)
- `app_user` → `game_wish` (user creates wishes)
- `app_user` → `play` (user can be winner)
- `board_game` → `game_release` (game has multiple releases)
- `board_game` → `rating` (game has multiple ratings)
- `board_game` → `review` (game has multiple reviews)
- `board_game` → `play` (game has multiple play sessions)
- `board_game` → `game_wish` (game appears in multiple wishlists)
- `publisher` → `game_release` (publisher releases multiple games)
- `game_release` → `price` (release has multiple prices over time)
- `location` → `play` (location hosts multiple play sessions)
- `play` → `play_participant` (play has multiple participants)

### Many-to-Many Relationships

- `board_game` ↔ `category` (via `board_game_category`)
- `board_game` ↔ `mechanic` (via `board_game_mechanic`)
- `board_game` ↔ `award` (via `award_board_game`)
- `app_user` ↔ `game_release` (via `user_game_release` - user's collection)
- `app_user` ↔ `play` (via `play_participant`)

---

## Data Generation Guidelines

### Realistic Data Characteristics

1. **Users (app_user):**

   - Use realistic usernames (e.g., boardgame_enthusiast, dice_lord_99)
   - Create valid email addresses
   - Most users should have `is_admin = FALSE`, only 1-2 admins
   - Use realistic password hashes (can be dummy bcrypt hashes for testing)

2. **Board Games (board_game):**

   - Use real or realistic board game names
   - Typical player counts: 2-6 players
   - Typical ages: 6-18 years
   - Include well-known games like Catan, Ticket to Ride, Pandemic, Wingspan, etc.

3. **Categories & Mechanics:**

   - Use standard board game categories (Strategy, Party, Family, Cooperative, Abstract, etc.)
   - Use standard mechanics (Worker Placement, Deck Building, Dice Rolling, Tile Placement, etc.)

4. **Publishers:**

   - Use real publisher names (Stonemaier Games, Days of Wonder, KOSMOS, etc.)
   - Include realistic website URLs

5. **Game Releases:**

   - Same game can have multiple releases (different publishers, languages, years)
   - Common languages: English, Polish, German, French, Spanish
   - Release dates typically range from 1995 to 2025

6. **Prices:**

   - Board game prices typically range from $15 to $150
   - Use appropriate currencies (USD, EUR, PLN, GBP)
   - Current prices should have `end_date = NULL`

7. **Ratings:**

   - Enjoyment scores should cluster around 6-8 for good games
   - Complexity typically 1-4 (5 is rare, very complex)
   - Users might suggest different player counts than declared

8. **Reviews:**

   - Reviews should be 100-500 words typically
   - Hours spent playing: 5-200 hours for enthusiasts
   - Include both positive and critical reviews

9. **Plays:**

   - Duration typically 30-180 minutes
   - Player count should match game's player range
   - Not all plays need a winner (cooperative games)

10. **Wishlists:**
    - Mix of want levels (more WANT_TO_PLAY and NICE_TO_HAVE than MUST_HAVE)
    - Notes might include edition preferences, price targets

### Data Consistency Rules

1. Each board game should belong to 1-4 categories
2. Each board game should use 2-6 mechanics
3. Most games should have at least one release
4. Users should own 3-15 games in their collection
5. Active users should have 5-30 play sessions logged
6. Popular games should have 10-50 ratings
7. Not every user rates or reviews every game they own
8. Play participants should include the winner (if winner exists)
9. Play locations should be owned by participating users
10. Award-winning games should be well-rated (7+ enjoyment)

### Referential Integrity

Always maintain FK relationships:

- Create parent records before children
- Ensure FKs reference existing records
- Respect ON DELETE behaviors (CASCADE, SET NULL, RESTRICT)

### Temporal Consistency

- `acquired_at` should be after `release_date`
- `rated_at`, `reviewed_at` should be after user registration
- `play_date` should be after game release
- `end_date` should be after `start_date` for prices

---

## Insert Order (for data generation)

To maintain referential integrity, insert data in this order:

1. **Dictionary tables (no dependencies):**

   - `category`
   - `mechanic`
   - `publisher`
   - `award`

2. **Core independent tables:**

   - `app_user`
   - `board_game`

3. **First-level dependent tables:**

   - `location` (depends on app_user)
   - `game_release` (depends on board_game, publisher)

4. **Second-level dependent tables:**

   - `price` (depends on game_release)
   - `rating` (depends on board_game, app_user)
   - `review` (depends on board_game, app_user)
   - `play` (depends on board_game, location, app_user)
   - `game_wish` (depends on board_game, app_user)

5. **Association tables:**
   - `board_game_category` (depends on board_game, category)
   - `board_game_mechanic` (depends on board_game, mechanic)
   - `user_game_release` (depends on app_user, game_release)
   - `play_participant` (depends on play, app_user)
   - `award_board_game` (depends on award, board_game)

---

## Minimum Data Requirements (Stage 1)

According to project requirements, you need at least **4 rows per table**. Recommendations:

- 6-8 categories
- 8-10 mechanics
- 4-6 publishers
- 10-15 board games
- 8-12 users (2 admins, rest regular)
- 4-6 awards
- 6-10 locations
- 15-25 game releases
- 20-40 prices
- 30-60 ratings
- 15-30 reviews
- 20-40 plays
- 10-20 game wishes
- 25-45 board_game_category entries
- 30-60 board_game_mechanic entries
- 25-50 user_game_release entries
- 40-80 play_participant entries
- 8-15 award_board_game entries

This ensures rich, interconnected data for testing queries, views, and indexes.
