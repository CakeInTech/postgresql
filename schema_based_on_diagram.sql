CREATE TABLE medical_historeis (
  id BIGSERIAL NOT NULL PRIMARY KEY,
  admitted_at TIMESTAMP,
  patient_id INT NULL REFERENCES patients(id) ON DELETE CASCADE,
  status VARCHAR(40) NOT NULL
);

CREATE TABLE invoices (
  id BIGSERIAL NOT NULL PRIMARY KEY,
  total DECIMAL NOT NULL,
  generated_at TIMESTAMP,
  payed_at TIMESTAMP,
  medical_history_id INT NULL REFERENCES medical_historeis(id) ON DELETE CASCADE
);

CREATE TABLE patients (
  id BIGSERIAL NOT NULL PRIMARY KEY,
  name VARCHAR(100) NOT NULL,
  date_of_birth DATE NOT NULL 
);
