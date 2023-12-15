-- Exported from QuickDBD: https://www.quickdatabasediagrams.com/
-- Link to schema: https://app.quickdatabasediagrams.com/#/d/4DUfhn
-- NOTE! If you have used non-SQL datatypes in your design, you will have to change these here.


CREATE TABLE "TEAMS" (
    "id" SERIAL   NOT NULL,
    "name" text   NOT NULL,
    "city" text   NOT NULL,
    CONSTRAINT "pk_TEAMS" PRIMARY KEY (
        "id"
     )
);

CREATE TABLE "PLAYERS" (
    "id" SERIAL   NOT NULL,
    "name" text   NOT NULL,
    "height" int   NOT NULL,
    "rank" text   NOT NULL,
    "team_id" int   NOT NULL,
    CONSTRAINT "pk_PLAYERS" PRIMARY KEY (
        "id"
     )
);

CREATE TABLE "REFEREES" (
    "id" SERIAL   NOT NULL,
    "name" text   NOT NULL,
    CONSTRAINT "pk_REFEREES" PRIMARY KEY (
        "id"
     )
);

CREATE TABLE "SEASON" (
    "id" SERIAL   NOT NULL,
    "start_date" int   NOT NULL,
    "end_date" int   NOT NULL,
    CONSTRAINT "pk_SEASON" PRIMARY KEY (
        "id"
     )
);

CREATE TABLE "MATCHES" (
    "id" SERIAL   NOT NULL,
    "date" int   NOT NULL,
    "location" text   NOT NULL,
    "home_team_id" int   NOT NULL,
    "away_team_id" int   NOT NULL,
    "season_id" int   NOT NULL,
    "referee_id" int   NOT NULL,
    CONSTRAINT "pk_MATCHES" PRIMARY KEY (
        "id"
     )
);

CREATE TABLE "GOALS" (
    "id" SERIAL   NOT NULL,
    "player_id" int   NOT NULL,
    "match_id" int   NOT NULL,
    CONSTRAINT "pk_GOALS" PRIMARY KEY (
        "id"
     )
);

CREATE TABLE "RESULTS" (
    "id" SERIAL   NOT NULL,
    "team_id" int   NOT NULL,
    "match_id" int   NOT NULL,
    "result" text   NOT NULL,
    CONSTRAINT "pk_RESULTS" PRIMARY KEY (
        "id"
     )
);

ALTER TABLE "PLAYERS" ADD CONSTRAINT "fk_PLAYERS_team_id" FOREIGN KEY("team_id")
REFERENCES "TEAMS" ("id");

ALTER TABLE "MATCHES" ADD CONSTRAINT "fk_MATCHES_home_team_id" FOREIGN KEY("home_team_id")
REFERENCES "TEAMS" ("id");

ALTER TABLE "MATCHES" ADD CONSTRAINT "fk_MATCHES_away_team_id" FOREIGN KEY("away_team_id")
REFERENCES "TEAMS" ("id");

ALTER TABLE "MATCHES" ADD CONSTRAINT "fk_MATCHES_season_id" FOREIGN KEY("season_id")
REFERENCES "SEASON" ("id");

ALTER TABLE "MATCHES" ADD CONSTRAINT "fk_MATCHES_referee_id" FOREIGN KEY("referee_id")
REFERENCES "REFEREES" ("id");

ALTER TABLE "GOALS" ADD CONSTRAINT "fk_GOALS_player_id" FOREIGN KEY("player_id")
REFERENCES "TEAMS" ("id");

ALTER TABLE "GOALS" ADD CONSTRAINT "fk_GOALS_match_id" FOREIGN KEY("match_id")
REFERENCES "MATCHES" ("id");

ALTER TABLE "RESULTS" ADD CONSTRAINT "fk_RESULTS_team_id" FOREIGN KEY("team_id")
REFERENCES "TEAMS" ("id");

ALTER TABLE "RESULTS" ADD CONSTRAINT "fk_RESULTS_match_id" FOREIGN KEY("match_id")
REFERENCES "MATCHES" ("id");

