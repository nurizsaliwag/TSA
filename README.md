# BOOKBRIDGE FINAL PROJECT

## Project Description

BookBridge Final is an integrated Java library loan and reservation management system developed across TSA1 to TSA4. It preserves the original membership, loan-day, late-fee, availability, and status-transition rules while progressively improving the design from a console prototype into an object-oriented, collections-based, Swing/JDBC desktop application.

The final release supports catalog and member management, issuing and returning books, reservations and cancellation, searching, refreshing, reports, validation, persistence, parameterized SQL, background database work, and failure recovery.

## Java Compilation and Execution

The Java source files are compiled by `javac` into bytecode (`.class`) files. The JVM executes that bytecode. The JDK provides the compiler and development tools, while NetBeans manages the project, SQLite JDBC driver, database setup, build, run, and debugging.

## Prerequisites

- JDK 17 or newer
- NetBeans IDE
- SQLite JDBC driver JAR
- SQLite database browser or SQLite command-line tool

## Setup and Run

1. Open or create a NetBeans Java project named `BookBridge_Final`.
2. Use the TSA4 source in `milestone_evidence/BookBridge_TSA4/src` as the final source baseline.
3. Add the SQLite JDBC JAR to the project Libraries.
4. Execute `schema.sql` to create the database tables.
5. Set the main class to `com.mycompany.bookbridge.app.BookBridge`.
6. Run the project and test the Catalog, Members, Circulation, Reservations, and Reports tabs.

## Source Code and Evidence

The `milestone_evidence` folder contains TSA1, TSA2, TSA3, and TSA4 artifacts. The final documentation, test report, traceability matrix, architecture diagram, and reflection are in the project root.

## Troubleshooting

If the driver is missing, add the SQLite JDBC JAR to NetBeans Libraries. If the database is unavailable, confirm that `schema.sql` was executed and that the working directory is writable. Database failures are reported through the UI instead of being hidden.
