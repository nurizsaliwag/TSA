# Final Reflection

The most important redesign was changing the original parallel-array console prototype into a layered object-oriented application. In TSA2, each loan connects a real member and book object. In TSA3, the service owns typed collections and protects consistency. In TSA4, the service and DAO layers allow the Swing interface to remain focused on user interaction while the database handles persistence.

The most useful technical improvement was moving slow database work into `SwingWorker`. This keeps the Event Dispatch Thread responsive and prevents the window from appearing frozen during refreshes or reports. JDBC transactions also protect the relationship between a loan record and a book status.

One evidence-based future improvement is to add a dedicated reservation-queue processing screen and a report query for overdue loans. The current design already has the reservation and service concepts, so the improvement can be added without placing SQL inside the UI.

AI assistance was used for drafting and reviewing implementation ideas. The submitted code was checked against the assessment requirements, and the student must be able to explain, test, and modify every part during the defense.
