# Hotel Reservation Management System (HRMS)

## Overview

The **Hotel Reservation Management System (HRMS)** is a MySQL-based database application designed to manage hotel operations, including customer reservations, room details, transactions, and staff roles. It provides a robust and scalable solution for hotel management, suitable for developers and businesses.

## Features

- **Customer Management**: Store customer details like name, contact info, and secure passwords.
- **Room Management**: Track room types, pricing, availability, and features (e.g., bed type, AC).
- **Reservation System**: Handle bookings with statuses (Confirmed, Cancelled, Pending) and dates.
- **Transaction Processing**: Record payments and refunds with multiple payment methods.
- **Staff Roles**: Manage admins and receptionists with defined relationships.
- **Hotel Management**: Store hotel details, including location, contact info, and star ratings.
- **Data Integrity**: Enforce constraints with foreign keys, unique keys, and checks.

## Database Schema

The `hrms` database includes the following tables:
- `admin`: Links admins to hotels.
- `customer`: Stores customer information with hashed passwords.
- `hotel`: Contains hotel details (name, location, star rating).
- `person`: Manages staff details and roles (Admin, Receptionist).
- `receptionist`: Associates receptionists with admins.
- `reservation`: Tracks bookings with room assignments.
- `room`: Defines rooms by hotel, building, and type.
- `roomfeatures`: Details room attributes (price, size, availability).
- `transaction`: Records financial transactions linked to reservations.

Uses `InnoDB` for transactional support and cascading deletes.

## Prerequisites

- **MySQL**: Version 5.7 or later.
- **MySQL Client**: MySQL Workbench, phpMyAdmin, or command-line `mysql`.
- **Optional**: Programming environment (e.g., Python, PHP) for application integration.

## Installation

1. **Clone the Repository**:
   ```bash
   git clone https://github.com/your-username/hrms.git
   cd hrms
   ```

2. **Create Database**:
   ```sql
   CREATE DATABASE hrms;
   ```

3. **Import SQL Script**:
   ```bash
   mysql -u your-username -p hrms < hrms.sql
   ```
   Or paste the contents of `hrms.sql` into your MySQL client.

4. **Verify Setup**:
   ```sql
   USE hrms;
   SHOW TABLES;
   SELECT * FROM hotel;
   ```

## Usage

Integrate the database with an application or query directly. Example queries:

- **List Available Rooms**:
  ```sql
  SELECT r.RoomNo, r.Building, rf.RoomName, rf.RoomPrice
  FROM room r
  JOIN roomfeatures rf ON r.RoomNo = rf.RoomNo AND r.Building = rf.Building
  WHERE rf.Availability = 'Available';
  ```

- **View Confirmed Reservations**:
  ```sql
  SELECT r.ReservationId, c.FirstName, c.LastName, h.HotelName, r.CheckInDate
  FROM reservation r
  JOIN customer c ON r.CustomerId = c.CustomerId
  JOIN room rm ON r.RoomNo = rm.RoomNo AND r.Building = rm.Building
  JOIN hotel h ON rm.HotelId = h.HotelId
  WHERE r.BookingStatus = 'Confirmed';
  ```

## Security Notes

- **Password Hashing**: Uses MD5 (consider bcrypt or Argon2 for production).
- **Data Validation**: Constraints ensure valid data (e.g., Gender, StarRating).
- **SQL Injection**: Use prepared statements in applications to prevent attacks.

## Contributing

1. Fork the repository.
2. Create a branch: `git checkout -b feature/your-feature`.
3. Commit changes: `git commit -m 'Add your feature'`.
4. Push: `git push origin feature/your-feature`.
5. Open a pull request with a clear description.

## License
This project is licensed under the MIT License. See the LICENSE file.

## Contact
For issues or suggestions, open a GitHub issue or contact [your-email@example.com].

![schema_diagram drawio](https://github.com/sahansharma/hrms_database_design/assets/105370268/8a8baa42-d247-4929-9d7f-059b1cf38d84)
![hrms_database drawio](https://github.com/sahansharma/hrms_database_design/assets/105370268/70068d86-e910-4ab7-ae17-e4c4db7b8e89)
