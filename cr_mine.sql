DROP TABLE IF EXISTS trials;
CREATE TABLE IF NOT EXISTS trials(patientid 	TEXT,
diagnosis	TEXT,
age REAL,
sex	TEXT,
handedness	TEXT,
clinic_date	DATE,
date	DATE,
cor REAL,
slope REAL,
intercept REAL,
num_of_all REAL,
num_of_feet REAL,
num_of_hands	REAL,
cor_feet REAL,
slope_feet REAL,intercept_feet REAL,	cor_hand REAL,	slope_hand	REAL,
intercept_hand	REAL, cor_after	REAL,slope_after REAL,	intercept_after	 REAL,
motor_lh REAL,	motor_rh REAL,	motor_lf REAL,	motor_rf REAL,	gait_stance REAL,
sensory_lf REAL,sensory_lh REAL,
sensory_rf REAL,sensory_rh REAL,vibrationfingers_l REAL,
vibrationfingers_r REAL,	vibrationknees_l	REAL,
vibrationknees_r REAL,
vibrationtoes_l REAL,vibrationtoes_r	REAL,vibrationwrists_l REAL,	vibrationwrists_rREAL );


.mode csv
.import mine_csv.csv data

