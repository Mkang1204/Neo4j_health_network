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
  
  
  
