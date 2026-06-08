# Running Bob's Used Books in Docker

## Prerequisites
- Docker Desktop installed on macOS
- Docker Compose (included with Docker Desktop)

## Quick Start

1. **Build and start the containers:**
   ```bash
   docker-compose up --build
   ```

2. **Access the application:**
   - Open your browser to: http://localhost:5000

3. **Stop the containers:**
   ```bash
   docker-compose down
   ```

4. **Stop and remove all data:**
   ```bash
   docker-compose down -v
   ```

## What's Running

- **bookstore**: ASP.NET Core 8.0 web application on port 5000
- **sqlserver**: SQL Server 2022 Express on port 1433

## Default Credentials

- **SQL Server:**
  - User: `sa`
  - Password: `YourStrong@Passw0rd123`

## Notes

- First startup takes longer as the database initializes
- Data persists in a Docker volume named `sqldata`
- The app runs in Development mode with simulated authentication (no login required)
