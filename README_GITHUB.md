# BookBridge TSA4

BookBridge TSA4 is a Java Swing library management application connected to MariaDB through JDBC.

## Features

- Catalog management
- Member registration
- Loan issuing and returning
- Reservation creation and cancellation
- Search and refresh operations
- MariaDB persistence
- Parameterized JDBC operations
- Background database work using SwingWorker

## Requirements

- JDK 17 or newer
- Apache NetBeans or Maven
- MariaDB Server

## Run

1. Run `schema.sql` in MariaDB.
2. Configure the database username and password through Java VM options.
3. Run the project with:

```text
mvn clean compile
mvn exec:java
```

Main class:

```text
com.mycompany.bookbridge.app.BookBridge
```

## Database Configuration

The default database URL is:

```text
jdbc:mariadb://localhost:3306/bookbridge
```

Optional VM options:

```text
-Dbookbridge.db.user=root -Dbookbridge.db.password=YOUR_PASSWORD
```

## Documentation

- `BookBridge_TSA4_Report.pdf` contains the project overview and TN01-TN10 test cases.
- `TSA4_Test_Report.md` contains the test summary.
- `architecture.md` contains the architecture and data-flow description.
