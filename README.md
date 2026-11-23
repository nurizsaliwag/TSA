# BOOKBRIDGE TSA4

## Project Overview

BookBridge TSA4 transforms the previous console-based library management system into a desktop application using Java Swing, MariaDB, JDBC, and Maven. The application supports book registration, member registration, loan issuance, book returns, reservations, cancellations, searching, refreshing, and circulation reporting.

The system uses four relational MariaDB tables: `members`, `books`, `loans`, and `reservations`. `SwingWorker` performs database loading and reporting in the background so the graphical interface remains responsive.

## Graphical User Interface

The application contains five tabs: Catalog, Members, Circulation, Reservations, and Reports. Catalog manages book information, Members handles registration, Circulation processes loans and returns, Reservations manages reservation requests, and Reports displays library statistics.

## Database Structure and JDBC Connection

JDBC connects the Java application to MariaDB through the MariaDB JDBC driver. `PreparedStatement` is used for parameterized SQL queries, while try-with-resources closes connections, statements, and result sets automatically. Database credentials are supplied through Java system properties rather than being required in the source code.

## Application Architecture and Event Flow

The project separates the Swing interface, service/domain logic, DAO layer, and database. Issue Loan follows: Swing controls -> service validation -> `JdbcLibraryDao` -> parameterized transaction -> committed database changes -> JTable refresh. Return Book follows the same structure and updates the loan and book state together.

## Build and Execution

Prerequisites: JDK 17+, Apache NetBeans or Maven, MariaDB Server, and the MariaDB JDBC driver. Execute `schema.sql` in MariaDB, then run:

```text
mvn clean compile
mvn exec:java
```

Optional connection properties:

```text
-Dbookbridge.db.url=jdbc:mariadb://localhost:3306/bookbridge
-Dbookbridge.db.user=bookbridge_user
-Dbookbridge.db.password=your_password
```

The main class is `com.mycompany.bookbridge.app.BookBridge`.
