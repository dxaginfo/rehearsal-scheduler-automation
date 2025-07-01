CREATE TABLE users (
  id SERIAL PRIMARY KEY,
  name VARCHAR(100),
  email VARCHAR(100) UNIQUE NOT NULL,
  password_hash VARCHAR(200),
  role VARCHAR(20)
);

CREATE TABLE bands (
  id SERIAL PRIMARY KEY,
  name VARCHAR(100),
  owner_id INTEGER REFERENCES users(id)
);

CREATE TABLE band_members (
  id SERIAL PRIMARY KEY,
  band_id INTEGER REFERENCES bands(id),
  user_id INTEGER REFERENCES users(id)
);

CREATE TABLE rehearsals (
  id SERIAL PRIMARY KEY,
  band_id INTEGER REFERENCES bands(id),
  date DATE,
  time TIME,
  location VARCHAR(200),
  created_by INTEGER REFERENCES users(id)
);

CREATE TABLE attendance (
  id SERIAL PRIMARY KEY,
  rehearsal_id INTEGER REFERENCES rehearsals(id),
  user_id INTEGER REFERENCES users(id),
  status VARCHAR(20)
);

CREATE TABLE availability (
  id SERIAL PRIMARY KEY,
  user_id INTEGER REFERENCES users(id),
  day VARCHAR(12),
  start_time TIME,
  end_time TIME
);