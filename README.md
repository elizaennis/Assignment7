# Assignment #7 Repository

This repository includes the simulated data for Assignment #7. Fork this repository and add your analysis as described in the canvas assignment.

The csv file for `cohort` in the `raw-data` folder includes 5,000 observations with variables `smoke`, `female`, `age`, `cardiac`, and `cost`.

##Updated May 20, 2024
We established cardiac and cost as our response / dependent variables and female, smoke, and age as our predictor variables. Cost will be our primary response variable. Smoke, female, and cardiac are binary, while age and cost are continuous. 10% of the population has smoke = 1 and 49% has female = 1. 4% are cardiac patients. Ages range from 18-65 with an average of 41.5 and standard deviation of 13.5. Costs range from $8478 to $11326 with an average of $9672 and standard deviation of $403.
Through preliminary analysis, it is clear that costs are higher with smoke = 1, greater age, female = 0, and cardiac = 1 (p<2e-16). Being a cardiac patient is less likely with higher age, smoke, and femaleness, but the magnitude of these relationships is significantly smaller than those for cost.
