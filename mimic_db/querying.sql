-- Step 1
-- First start with retrieving ‘subject_id’, ‘hadm_id’, ‘icustay_id’, ‘intime’, and ‘outtime’ from the ‘icustays’ table.

-- Step 2
-- Using the patients table retrieve the calculated age of patients.

-- Step 3
-- Separate neonates from adult patients.

-- Step 4
-- By incorporating the admissions table, find how long each stay was BEFORE the patients were admitted to the ICU

-- Step 5
-- Next find the date of the patient’s death if applicable.

-- Step 6
-- Then find those deaths that occurred while the patients were in the hospital.

-- Step 7
-- Find how many of those deaths occurred within the ICU.



SELECT row_id, subject_id, hadm_id, admittime, dischtime, deathtime, admission_type, admission_location, discharge_location, insurance, language, religion, marital_status, ethnicity, edregtime, edouttime, diagnosis, hospital_expire_flag, has_chartevents_data
	FROM mimiciii.admissions;
SELECT row_id, subject_id, gender, dob, dod, dod_hosp, dod_ssn, expire_flag
	FROM mimiciii.patients;
SELECT row_id, subject_id, hadm_id, icustay_id, startdate, enddate, drug_type, drug, drug_name_poe, drug_name_generic, formulary_drug_cd, gsn, ndc, prod_strength, dose_val_rx, dose_unit_rx, form_val_disp, form_unit_disp, route
	FROM mimiciii.prescriptions;
SELECT row_id, subject_id, hadm_id, chartdate, charttime, spec_itemid, spec_type_desc, org_itemid, org_name, isolate_num, ab_itemid, ab_name, dilution_text, dilution_comparison, dilution_value, interpretation
	FROM mimiciii.microbiologyevents;
SELECT row_id, subject_id, hadm_id, itemid, charttime, value, valuenum, valueuom, flag
	FROM mimiciii.labevents;
  
  
  
