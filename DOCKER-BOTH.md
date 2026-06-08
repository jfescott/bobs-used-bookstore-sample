# Running Both SQL Server and PostgreSQL Versions

## Running Both Versions Simultaneously

### SQL Server Version (MAM303 branch)
**Port:** http://localhost:5000

1. Switch to MAM303 branch:
   ```bash
   git checkout MAM303
   ```

2. Start SQL Server version:
   ```bash
   docker-compose up --build
   ```

### PostgreSQL Version (converted branch)
**Port:** http://localhost:5100

1. In a new terminal, switch to converted branch:
   ```bash
   git checkout converted
   ```

2. Start PostgreSQL version:
   ```bash
   docker-compose -f docker-compose.postgres.yml up --build
   ```

## Access the Applications

- **SQL Server version:** http://localhost:5000
- **PostgreSQL version:** http://localhost:5100

## Stop Both Versions

```bash
# Stop SQL Server version
docker-compose down

# Stop PostgreSQL version
docker-compose -f docker-compose.postgres.yml down
```

## Database Ports

- **SQL Server:** localhost:1433
- **PostgreSQL:** localhost:5432

You can connect to either database using your preferred database client.
