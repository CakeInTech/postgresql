-- Clinic Database Schema
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

CREATE TABLE invoice_items (
  id BIGSERIAL NOT NULL PRIMARY KEY,
  unit_price DECIMAL NOT NULL,
  quantity BIGSERIAL NOT NULL,
  total_price DECIMAL NOT NULL,
  invoices_id INT NULL REFERENCES invoices(id) ON DELETE CASCADE,
  treatment_id INT NULL REFERENCES treatment(id) ON DELETE CASCADE
);

CREATE TABLE treatments (
  id BIGSERIAL NOT NULL PRIMARY KEY, 
  type VARCHAR(40) NOT NULL,
  name VARCHAR(40) NOT NULL
);

CREATE TABLE medical_historeis_treatment ( 
 medical_history_id INT REFERENCES medical_historeis(id) ON DELETE CASCADE,
 treatment_id INT REFERENCES treatment(id) ON DELETE CASCADE
);

-- Index Clauses 
CREATE INDEX patient_id ON patients(id);
CREATE INDEX medical_history_id ON medical_historeis(id);
CREATE INDEX invoices_id ON invoices(id);
CREATE INDEX treatment_id ON treatment(id);
CREATE INDEX invoice_items ON invoices(id);
CREATE INDEX treatment_id ON treatment(id);