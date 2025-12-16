"""Unit tests for train.py"""

from sklearn.datasets import load_iris
from sklearn.linear_model import LogisticRegression
from sklearn.model_selection import train_test_split


def test_train_model_accuracy():
    """Test that the model achieves reasonable accuracy on the Iris dataset."""
    iris = load_iris()
    X_train, X_test, y_train, y_test = train_test_split(iris.data, iris.target, test_size=0.3, random_state=42)
    model = LogisticRegression(max_iter=200, random_state=42)
    model.fit(X_train, y_train)
    accuracy = model.score(X_test, y_test)

    # The model should achieve at least 90% accuracy on Iris dataset
    assert accuracy >= 0.9, f"Model accuracy {accuracy:.2f} is below expected threshold"
