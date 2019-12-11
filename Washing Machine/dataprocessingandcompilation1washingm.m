%% Data Processing and Compilation 1 - Washing Machine
% Alex Healion - C15399731
                                        %#ok<*SAGROW,*ASGLU,*NASGU,*NBRAK>
%% Kettle_1
[kettle_25cm_1,fs] = audioread('kettle_25cm_1.mp3');        % Read in audio
k25_1_sig = kettle_25cm_1;
clear kettle_25cm_1;                                        % Clear unwanted variable
k25_1_sig = standardize(k25_1_sig);                         % Standardize signal

[k25_1_cent,k25_1_benergy,k25_1_flux,k25_1_rollofffreq] = lowlevelfeatures(k25_1_sig,fs);       % Get low level features
k25_1_MFCCoeffs = mymfcc(k25_1_sig,fs);                                                         % Get MFCC features
                                                            % Same for other imports

%% Kettle_2
[kettle_25cm_2,fs] = audioread('kettle_25cm_2.mp3');
k25_2_sig = kettle_25cm_2;
clear kettle_25cm_2;
k25_2_sig = standardize(k25_2_sig);

[k25_2_cent,k25_2_benergy,k25_2_flux,k25_2_rollofffreq] = lowlevelfeatures(k25_2_sig,fs);
k25_2_MFCCoeffs = mymfcc(k25_2_sig,fs);

%% Kettle_3
[kettle_25cm_3,fs] = audioread('kettle_25cm_3.mp3');
k25_3_sig = kettle_25cm_3;
clear kettle_25cm_3;
k25_3_sig = standardize(k25_3_sig);

[k25_3_cent,k25_3_benergy,k25_3_flux,k25_3_rollofffreq] = lowlevelfeatures(k25_3_sig,fs);
k25_3_MFCCoeffs = mymfcc(k25_3_sig,fs);

%% Kettle_4
[kettle_25cm_4,fs] = audioread('kettle_25cm_4.mp3');
k25_4_sig = kettle_25cm_4;
clear kettle_25cm_4;
k25_4_sig = standardize(k25_4_sig);

[k25_4_cent,k25_4_benergy,k25_4_flux,k25_4_rollofffreq] = lowlevelfeatures(k25_4_sig,fs);
k25_4_MFCCoeffs = mymfcc(k25_4_sig,fs);

%% Kettle_5
[kettle_25cm_5,fs] = audioread('kettle_25cm_5.mp3');
k25_5_sig = kettle_25cm_5;
clear kettle_25cm_5;
k25_5_sig = standardize(k25_5_sig);

[k25_5_cent,k25_5_benergy,k25_5_flux,k25_5_rollofffreq] = lowlevelfeatures(k25_5_sig,fs);
k25_5_MFCCoeffs = mymfcc(k25_5_sig,fs);

%% Kettle_6
[kettle_25cm_6,fs] = audioread('kettle_25cm_6.mp3');
k25_6_sig = kettle_25cm_6;
clear kettle_25cm_6;
k25_6_sig = standardize(k25_6_sig);

[k25_6_cent,k25_6_benergy,k25_6_flux,k25_6_rollofffreq] = lowlevelfeatures(k25_6_sig,fs);
k25_6_MFCCoeffs = mymfcc(k25_6_sig,fs);

%% Kettle_7 (Phone)
[phone_kettle1,phonefs] = audioread('phone_kettle1.wav');
pk_7_sig = resample(phone_kettle1,fs,phonefs);              % Resample from 48kHz to 44.1 kHz
clear phone_kettle1;
pk_7_sig = mean(pk_7_sig,2);                                % Stereo to mono
pk_7_sig = standardize(pk_7_sig);

[pk_7_cent,pk_7_benergy,pk_7_flux,pk_7_rollofffreq] = lowlevelfeatures(pk_7_sig,fs);
pk_7_MFCCoeffs = mymfcc(pk_7_sig,fs);

%% Kettle_8 (Phone)
[phone_kettle2,phonefs] = audioread('phone_kettle2.wav');
pk_8_sig = resample(phone_kettle2,fs,phonefs);
clear phone_kettle2;
pk_8_sig = mean(pk_8_sig,2);
pk_8_sig = standardize(pk_8_sig);

[pk_8_cent,pk_8_benergy,pk_8_flux,pk_8_rollofffreq] = lowlevelfeatures(pk_8_sig,fs);
pk_8_MFCCoeffs = mymfcc(pk_8_sig,fs);

%% Kettle_9 (Phone)
[phone_kettle3,phonefs] = audioread('phone_kettle3.wav');
pk_9_sig = resample(phone_kettle3,fs,phonefs);
clear phone_kettle3;
pk_9_sig = mean(pk_9_sig,2);
pk_9_sig = standardize(pk_9_sig);

[pk_9_cent,pk_9_benergy,pk_9_flux,pk_9_rollofffreq] = lowlevelfeatures(pk_9_sig,fs);
pk_9_MFCCoeffs = mymfcc(pk_9_sig,fs);

%% Kettle_10 (Phone)
[phone_kettle4,phonefs] = audioread('phone_kettle4.wav');
pk_10_sig = resample(phone_kettle4,fs,phonefs);
clear phone_kettle4;
pk_10_sig = mean(pk_10_sig,2);
pk_10_sig = standardize(pk_10_sig);

[pk_10_cent,pk_10_benergy,pk_10_flux,pk_10_rollofffreq] = lowlevelfeatures(pk_10_sig,fs);
pk_10_MFCCoeffs = mymfcc(pk_10_sig,fs);

%% Kettle_11 (Phone)
[phone_kettle5,phonefs] = audioread('phone_kettle5.wav');
pk_11_sig = resample(phone_kettle5,fs,phonefs);
clear phone_kettle5;
pk_11_sig = mean(pk_11_sig,2);
pk_11_sig = standardize(pk_11_sig);

[pk_11_cent,pk_11_benergy,pk_11_flux,pk_11_rollofffreq] = lowlevelfeatures(pk_11_sig,fs);
pk_11_MFCCoeffs = mymfcc(pk_11_sig,fs);

%% Kettle_12 (Phone)
[phone_kettle6,phonefs] = audioread('phone_kettle6.wav');
pk_12_sig = resample(phone_kettle6,fs,phonefs);
clear phone_kettle6;
pk_12_sig = mean(pk_12_sig,2);
pk_12_sig = standardize(pk_12_sig);

[pk_12_cent,pk_12_benergy,pk_12_flux,pk_12_rollofffreq] = lowlevelfeatures(pk_12_sig,fs);
pk_12_MFCCoeffs = mymfcc(pk_12_sig,fs);

%% Kettle_13 (Phone)
[phone_kettle7,phonefs] = audioread('phone_kettle7.wav');
pk_13_sig = resample(phone_kettle7,fs,phonefs);
clear phone_kettle7;
pk_13_sig = mean(pk_13_sig,2);
pk_13_sig = standardize(pk_13_sig);

[pk_13_cent,pk_13_benergy,pk_13_flux,pk_13_rollofffreq] = lowlevelfeatures(pk_13_sig,fs);
pk_13_MFCCoeffs = mymfcc(pk_13_sig,fs);

%% Kettle_14 (Phone)
[phone_kettle8,phonefs] = audioread('phone_kettle8.wav');
pk_14_sig = resample(phone_kettle8,fs,phonefs);
clear phone_kettle8;
pk_14_sig = mean(pk_14_sig,2);
pk_14_sig = standardize(pk_14_sig);

[pk_14_cent,pk_14_benergy,pk_14_flux,pk_14_rollofffreq] = lowlevelfeatures(pk_14_sig,fs);
pk_14_MFCCoeffs = mymfcc(pk_14_sig,fs);

%% Kettle_15 (Phone)
[phone_kettle9,phonefs] = audioread('phone_kettle9.wav');
pk_15_sig = resample(phone_kettle9,fs,phonefs);
clear phone_kettle9;
pk_15_sig = mean(pk_15_sig,2);
pk_15_sig = standardize(pk_15_sig);

[pk_15_cent,pk_15_benergy,pk_15_flux,pk_15_rollofffreq] = lowlevelfeatures(pk_15_sig,fs);
pk_15_MFCCoeffs = mymfcc(pk_15_sig,fs);

%% Kettle_16 (Phone)
[phone_kettle10,phonefs] = audioread('phone_kettle10.wav');
pk_16_sig = resample(phone_kettle10,fs,phonefs);
clear phone_kettle10;
pk_16_sig = mean(pk_16_sig,2);
pk_16_sig = standardize(pk_16_sig);

[pk_16_cent,pk_16_benergy,pk_16_flux,pk_16_rollofffreq] = lowlevelfeatures(pk_16_sig,fs);
pk_16_MFCCoeffs = mymfcc(pk_16_sig,fs);

%% Kettle_17
[f_kettle_1,fs] = audioread('f_kettle_1.mp3');
k10_17_sig = f_kettle_1;
clear f_kettle_1;
k10_17_sig = standardize(k10_17_sig);

[k10_17_cent,k10_17_benergy,k10_17_flux,k10_17_rollofffreq] = lowlevelfeatures(k10_17_sig,fs);
k10_17_MFCCoeffs = mymfcc(k10_17_sig,fs);

%% Kettle_18
[f_kettle_2,fs] = audioread('f_kettle_2.mp3');
k10_18_sig = f_kettle_2;
clear f_kettle_2;
k10_18_sig = standardize(k10_18_sig);

[k10_18_cent,k10_18_benergy,k10_18_flux,k10_18_rollofffreq] = lowlevelfeatures(k10_18_sig,fs);
k10_18_MFCCoeffs = mymfcc(k10_18_sig,fs);

%% Kettle_19
[f_kettle_3,fs] = audioread('f_kettle_3.mp3');
k10_19_sig = f_kettle_3;
clear f_kettle_3;
k10_19_sig = standardize(k10_19_sig);

[k10_19_cent,k10_19_benergy,k10_19_flux,k10_19_rollofffreq] = lowlevelfeatures(k10_19_sig,fs);
k10_19_MFCCoeffs = mymfcc(k10_19_sig,fs);

%% Kettle_20 (Phone)
[f_phone_kettle1,phonefs] = audioread('f_phone_kettle1.wav');
pk_20_sig = resample(f_phone_kettle1,fs,phonefs);
clear f_phone_kettle1;
pk_20_sig = mean(pk_20_sig,2);
pk_20_sig = standardize(pk_20_sig);

[pk_20_cent,pk_20_benergy,pk_20_flux,pk_20_rollofffreq] = lowlevelfeatures(pk_20_sig,fs);
pk_20_MFCCoeffs = mymfcc(pk_20_sig,fs);

%% Kettle_21 (Phone)
[f_phone_kettle2,phonefs] = audioread('f_phone_kettle2.wav');
pk_21_sig = resample(f_phone_kettle2,fs,phonefs);
clear f_phone_kettle2;
pk_21_sig = mean(pk_21_sig,2);
pk_21_sig = standardize(pk_21_sig);

[pk_21_cent,pk_21_benergy,pk_21_flux,pk_21_rollofffreq] = lowlevelfeatures(pk_21_sig,fs);
pk_21_MFCCoeffs = mymfcc(pk_21_sig,fs);

%% Kettle_22 (Phone)
[f_phone_kettle3,phonefs] = audioread('f_phone_kettle3.wav');
pk_22_sig = resample(f_phone_kettle3,fs,phonefs);
clear f_phone_kettle3;
pk_22_sig = mean(pk_22_sig,2);
pk_22_sig = standardize(pk_22_sig);

[pk_22_cent,pk_22_benergy,pk_22_flux,pk_22_rollofffreq] = lowlevelfeatures(pk_22_sig,fs);
pk_22_MFCCoeffs = mymfcc(pk_22_sig,fs);

%% WashingMachine_1
[washingmachine_2m_25cm_1,fs] = audioread('washingmachine_2m_25cm_1.mp3');
wm225_1_sig = washingmachine_2m_25cm_1;
clear washingmachine_2m_25cm_1;
wm225_1_sig = standardize(wm225_1_sig);

[wm225_1_cent,wm225_1_benergy,wm225_1_flux,wm225_1_rollofffreq] = lowlevelfeatures(wm225_1_sig,fs);
wm225_1_MFCCoeffs = mymfcc(wm225_1_sig,fs);

%% WashingMachine_2
[washingmachine_10cm_2,fs] = audioread('washingmachine_10cm_2.mp3');
wm10_2_sig = washingmachine_10cm_2;
clear washingmachine_10cm_2;
wm10_2_sig = standardize(wm10_2_sig);

[wm10_2_cent,wm10_2_benergy,wm10_2_flux,wm10_2_rollofffreq] = lowlevelfeatures(wm10_2_sig,fs);
wm10_2_MFCCoeffs = mymfcc(wm10_2_sig,fs);

%% WashingMachine_3
[washingmachine_10cm_3,fs] = audioread('washingmachine_10cm_3.mp3');
wm10_3_sig = washingmachine_10cm_3;
clear washingmachine_10cm_3;
wm10_3_sig = standardize(wm10_3_sig);

[wm10_3_cent,wm10_3_benergy,wm10_3_flux,wm10_3_rollofffreq] = lowlevelfeatures(wm10_3_sig,fs);
wm10_3_MFCCoeffs = mymfcc(wm10_3_sig,fs);

%% WashingMachine_4 (Phone)
[phone_washingmachine1,phonefs] = audioread('phone_washingmachine1.wav');
pw_4_sig = resample(phone_washingmachine1,fs,phonefs);
clear phone_washingmachine1;
pw_4_sig = mean(pw_4_sig,2);
pw_4_sig = standardize(pw_4_sig);

[pw_4_cent,pw_4_benergy,pw_4_flux,pw_4_rollofffreq] = lowlevelfeatures(pw_4_sig,fs);
pw_4_MFCCoeffs = mymfcc(pw_4_sig,fs);

%% WashingMachine_5 (Phone)
[phone_washingmachine2,phonefs] = audioread('phone_washingmachine2.wav');
pw_5_sig = resample(phone_washingmachine2,fs,phonefs);
clear phone_washingmachine2;
pw_5_sig = mean(pw_5_sig,2);
pw_5_sig = standardize(pw_5_sig);

[pw_5_cent,pw_5_benergy,pw_5_flux,pw_5_rollofffreq] = lowlevelfeatures(pw_5_sig,fs);
pw_5_MFCCoeffs = mymfcc(pw_5_sig,fs);

%% WashingMachine_6 (Phone)
[phone_washingmachine3,phonefs] = audioread('phone_washingmachine3.wav');
pw_6_sig = resample(phone_washingmachine3,fs,phonefs);
clear phone_washingmachine3;
pw_6_sig = mean(pw_6_sig,2);
pw_6_sig = standardize(pw_6_sig);

[pw_6_cent,pw_6_benergy,pw_6_flux,pw_6_rollofffreq] = lowlevelfeatures(pw_6_sig,fs);
pw_6_MFCCoeffs = mymfcc(pw_6_sig,fs);

%% WashingMachine_7 (Phone)
[phone_washingmachine4,phonefs] = audioread('phone_washingmachine4.wav');
pw_7_sig = resample(phone_washingmachine4,fs,phonefs);
clear phone_washingmachine4;
pw_7_sig = mean(pw_7_sig,2);
pw_7_sig = standardize(pw_7_sig);

[pw_7_cent,pw_7_benergy,pw_7_flux,pw_7_rollofffreq] = lowlevelfeatures(pw_7_sig,fs);
pw_7_MFCCoeffs = mymfcc(pw_7_sig,fs);

%% WashingMachine_8 (Phone)
[phone_washingmachine5,phonefs] = audioread('phone_washingmachine5.wav');
pw_8_sig = resample(phone_washingmachine5,fs,phonefs);
clear phone_washingmachine5;
pw_8_sig = mean(pw_8_sig,2);
pw_8_sig = standardize(pw_8_sig);

[pw_8_cent,pw_8_benergy,pw_8_flux,pw_8_rollofffreq] = lowlevelfeatures(pw_8_sig,fs);
pw_8_MFCCoeffs = mymfcc(pw_8_sig,fs);

%% WashingMachine_9
[f_washingmachine_1,fs] = audioread('f_washingmachine_1.mp3');
wm10_9_sig = f_washingmachine_1;
clear f_washingmachine_1;
wm10_9_sig = standardize(wm10_9_sig);

[wm10_9_cent,wm10_9_benergy,wm10_9_flux,wm10_9_rollofffreq] = lowlevelfeatures(wm10_9_sig,fs);
wm10_9_MFCCoeffs = mymfcc(wm10_9_sig,fs);

%% WashingMachine_10
[f_washingmachine_2,fs] = audioread('f_washingmachine_2.mp3');
wm10_10_sig = f_washingmachine_2;
clear f_washingmachine_2;
wm10_10_sig = standardize(wm10_10_sig);

[wm10_10_cent,wm10_10_benergy,wm10_10_flux,wm10_10_rollofffreq] = lowlevelfeatures(wm10_10_sig,fs);
wm10_10_MFCCoeffs = mymfcc(wm10_10_sig,fs);

%% WashingMachine_11 (Phone)
[f_phone_washingmachine1,phonefs] = audioread('f_phone_washingmachine1.wav');
pw_11_sig = resample(f_phone_washingmachine1,fs,phonefs);
clear f_phone_washingmachine1;
pw_11_sig = mean(pw_11_sig,2);
pw_11_sig = standardize(pw_11_sig);

[pw_11_cent,pw_11_benergy,pw_11_flux,pw_11_rollofffreq] = lowlevelfeatures(pw_11_sig,fs);
pw_11_MFCCoeffs = mymfcc(pw_11_sig,fs);

%% WashingMachine_12 (Phone)
[f_phone_washingmachine2,phonefs] = audioread('f_phone_washingmachine2.wav');
pw_12_sig = resample(f_phone_washingmachine2,fs,phonefs);
clear f_phone_washingmachine2;
pw_12_sig = mean(pw_12_sig,2);
pw_12_sig = standardize(pw_12_sig);

[pw_12_cent,pw_12_benergy,pw_12_flux,pw_12_rollofffreq] = lowlevelfeatures(pw_12_sig,fs);
pw_12_MFCCoeffs = mymfcc(pw_12_sig,fs);

%% WashingMachine_13
[washingmachine_10cm_4,fs] = audioread('washingmachine_10cm_4.mp3');
wm10_13_sig = washingmachine_10cm_4;
clear washingmachine_10cm_4;
wm10_13_sig = standardize(wm10_13_sig);

[wm10_13_cent,wm10_13_benergy,wm10_13_flux,wm10_13_rollofffreq] = lowlevelfeatures(wm10_13_sig,fs);
wm10_13_MFCCoeffs = mymfcc(wm10_13_sig,fs);

%% Microwave_1
[microwave_10cm_1,fs] = audioread('microwave_10cm_1.mp3');
m10_1_sig = microwave_10cm_1;
clear microwave_10cm_1;
m10_1_sig = standardize(m10_1_sig);

[m10_1_cent,m10_1_benergy,m10_1_flux,m10_1_rollofffreq] = lowlevelfeatures(m10_1_sig,fs);
m10_1_MFCCoeffs = mymfcc(m10_1_sig,fs);

%% Microwave_2
[microwave_10cm_2,fs] = audioread('microwave_10cm_2.mp3');
m10_2_sig = microwave_10cm_2;
clear microwave_10cm_2;
m10_2_sig = standardize(m10_2_sig);

[m10_2_cent,m10_2_benergy,m10_2_flux,m10_2_rollofffreq] = lowlevelfeatures(m10_2_sig,fs);
m10_2_MFCCoeffs = mymfcc(m10_2_sig,fs);

%% Microwave_3
[microwave_10cm_3,fs] = audioread('microwave_10cm_3.mp3');
m10_3_sig = microwave_10cm_3;
clear microwave_10cm_3;
m10_3_sig = standardize(m10_3_sig);

[m10_3_cent,m10_3_benergy,m10_3_flux,m10_3_rollofffreq] = lowlevelfeatures(m10_3_sig,fs);
m10_3_MFCCoeffs = mymfcc(m10_3_sig,fs);

%% Microwave_4 (Phone)
[b_phone_microwave1,phonefs] = audioread('b_phone_microwave1.wav');
pm_4_sig = resample(b_phone_microwave1,fs,phonefs);
clear b_phone_microwave1;
pm_4_sig = mean(pm_4_sig,2);
pm_4_sig = standardize(pm_4_sig);

[pm_4_cent,pm_4_benergy,pm_4_flux,pm_4_rollofffreq] = lowlevelfeatures(pm_4_sig,fs);
pm_4_MFCCoeffs = mymfcc(pm_4_sig,fs);

%% Microwave_5 (Phone)
[b_phone_microwave2,phonefs] = audioread('b_phone_microwave2.wav');
pm_5_sig = resample(b_phone_microwave2,fs,phonefs);
clear b_phone_microwave2;
pm_5_sig = mean(pm_5_sig,2);
pm_5_sig = standardize(pm_5_sig);

[pm_5_cent,pm_5_benergy,pm_5_flux,pm_5_rollofffreq] = lowlevelfeatures(pm_5_sig,fs);
pm_5_MFCCoeffs = mymfcc(pm_5_sig,fs);

%% Microwave_6 (Phone)
[phone_microwave1,phonefs] = audioread('phone_microwave1.wav');
pm_6_sig = resample(phone_microwave1,fs,phonefs);
clear phone_microwave1;
pm_6_sig = mean(pm_6_sig,2);
pm_6_sig = standardize(pm_6_sig);

[pm_6_cent,pm_6_benergy,pm_6_flux,pm_6_rollofffreq] = lowlevelfeatures(pm_6_sig,fs);
pm_6_MFCCoeffs = mymfcc(pm_6_sig,fs);

%% Microwave_7 (Phone)
[phone_microwave2,phonefs] = audioread('phone_microwave2.wav');
pm_7_sig = resample(phone_microwave2,fs,phonefs);
clear phone_microwave2;
pm_7_sig = mean(pm_7_sig,2);
pm_7_sig = standardize(pm_7_sig);

[pm_7_cent,pm_7_benergy,pm_7_flux,pm_7_rollofffreq] = lowlevelfeatures(pm_7_sig,fs);
pm_7_MFCCoeffs = mymfcc(pm_7_sig,fs);

%% Microwave_8
[f_microwave_1,fs] = audioread('f_microwave_1.mp3');
m10_8_sig = f_microwave_1;
clear f_microwave_1;
m10_8_sig = standardize(m10_8_sig);

[m10_8_cent,m10_8_benergy,m10_8_flux,m10_8_rollofffreq] = lowlevelfeatures(m10_8_sig,fs);
m10_8_MFCCoeffs = mymfcc(m10_8_sig,fs);

%% Microwave_9
[f_microwave_2,fs] = audioread('f_microwave_2.mp3');
m10_9_sig = f_microwave_2;
clear f_microwave_2;
m10_9_sig = standardize(m10_9_sig);

[m10_9_cent,m10_9_benergy,m10_9_flux,m10_9_rollofffreq] = lowlevelfeatures(m10_9_sig,fs);
m10_9_MFCCoeffs = mymfcc(m10_9_sig,fs);

%% Microwave_10 (Phone)
[f_phone_microwave1,phonefs] = audioread('f_phone_microwave1.wav');
pm_10_sig = resample(f_phone_microwave1,fs,phonefs);
clear f_phone_microwave1;
pm_10_sig = mean(pm_10_sig,2);
pm_10_sig = standardize(pm_10_sig);

[pm_10_cent,pm_10_benergy,pm_10_flux,pm_10_rollofffreq] = lowlevelfeatures(pm_10_sig,fs);
pm_10_MFCCoeffs = mymfcc(pm_10_sig,fs);

%% Microwave_11 (Phone)
[f_phone_microwave2,phonefs] = audioread('f_phone_microwave2.wav');
pm_11_sig = resample(f_phone_microwave2,fs,phonefs);
clear f_phone_microwave2;
pm_11_sig = mean(pm_11_sig,2);
pm_11_sig = standardize(pm_11_sig);

[pm_11_cent,pm_11_benergy,pm_11_flux,pm_11_rollofffreq] = lowlevelfeatures(pm_11_sig,fs);
pm_11_MFCCoeffs = mymfcc(pm_11_sig,fs);

%% Microwave_12 (Phone)
[phone_microwave3,phonefs] = audioread('phone_microwave3.wav');
pm_12_sig = resample(phone_microwave3,fs,phonefs);
clear phone_microwave3;
pm_12_sig = mean(pm_12_sig,2);
pm_12_sig = standardize(pm_12_sig);

[pm_12_cent,pm_12_benergy,pm_12_flux,pm_12_rollofffreq] = lowlevelfeatures(pm_12_sig,fs);
pm_12_MFCCoeffs = mymfcc(pm_12_sig,fs);

%% Microwave_13 (Phone)
[phone_microwave4,phonefs] = audioread('phone_microwave4.wav');
pm_13_sig = resample(phone_microwave4,fs,phonefs);
clear phone_microwave4;
pm_13_sig = mean(pm_13_sig,2);
pm_13_sig = standardize(pm_13_sig);

[pm_13_cent,pm_13_benergy,pm_13_flux,pm_13_rollofffreq] = lowlevelfeatures(pm_13_sig,fs);
pm_13_MFCCoeffs = mymfcc(pm_13_sig,fs);

%% Dishwasher_1
[dishwasher_10cm_1,fs] = audioread('dishwasher_10cm_1_quiet.mp3');
d10_1_sig = dishwasher_10cm_1;
clear dishwasher_10cm_1;
d10_1_sig = standardize(d10_1_sig);

[d10_1_cent,d10_1_benergy,d10_1_flux,d10_1_rollofffreq] = lowlevelfeatures(d10_1_sig,fs);
d10_1_MFCCoeffs = mymfcc(d10_1_sig,fs);

%% Dishwasher_2
[dishwasher_10cm_2,fs] = audioread('dishwasher_10cm_2.mp3');
d10_2_sig = dishwasher_10cm_2;
clear dishwasher_10cm_2;
d10_2_sig = standardize(d10_2_sig);

[d10_2_cent,d10_2_benergy,d10_2_flux,d10_2_rollofffreq] = lowlevelfeatures(d10_2_sig,fs);
d10_2_MFCCoeffs = mymfcc(d10_2_sig,fs);

%% Dishwasher_3
[dishwasher_10cm_3,fs] = audioread('dishwasher_10cm_3.mp3');
d10_3_sig = dishwasher_10cm_3;
clear dishwasher_10cm_3;
d10_3_sig = standardize(d10_3_sig);

[d10_3_cent,d10_3_benergy,d10_3_flux,d10_3_rollofffreq] = lowlevelfeatures(d10_3_sig,fs);
d10_3_MFCCoeffs = mymfcc(d10_3_sig,fs);

%% Dishwasher_4 (Phone)
[phone_dishwasher1,phonefs] = audioread('phone_dishwasher1.wav');
pd_4_sig = resample(phone_dishwasher1,fs,phonefs);
clear phone_dishwasher1;
pd_4_sig = mean(pd_4_sig,2);
pd_4_sig = standardize(pd_4_sig);

[pd_4_cent,pd_4_benergy,pd_4_flux,pd_4_rollofffreq] = lowlevelfeatures(pd_4_sig,fs);
pd_4_MFCCoeffs = mymfcc(pd_4_sig,fs);

%% Dishwasher_5 (Phone)
[phone_dishwasher2,phonefs] = audioread('phone_dishwasher2.wav');
pd_5_sig = resample(phone_dishwasher2,fs,phonefs);
clear phone_dishwasher2;
pd_5_sig = mean(pd_5_sig,2);
pd_5_sig = standardize(pd_5_sig);

[pd_5_cent,pd_5_benergy,pd_5_flux,pd_5_rollofffreq] = lowlevelfeatures(pd_5_sig,fs);
pd_5_MFCCoeffs = mymfcc(pd_5_sig,fs);

%% Dishwasher_6 (Phone)
[phone_dishwasher3,phonefs] = audioread('phone_dishwasher3.wav');
pd_6_sig = resample(phone_dishwasher3,fs,phonefs);
clear phone_dishwasher3;
pd_6_sig = mean(pd_6_sig,2);
pd_6_sig = standardize(pd_6_sig);

[pd_6_cent,pd_6_benergy,pd_6_flux,pd_6_rollofffreq] = lowlevelfeatures(pd_6_sig,fs);
pd_6_MFCCoeffs = mymfcc(pd_6_sig,fs);

%% Dishwasher_7 (Phone)
[phone_dishwasher4,phonefs] = audioread('phone_dishwasher4.wav');
pd_7_sig = resample(phone_dishwasher4,fs,phonefs);
clear phone_dishwasher4;
pd_7_sig = mean(pd_7_sig,2);
pd_7_sig = standardize(pd_7_sig);

[pd_7_cent,pd_7_benergy,pd_7_flux,pd_7_rollofffreq] = lowlevelfeatures(pd_7_sig,fs);
pd_7_MFCCoeffs = mymfcc(pd_7_sig,fs);

%% Dishwasher_8 (Phone)
[phone_dishwasher5,phonefs] = audioread('phone_dishwasher5.wav');
pd_8_sig = resample(phone_dishwasher5,fs,phonefs);
clear phone_dishwasher5;
pd_8_sig = mean(pd_8_sig,2);
pd_8_sig = standardize(pd_8_sig);

[pd_8_cent,pd_8_benergy,pd_8_flux,pd_8_rollofffreq] = lowlevelfeatures(pd_8_sig,fs);
pd_8_MFCCoeffs = mymfcc(pd_8_sig,fs);

%% Dishwasher_9
[f_dishwasher_1,fs] = audioread('f_dishwasher_1.mp3');
d10_9_sig = f_dishwasher_1;
clear f_dishwasher_1;
d10_9_sig = standardize(d10_9_sig);

[d10_9_cent,d10_9_benergy,d10_9_flux,d10_9_rollofffreq] = lowlevelfeatures(d10_9_sig,fs);
d10_9_MFCCoeffs = mymfcc(d10_9_sig,fs);

%% Dishwasher_10
[f_dishwasher_2,fs] = audioread('f_dishwasher_2.mp3');
d10_10_sig = f_dishwasher_2;
clear f_dishwasher_2;
d10_10_sig = standardize(d10_10_sig);

[d10_10_cent,d10_10_benergy,d10_10_flux,d10_10_rollofffreq] = lowlevelfeatures(d10_10_sig,fs);
d10_10_MFCCoeffs = mymfcc(d10_10_sig,fs);

%% Dishwasher_11 (Phone)
[f_phone_dishwasher1,phonefs] = audioread('f_phone_dishwasher1.wav');
pd_11_sig = resample(f_phone_dishwasher1,fs,phonefs);
clear f_phone_dishwasher1;
pd_11_sig = mean(pd_11_sig,2);
pd_11_sig = standardize(pd_11_sig);

[pd_11_cent,pd_11_benergy,pd_11_flux,pd_11_rollofffreq] = lowlevelfeatures(pd_11_sig,fs);
pd_11_MFCCoeffs = mymfcc(pd_11_sig,fs);

%% Dishwasher_12 (Phone)
[f_phone_dishwasher2,phonefs] = audioread('f_phone_dishwasher2.wav');
pd_12_sig = resample(f_phone_dishwasher2,fs,phonefs);
clear f_phone_dishwasher2;
pd_12_sig = mean(pd_12_sig,2);
pd_12_sig = standardize(pd_12_sig);

[pd_12_cent,pd_12_benergy,pd_12_flux,pd_12_rollofffreq] = lowlevelfeatures(pd_12_sig,fs);
pd_12_MFCCoeffs = mymfcc(pd_12_sig,fs);

%% Compiling
k25_1_comp = [k25_1_cent;k25_1_benergy;k25_1_flux;k25_1_rollofffreq;k25_1_MFCCoeffs(:,1:length(k25_1_cent))];       % Compiling features for each
k25_2_comp = [k25_2_cent;k25_2_benergy;k25_2_flux;k25_2_rollofffreq;k25_2_MFCCoeffs(:,1:length(k25_2_cent))];
k25_3_comp = [k25_3_cent;k25_3_benergy;k25_3_flux;k25_3_rollofffreq;k25_3_MFCCoeffs(:,1:length(k25_3_cent))];
k25_4_comp = [k25_4_cent;k25_4_benergy;k25_4_flux;k25_4_rollofffreq;k25_4_MFCCoeffs(:,1:length(k25_4_cent))];
k25_5_comp = [k25_5_cent;k25_5_benergy;k25_5_flux;k25_5_rollofffreq;k25_5_MFCCoeffs(:,1:length(k25_5_cent))];
k25_6_comp = [k25_6_cent;k25_6_benergy;k25_6_flux;k25_6_rollofffreq;k25_6_MFCCoeffs(:,1:length(k25_6_cent))];
pk_7_comp = [pk_7_cent;pk_7_benergy;pk_7_flux;pk_7_rollofffreq;pk_7_MFCCoeffs(:,1:length(pk_7_cent))];
pk_8_comp = [pk_8_cent;pk_8_benergy;pk_8_flux;pk_8_rollofffreq;pk_8_MFCCoeffs(:,1:length(pk_8_cent))];
pk_9_comp = [pk_9_cent;pk_9_benergy;pk_9_flux;pk_9_rollofffreq;pk_9_MFCCoeffs(:,1:length(pk_9_cent))];
pk_10_comp = [pk_10_cent;pk_10_benergy;pk_10_flux;pk_10_rollofffreq;pk_10_MFCCoeffs(:,1:length(pk_10_cent))];
pk_11_comp = [pk_11_cent;pk_11_benergy;pk_11_flux;pk_11_rollofffreq;pk_11_MFCCoeffs(:,1:length(pk_11_cent))];
pk_12_comp = [pk_12_cent;pk_12_benergy;pk_12_flux;pk_12_rollofffreq;pk_12_MFCCoeffs(:,1:length(pk_12_cent))];
pk_13_comp = [pk_13_cent;pk_13_benergy;pk_13_flux;pk_13_rollofffreq;pk_13_MFCCoeffs(:,1:length(pk_13_cent))];
pk_14_comp = [pk_14_cent;pk_14_benergy;pk_14_flux;pk_14_rollofffreq;pk_14_MFCCoeffs(:,1:length(pk_14_cent))];
pk_15_comp = [pk_15_cent;pk_15_benergy;pk_15_flux;pk_15_rollofffreq;pk_15_MFCCoeffs(:,1:length(pk_15_cent))];
pk_16_comp = [pk_16_cent;pk_16_benergy;pk_16_flux;pk_16_rollofffreq;pk_16_MFCCoeffs(:,1:length(pk_16_cent))];
k10_17_comp = [k10_17_cent;k10_17_benergy;k10_17_flux;k10_17_rollofffreq;k10_17_MFCCoeffs(:,1:length(k10_17_cent))];
k10_18_comp = [k10_18_cent;k10_18_benergy;k10_18_flux;k10_18_rollofffreq;k10_18_MFCCoeffs(:,1:length(k10_18_cent))];
k10_19_comp = [k10_19_cent;k10_19_benergy;k10_19_flux;k10_19_rollofffreq;k10_19_MFCCoeffs(:,1:length(k10_19_cent))];
pk_20_comp = [pk_20_cent;pk_20_benergy;pk_20_flux;pk_20_rollofffreq;pk_20_MFCCoeffs(:,1:length(pk_20_cent))];
pk_21_comp = [pk_21_cent;pk_21_benergy;pk_21_flux;pk_21_rollofffreq;pk_21_MFCCoeffs(:,1:length(pk_21_cent))];
pk_22_comp = [pk_22_cent;pk_22_benergy;pk_22_flux;pk_22_rollofffreq;pk_22_MFCCoeffs(:,1:length(pk_22_cent))];

wm225_1_comp = [wm225_1_cent;wm225_1_benergy;wm225_1_flux;wm225_1_rollofffreq;wm225_1_MFCCoeffs(:,1:length(wm225_1_cent))];
wm10_2_comp = [wm10_2_cent;wm10_2_benergy;wm10_2_flux;wm10_2_rollofffreq;wm10_2_MFCCoeffs(:,1:length(wm10_2_cent))];
wm10_3_comp = [wm10_3_cent;wm10_3_benergy;wm10_3_flux;wm10_3_rollofffreq;wm10_3_MFCCoeffs(:,1:length(wm10_3_cent))];
pw_4_comp = [pw_4_cent;pw_4_benergy;pw_4_flux;pw_4_rollofffreq;pw_4_MFCCoeffs(:,1:length(pw_4_cent))];
pw_5_comp = [pw_5_cent;pw_5_benergy;pw_5_flux;pw_5_rollofffreq;pw_5_MFCCoeffs(:,1:length(pw_5_cent))];
pw_6_comp = [pw_6_cent;pw_6_benergy;pw_6_flux;pw_6_rollofffreq;pw_6_MFCCoeffs(:,1:length(pw_6_cent))];
pw_7_comp = [pw_7_cent;pw_7_benergy;pw_7_flux;pw_7_rollofffreq;pw_7_MFCCoeffs(:,1:length(pw_7_cent))];
pw_8_comp = [pw_8_cent;pw_8_benergy;pw_8_flux;pw_8_rollofffreq;pw_8_MFCCoeffs(:,1:length(pw_8_cent))];
wm10_9_comp = [wm10_9_cent;wm10_9_benergy;wm10_9_flux;wm10_9_rollofffreq;wm10_9_MFCCoeffs(:,1:length(wm10_9_cent))];
wm10_10_comp = [wm10_10_cent;wm10_10_benergy;wm10_10_flux;wm10_10_rollofffreq;wm10_10_MFCCoeffs(:,1:length(wm10_10_cent))];
pw_11_comp = [pw_11_cent;pw_11_benergy;pw_11_flux;pw_11_rollofffreq;pw_11_MFCCoeffs(:,1:length(pw_11_cent))];
pw_12_comp = [pw_12_cent;pw_12_benergy;pw_12_flux;pw_12_rollofffreq;pw_12_MFCCoeffs(:,1:length(pw_12_cent))];
wm10_13_comp = [wm10_13_cent;wm10_13_benergy;wm10_13_flux;wm10_13_rollofffreq;wm10_13_MFCCoeffs(:,1:length(wm10_13_cent))];

m10_1_comp = [m10_1_cent;m10_1_benergy;m10_1_flux;m10_1_rollofffreq;m10_1_MFCCoeffs(:,1:length(m10_1_cent))];
m10_2_comp = [m10_2_cent;m10_2_benergy;m10_2_flux;m10_2_rollofffreq;m10_2_MFCCoeffs(:,1:length(m10_2_cent))];
m10_3_comp = [m10_3_cent;m10_3_benergy;m10_3_flux;m10_3_rollofffreq;m10_3_MFCCoeffs(:,1:length(m10_3_cent))];
pm_4_comp = [pm_4_cent;pm_4_benergy;pm_4_flux;pm_4_rollofffreq;pm_4_MFCCoeffs(:,1:length(pm_4_cent))];
pm_5_comp = [pm_5_cent;pm_5_benergy;pm_5_flux;pm_5_rollofffreq;pm_5_MFCCoeffs(:,1:length(pm_5_cent))];
pm_6_comp = [pm_6_cent;pm_6_benergy;pm_6_flux;pm_6_rollofffreq;pm_6_MFCCoeffs(:,1:length(pm_6_cent))];
pm_7_comp = [pm_7_cent;pm_7_benergy;pm_7_flux;pm_7_rollofffreq;pm_7_MFCCoeffs(:,1:length(pm_7_cent))];
m10_8_comp = [m10_8_cent;m10_8_benergy;m10_8_flux;m10_8_rollofffreq;m10_8_MFCCoeffs(:,1:length(m10_8_cent))];
m10_9_comp = [m10_9_cent;m10_9_benergy;m10_9_flux;m10_9_rollofffreq;m10_9_MFCCoeffs(:,1:length(m10_9_cent))];
pm_10_comp = [pm_10_cent;pm_10_benergy;pm_10_flux;pm_10_rollofffreq;pm_10_MFCCoeffs(:,1:length(pm_10_cent))];
pm_11_comp = [pm_11_cent;pm_11_benergy;pm_11_flux;pm_11_rollofffreq;pm_11_MFCCoeffs(:,1:length(pm_11_cent))];
pm_12_comp = [pm_12_cent;pm_12_benergy;pm_12_flux;pm_12_rollofffreq;pm_12_MFCCoeffs(:,1:length(pm_12_cent))];
pm_13_comp = [pm_13_cent;pm_13_benergy;pm_13_flux;pm_13_rollofffreq;pm_13_MFCCoeffs(:,1:length(pm_13_cent))];

d10_1_comp = [d10_1_cent;d10_1_benergy;d10_1_flux;d10_1_rollofffreq;d10_1_MFCCoeffs(:,1:length(d10_1_cent))];
d10_2_comp = [d10_2_cent;d10_2_benergy;d10_2_flux;d10_2_rollofffreq;d10_2_MFCCoeffs(:,1:length(d10_2_cent))];
d10_3_comp = [d10_3_cent;d10_3_benergy;d10_3_flux;d10_3_rollofffreq;d10_3_MFCCoeffs(:,1:length(d10_3_cent))];
pd_4_comp = [pd_4_cent;pd_4_benergy;pd_4_flux;pd_4_rollofffreq;pd_4_MFCCoeffs(:,1:length(pd_4_cent))];
pd_5_comp = [pd_5_cent;pd_5_benergy;pd_5_flux;pd_5_rollofffreq;pd_5_MFCCoeffs(:,1:length(pd_5_cent))];
pd_6_comp = [pd_6_cent;pd_6_benergy;pd_6_flux;pd_6_rollofffreq;pd_6_MFCCoeffs(:,1:length(pd_6_cent))];
pd_7_comp = [pd_7_cent;pd_7_benergy;pd_7_flux;pd_7_rollofffreq;pd_7_MFCCoeffs(:,1:length(pd_7_cent))];
pd_8_comp = [pd_8_cent;pd_8_benergy;pd_8_flux;pd_8_rollofffreq;pd_8_MFCCoeffs(:,1:length(pd_8_cent))];
d10_9_comp = [d10_9_cent;d10_9_benergy;d10_9_flux;d10_9_rollofffreq;d10_9_MFCCoeffs(:,1:length(d10_9_cent))];
d10_10_comp = [d10_10_cent;d10_10_benergy;d10_10_flux;d10_10_rollofffreq;d10_10_MFCCoeffs(:,1:length(d10_10_cent))];
pd_11_comp = [pd_11_cent;pd_11_benergy;pd_11_flux;pd_11_rollofffreq;pd_11_MFCCoeffs(:,1:length(pd_11_cent))];
pd_12_comp = [pd_12_cent;pd_12_benergy;pd_12_flux;pd_12_rollofffreq;pd_12_MFCCoeffs(:,1:length(pd_12_cent))];

                                % Compiling each appliance's features
kettle_comp = [k25_1_comp k25_2_comp k25_3_comp k25_4_comp k25_5_comp k25_6_comp pk_7_comp pk_8_comp pk_9_comp pk_10_comp pk_11_comp pk_12_comp pk_13_comp pk_14_comp pk_15_comp pk_16_comp k10_17_comp k10_18_comp k10_19_comp pk_20_comp pk_21_comp pk_22_comp]; %
kettle_comp = kettle_comp(:,randsample(1:length(kettle_comp),25000));   % Randomly sampling 25000 features from each to ensure all appliances have the same number of features
washingmachine_comp = [wm225_1_comp wm10_3_comp pw_5_comp pw_6_comp pw_7_comp pw_8_comp wm10_10_comp pw_12_comp wm10_13_comp]; %wm10_2_comp pw_4_comp wm10_9_comp pw_11_comp
washingmachine_comp = washingmachine_comp(:,randsample(1:length(washingmachine_comp),25000));
microwave_comp = [m10_1_comp m10_2_comp m10_3_comp pm_4_comp pm_5_comp pm_6_comp pm_7_comp m10_8_comp m10_9_comp pm_10_comp pm_11_comp pm_12_comp pm_13_comp]; %
microwave_comp = microwave_comp(:,randsample(1:length(microwave_comp),25000));
dishwasher_comp = [d10_1_comp d10_2_comp d10_3_comp pd_4_comp pd_5_comp pd_6_comp pd_7_comp pd_8_comp d10_9_comp d10_10_comp pd_11_comp pd_12_comp]; %
dishwasher_comp = dishwasher_comp(:,randsample(1:length(dishwasher_comp),25000));
inputs = [kettle_comp washingmachine_comp microwave_comp dishwasher_comp];  % Compiling all appliance's features together to make the inputs

k_targets = cell(1,length(kettle_comp));        % Creating targets for each appliance
k_targets(:) = {'kettle'};                      % and labelling them
wm_targets = cell(1,length(washingmachine_comp));
wm_targets(:) = {'washingmachine'};
m_targets = cell(1,length(microwave_comp));
m_targets(:) = {'microwave'};
d_targets = cell(1,length(dishwasher_comp));
d_targets(:) = {'dishwasher'};
targets = [k_targets wm_targets m_targets d_targets];       % Compiling targets

clearvars -except inputs targets                            % Clearing unwanted variables
save('washingmdata');                                       % Saving results
