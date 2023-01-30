/*
  Warnings:

  - You are about to drop the `Day` table. If the table is not empty, all the data it contains will be lost.

*/
-- DropIndex
DROP INDEX "Day_date_key";

-- DropTable
PRAGMA foreign_keys=off;
DROP TABLE "Day";
PRAGMA foreign_keys=on;

-- CreateTable
CREATE TABLE "days" (
    "id" TEXT NOT NULL PRIMARY KEY,
    "date" DATETIME NOT NULL
);

-- RedefineTables
PRAGMA foreign_keys=OFF;
CREATE TABLE "new_DayHabit" (
    "id" TEXT NOT NULL PRIMARY KEY,
    "day_id" TEXT NOT NULL,
    "habit_id" TEXT NOT NULL,
    CONSTRAINT "DayHabit_day_id_fkey" FOREIGN KEY ("day_id") REFERENCES "days" ("id") ON DELETE RESTRICT ON UPDATE CASCADE,
    CONSTRAINT "DayHabit_habit_id_fkey" FOREIGN KEY ("habit_id") REFERENCES "habits" ("id") ON DELETE RESTRICT ON UPDATE CASCADE
);
INSERT INTO "new_DayHabit" ("day_id", "habit_id", "id") SELECT "day_id", "habit_id", "id" FROM "DayHabit";
DROP TABLE "DayHabit";
ALTER TABLE "new_DayHabit" RENAME TO "DayHabit";
CREATE UNIQUE INDEX "DayHabit_day_id_habit_id_key" ON "DayHabit"("day_id", "habit_id");
CREATE TABLE "new_habit_week_days" (
    "id" TEXT NOT NULL PRIMARY KEY,
    "habit_id" TEXT NOT NULL,
    "week_day" INTEGER NOT NULL,
    CONSTRAINT "habit_week_days_habit_id_fkey" FOREIGN KEY ("habit_id") REFERENCES "habits" ("id") ON DELETE RESTRICT ON UPDATE CASCADE
);
INSERT INTO "new_habit_week_days" ("habit_id", "id", "week_day") SELECT "habit_id", "id", "week_day" FROM "habit_week_days";
DROP TABLE "habit_week_days";
ALTER TABLE "new_habit_week_days" RENAME TO "habit_week_days";
CREATE UNIQUE INDEX "habit_week_days_habit_id_week_day_key" ON "habit_week_days"("habit_id", "week_day");
PRAGMA foreign_key_check;
PRAGMA foreign_keys=ON;

-- CreateIndex
CREATE UNIQUE INDEX "days_date_key" ON "days"("date");
