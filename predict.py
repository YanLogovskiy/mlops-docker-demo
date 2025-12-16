import sys

import joblib
import numpy as np
from sklearn.datasets import load_iris

model = joblib.load("model.pkl")

if len(sys.argv) > 1:
    sample = np.array([float(x) for x in sys.argv[1:]])
else:
    sample = np.array([5.1, 3.5, 1.4, 0.2])  # setosa

prediction = model.predict([sample])[0]
probabilities = model.predict_proba([sample])[0]
iris = load_iris()

print(f"Input: {sample}")
print(f"Prediction: {iris.target_names[prediction]} (class {prediction})")
print(f"Probabilities: {probabilities.round(3)}")
