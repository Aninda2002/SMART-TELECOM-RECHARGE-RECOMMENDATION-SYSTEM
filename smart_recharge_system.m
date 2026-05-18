%% =========================================================
% SMART TELECOM RECHARGE RECOMMENDATION SYSTEM
%
% FEATURES ADDED:
% ---------------------------------------------------------
% 1. Different Data Plans
% 2. OTT Bundles
% 3. 28 / 84 / 180 / 365 Day Plans
% 4. Budget Optimization
% 5. Jio / Airtel / Vi / BSNL Recommendation
% 6. 5G Preference
% 7. Heavy / Medium / Low User Detection
%% =========================================================

%% CREATE FIS
fis = mamfis('Name','AdvancedRechargeSystem');

%% =========================================================
%% INPUT 1 : INTERNET USAGE (GB/DAY)
%% =========================================================

fis = addInput(fis,[0 5],'Name','InternetUsage');

fis = addMF(fis,'InternetUsage','trapmf',[0 0 0.5 1.5], ...
    'Name','Low');

fis = addMF(fis,'InternetUsage','trimf',[1 2 3], ...
    'Name','Medium');

fis = addMF(fis,'InternetUsage','trapmf',[2.5 4 5 5], ...
    'Name','High');

%% =========================================================
%% INPUT 2 : BUDGET
%% =========================================================

fis = addInput(fis,[100 5000],'Name','Budget');

fis = addMF(fis,'Budget','trapmf',[100 100 500 1200], ...
    'Name','Low');

fis = addMF(fis,'Budget','trimf',[1000 2200 3200], ...
    'Name','Medium');

fis = addMF(fis,'Budget','trapmf',[3000 4000 5000 5000], ...
    'Name','High');

%% =========================================================
%% INPUT 3 : VALIDITY (MONTHS)
%% =========================================================

fis = addInput(fis,[1 12],'Name','Validity');

fis = addMF(fis,'Validity','trapmf',[1 1 1 2], ...
    'Name','Short');

fis = addMF(fis,'Validity','trimf',[2 4 6], ...
    'Name','Medium');

fis = addMF(fis,'Validity','trapmf',[6 9 12 12], ...
    'Name','Long');

%% =========================================================
%% INPUT 4 : OTT PREFERENCE
%% =========================================================

fis = addInput(fis,[0 10],'Name','OTTPreference');

fis = addMF(fis,'OTTPreference','trapmf',[0 0 2 4], ...
    'Name','Low');

fis = addMF(fis,'OTTPreference','trimf',[3 5 7], ...
    'Name','Medium');

fis = addMF(fis,'OTTPreference','trapmf',[6 8 10 10], ...
    'Name','High');

%% =========================================================
%% INPUT 5 : 5G REQUIREMENT
%% =========================================================

fis = addInput(fis,[0 10],'Name','5gGRequirement');

fis = addMF(fis,'5gGRequirement','trapmf',[0 0 2 4], ...
    'Name','Low');

fis = addMF(fis,'5gGRequirement','trimf',[3 5 7], ...
    'Name','Medium');

fis = addMF(fis,'5gGRequirement','trapmf',[6 8 10 10], ...
    'Name','High');

%% =========================================================
%% OUTPUT 1 : RECHARGE CATEGORY
%% =========================================================

fis = addOutput(fis,[0 100],'Name','RechargeCategory');

fis = addMF(fis,'RechargeCategory','trapmf',[0 0 20 35], ...
    'Name','VoiceOnly');

fis = addMF(fis,'RechargeCategory','trimf',[30 45 60], ...
    'Name','BudgetData');

fis = addMF(fis,'RechargeCategory','trimf',[55 70 85], ...
    'Name','OTTBundle');

fis = addMF(fis,'RechargeCategory','trapmf',[80 90 100 100], ...
    'Name','PremiumAnnual');

%% =========================================================
%% OUTPUT 2 : OPERATOR
%% =========================================================

fis = addOutput(fis,[0 100],'Name','Operator');

fis = addMF(fis,'Operator','trapmf',[0 0 20 35], ...
    'Name','BSNL');

fis = addMF(fis,'Operator','trimf',[30 45 60], ...
    'Name','Vi');

fis = addMF(fis,'Operator','trimf',[55 70 85], ...
    'Name','Airtel');

fis = addMF(fis,'Operator','trapmf',[80 90 100 100], ...
    'Name','Jio');

%% =========================================================
%% RULES
%% =========================================================

rules = [

1 1 1 1 1 1 1 1 1
1 2 1 1 1 2 2 1 1
2 2 2 2 2 2 3 1 1
2 3 2 2 2 3 3 1 1
3 2 2 3 3 3 4 1 1
3 3 3 3 3 4 4 1 1
2 3 3 2 2 4 3 1 1
3 3 3 2 3 4 4 1 1
1 1 3 1 1 1 1 1 1
2 1 2 1 1 2 2 1 1

];

fis = addRule(fis,rules);

%% =========================================================
%% TELECOM DATA PLANS
%% =========================================================

plans = {

'Jio'    299    '28 Days'   '1.5GB/day' ...
'JioCinema'      'Budget'

'Jio'    399    '28 Days'   '2GB/day' ...
'JioCinema + 5G' 'OTT'

'Jio'    799    '84 Days'   '1.5GB/day' ...
'JioCinema'      'Budget'

'Jio'    999    '84 Days'   '2GB/day' ...
'Netflix + 5G'   'OTT'

'Jio'    3599   '365 Days'  '2.5GB/day' ...
'Netflix + Hotstar + 5G' 'Premium'

'Airtel' 349    '28 Days'   '1.5GB/day' ...
'Xstream'        'Budget'

'Airtel' 449    '28 Days'   '2GB/day' ...
'Hotstar'        'OTT'

'Airtel' 899    '84 Days'   '1.5GB/day' ...
'Xstream + Wynk' 'Budget'

'Airtel' 1199   '84 Days'   '2GB/day' ...
'Hotstar + 5G'   'OTT'

'Airtel' 3999   '365 Days'  '2.5GB/day' ...
'Netflix + Hotstar + Prime' 'Premium'

'Vi'      319    '28 Days'   '1GB/day' ...
'Vi Movies'      'Budget'

'Vi'      539    '56 Days'   '2GB/day' ...
'SonyLIV'        'OTT'

'Vi'      859    '84 Days'   '1.5GB/day' ...
'Vi Movies + OTT' 'Budget'

'Vi'      1099   '84 Days'   '2GB/day' ...
'Prime Lite + OTT' 'OTT'

'Vi'      3799   '365 Days'  '2GB/day' ...
'Prime + Hotstar' 'Premium'

'BSNL'    197    '28 Days'   '2GB/day' ...
'No OTT'         'Budget'

'BSNL'    599    '84 Days'   '3GB/day' ...
'No OTT'         'Budget'

'BSNL'    2399   '365 Days'  '2GB/day' ...
'No OTT'         'Premium'

};

%% =========================================================
%% USER INPUT
%% =========================================================

userInput = [3 4000 12 9 8];

%% =========================================================
%% EVALUATE FUZZY SYSTEM
%% =========================================================

output = evalfis(fis,userInput);

rechargeScore = output(1);
operatorScore = output(2);

%% =========================================================
%% DETERMINE CATEGORY
%% =========================================================

if rechargeScore <= 35
    
    category = 'VoiceOnly';
    
elseif rechargeScore <= 60
    
    category = 'Budget';
    
elseif rechargeScore <= 85
    
    category = 'OTT';
    
else
    
    category = 'Premium';
    
end

%% =========================================================
%% DETERMINE OPERATOR
%% =========================================================

if operatorScore <= 35
    
    operatorName = 'BSNL';
    
elseif operatorScore <= 60
    
    operatorName = 'Vi';
    
elseif operatorScore <= 85
    
    operatorName = 'Airtel';
    
else
    
    operatorName = 'Jio';
    
end

%% =========================================================
%% DISPLAY USER REQUIREMENTS
%% =========================================================

fprintf('\n=============================================\n');
fprintf('SMART TELECOM RECOMMENDATION SYSTEM\n');
fprintf('=============================================\n');

fprintf('Internet Usage     : %.1f GB/day\n',userInput(1));
fprintf('Budget             : ₹%.0f\n',userInput(2));
fprintf('Validity Required  : %.0f Months\n',userInput(3));
fprintf('OTT Preference     : %.0f/10\n',userInput(4));
fprintf('5G Requirement     : %.0f/10\n',userInput(5));

fprintf('\nRecommended Category : %s\n',category);
fprintf('Recommended Operator : %s\n',operatorName);

%% =========================================================
%% DISPLAY SUITABLE PLANS
%% =========================================================

fprintf('\n============= SUITABLE DATA PLANS ============\n');

for i = 1:size(plans,1)
    
    currentOperator = plans{i,1};
    currentPrice = plans{i,2};
    currentValidity = plans{i,3};
    currentData = plans{i,4};
    currentOTT = plans{i,5};
    currentCategory = plans{i,6};
    
    if strcmp(currentOperator,operatorName)
        
        if strcmp(currentCategory,category)
            
            fprintf('\nOperator : %s\n',currentOperator);
            fprintf('Price    : ₹%d\n',currentPrice);
            fprintf('Validity : %s\n',currentValidity);
            fprintf('Data     : %s\n',currentData);
            fprintf('OTT      : %s\n',currentOTT);
            
        end
    end
end

%% =========================================================
%% FINAL RECOMMENDATION
%% =========================================================

fprintf('\n============= FINAL RECOMMENDATION ===========\n');

if strcmp(operatorName,'Jio')
    
    fprintf(['Jio is recommended because of strong 5G, ' ...
             'good OTT bundles, and better annual plans.\n']);
         
elseif strcmp(operatorName,'Airtel')
    
    fprintf(['Airtel is recommended because of premium ' ...
             'network quality and Hotstar bundles.\n']);
         
elseif strcmp(operatorName,'Vi')
    
    fprintf(['Vi is recommended because of entertainment ' ...
             'focused recharge plans.\n']);
         
else
    
    fprintf(['BSNL is recommended for low-budget users ' ...
             'requiring long validity.\n']);
end

%% =========================================================
%% RULE VIEWER
%% =========================================================

ruleview(fis)

%% =========================================================
%% SURFACE VIEW
%% =========================================================

figure;
gensurf(fis,[1 2],1);

title('Internet Usage vs Budget -> Recharge Category');

%% =========================================================
%% MEMBERSHIP FUNCTION PLOTS
%% =========================================================

figure;

subplot(3,2,1);
plotmf(fis,'input',1);
title('Internet Usage');

subplot(3,2,2);
plotmf(fis,'input',2);
title('Budget');

subplot(3,2,3);
plotmf(fis,'input',3);
title('Validity');

subplot(3,2,4);
plotmf(fis,'input',4);
title('OTT Preference');

subplot(3,2,5);
plotmf(fis,'input',5);
title('5gGRequirement');

subplot(3,2,6);
plotmf(fis,'output',1);
title('Recharge Category');

%% =========================================================
%% END
%% =========================================================

