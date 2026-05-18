# Smart Telecom Recharge Recommendation System

A MATLAB-based fuzzy logic system that intelligently recommends the most suitable telecom recharge category and mobile operator based on user requirements such as internet usage, budget, validity, OTT preference, and 5G requirement.

This project uses the Fuzzy Logic Toolbox in MATLAB to simulate human-like decision-making for telecom recharge recommendations.

---

# Features

- Smart recharge recommendation using fuzzy logic
- Multiple telecom operators supported
  - Jio
  - Airtel
  - Vi
  - BSNL
- Different recharge validity plans
  - 28 Days
  - 56 Days
  - 84 Days
  - 180 Days
  - 365 Days
- OTT bundle recommendation
- 5G preference analysis
- Heavy / Medium / Low internet user detection
- Budget-aware recharge optimization
- Automatic telecom operator recommendation
- Membership function visualization
- Rule viewer and surface plots

---

# Technologies Used

- MATLAB
- Fuzzy Logic Toolbox
- Mamdani Fuzzy Inference System (FIS)

---

# Input Parameters

| Input Variable | Description | Range |
|---|---|---|
| InternetUsage | Daily internet consumption | 0 – 5 GB/day |
| Budget | Recharge budget | ₹100 – ₹5000 |
| Validity | Required plan validity | 1 – 12 Months |
| OTTPreference | OTT subscription preference | 0 – 10 |
| 5gGRequirement | Need for 5G services | 0 – 10 |

---

# Output Parameters

| Output Variable | Description |
|---|---|
| RechargeCategory | Recommended recharge category |
| Operator | Recommended telecom operator |

---

# Recharge Categories

- VoiceOnly
- BudgetData
- OTTBundle
- PremiumAnnual

---

# Supported Telecom Operators

- Jio
- Airtel
- Vi
- BSNL

---

# Fuzzy Membership Functions

The system uses:

- TrapMF (Trapezoidal Membership Functions)
- TriMF (Triangular Membership Functions)

for both input and output variables.

---

# Fuzzy Rules

The fuzzy inference system contains multiple intelligent IF-THEN rules that evaluate:

- Internet usage
- Budget constraints
- OTT preference
- 5G requirement
- Recharge validity

to generate optimized recharge recommendations.

## Example Rule

```matlab
IF InternetUsage is High
AND Budget is High
AND OTTPreference is High
AND 5gGRequirement is High

THEN RechargeCategory is PremiumAnnual
AND Operator is Jio


