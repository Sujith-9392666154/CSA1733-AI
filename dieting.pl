% Define diseases and associated dietary recommendations
diet_recommendation(cold, 'Drink plenty of fluids and eat light meals such as soup and fruit. Avoid dairy products and fatty foods.').
diet_recommendation(flu, 'Stay hydrated with water, herbal teas, and broths. Eat easily digestible foods like bananas, rice, applesauce, and toast (BRAT diet). Avoid caffeine, alcohol, and greasy foods.').
diet_recommendation(diabetes, 'Follow a balanced diet with controlled carbohydrates, including whole grains, fruits, vegetables, lean proteins, and healthy fats. Avoid sugary foods and beverages, processed carbohydrates, and high-fat foods.').
diet_recommendation(hypertension, 'Eat a diet rich in fruits, vegetables, whole grains, and lean proteins. Limit sodium intake, avoid processed and high-sodium foods, and reduce consumption of saturated and trans fats.').
diet_recommendation(high_cholesterol, 'Follow a diet low in saturated and trans fats. Choose lean meats, fish, poultry, and low-fat dairy. Eat plenty of fruits, vegetables, whole grains, and nuts. Limit cholesterol-rich foods and avoid fried and processed foods.').
diet_recommendation(ibs, 'Try a low-FODMAP diet, which restricts certain carbohydrates that can trigger IBS symptoms. Focus on easily digestible foods like rice, bananas, potatoes, and lean proteins. Avoid trigger foods such as dairy, caffeine, alcohol, and spicy foods.').

% Rule to suggest diet based on disease
suggest_diet(Disease) :-
    diet_recommendation(Disease, Diet),
    write('For '), write(Disease), write(', '), write(Diet), nl.

% Entry point
start :-
    write('Enter the disease to get diet recommendation: '), nl,
    read(Disease),
    suggest_diet(Disease).
