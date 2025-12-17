# 🚀 MLOps Docker Demo

A modern MLOps demonstration project showcasing machine learning model training with Docker containerization. This project trains a logistic regression model on the classic Iris dataset using scikit-learn.
## Full CI/CD Pipeline
[![CI](https://github.com/YanLogovskiy/mlops-docker-demo/actions/workflows/ci.yml/badge.svg?branch=main)](https://github.com/YanLogovskiy/mlops-docker-demo/actions)

## 📋 Table of Contents

- [Features](#-features)
- [Prerequisites](#-prerequisites)
- [Installation](#-installation)
- [Dependencies](#-dependencies)
- [Usage](#-usage)
- [Making Predictions](#-making-predictions)
- [Project Structure](#-project-structure)
- [Docker](#-docker)
- [Complete Workflow](#-complete-workflow)
- [Development](#-development)
- [Troubleshooting](#-troubleshooting)
- [Iris Dataset](#-iris-dataset)
- [Author](#-author)

## ✨ Features

- 🎯 **Simple ML Pipeline**: Train a logistic regression model on the Iris dataset
- 🐳 **Docker Support**: Containerized environment for consistent deployments
- 📦 **Modern Python Packaging**: Uses `pyproject.toml` for dependency management
- 🔧 **Development Tools**: Pre-configured with black, pytest, flake8, and mypy
- 📊 **Model Persistence**: Saves trained models using joblib

## 🔧 Prerequisites

- Python 3.12 or higher
- Docker (optional, for containerized deployment)
- [uv](https://github.com/astral-sh/uv) (recommended) or pip for package management

## 📦 Installation

### Using uv (Recommended)

```bash
# Clone the repository
git clone <repository-url>
cd mlops-docker-demo

# Install dependencies
uv sync
```

### Using pip

```bash
# Clone the repository
git clone <repository-url>
cd mlops-docker-demo

# Create virtual environment
python -m venv .venv
source .venv/bin/activate  

# Install dependencies
pip install -e .
```

### Development Dependencies

To install with development tools:

```bash
# Using uv
uv sync --extra dev

# Using pip
pip install -e ".[dev]"
```

## 📦 Dependencies

- `numpy>=1.21.0` - Numerical computing
- `pandas>=1.3.0` - Data manipulation
- `scikit-learn>=1.0.0` - Machine learning library
- `joblib` - Model serialization (installed with scikit-learn)

## 🚀 Usage

### Training the Model

Run the training script:

```bash
python train.py
```

This will:
1. Load the Iris dataset
2. Split the data into training and testing sets
3. Train a logistic regression model
4. Print the model accuracy
5. Save the trained model as `model.pkl`

### Expected Output

```
Accuracy: 0.98
```

The trained model will be saved as `model.pkl` in the project root directory.

## 🔮 Making Predictions

After training, you can use the model to make predictions:

```bash
# Use default sample data (setosa)
python predict.py

# Provide custom input (sepal_length, sepal_width, petal_length, petal_width)
python predict.py 5.1 3.5 1.4 0.2
```

### Example Output

```
Input: [5.1 3.5 1.4 0.2]
Prediction: setosa (class 0)
Probabilities: [0.98 0.02 0.  ]
```

## 📁 Project Structure

```
mlops-docker-demo/
├── README.md           # Project documentation
├── pyproject.toml      # Python project configuration
├── Dockerfile          # Docker container configuration
├── train.py            # Model training script
├── predict.py          # Model prediction script
├── model.pkl           # Trained model (generated)
├── .gitignore          # Git ignore rules
└── uv.lock             # Dependency lock file (if using uv)
```

## 🐳 Docker

The Dockerfile automatically:
1. Installs all dependencies using `uv`
2. Trains the model during the build process
3. Sets up the environment for predictions

### Build Docker Image

```bash
docker build -t mlops-docker-demo:latest .
```

### Run Container

```bash
# Run with default prediction
docker run --rm mlops-docker-demo:latest

# Run with custom input
docker run --rm mlops-docker-demo:latest python predict.py 6.5 3.0 5.2 2.0
```

### Dockerfile Details

The project includes a `Dockerfile` that uses the official `uv` Python image:
- Installs dependencies from `pyproject.toml` and `uv.lock`
- Trains the model during build
- Runs predictions by default when the container starts

## 🔄 Complete Workflow

1. **Train the model:**
   ```bash
   python train.py
   ```

2. **Make predictions:**
   ```bash
   python predict.py 5.1 3.5 1.4 0.2
   ```

3. **Or use Docker:**
   ```bash
   docker build -t mlops-docker-demo .
   docker run --rm mlops-docker-demo:latest
   ```

## 💻 Development

### Code Formatting

Format code with black:

```bash
black .
```

### Linting

Run flake8:

```bash
flake8 .
```

### Type Checking

Check types with mypy:

```bash
mypy .
```

### Testing

Run tests with pytest:

```bash
pytest
```

## ❓ Troubleshooting

### Model file not found
If you see `FileNotFoundError: model.pkl`, make sure to run `python train.py` first.

### Missing dependencies
Ensure all dependencies are installed:
```bash
uv sync
# or
pip install -e .
```

### Docker build issues
Make sure `uv.lock` is present and up to date:
```bash
uv lock
```

### Permission errors
If you encounter permission issues with Docker, ensure your user is in the docker group or use `sudo` (not recommended for production).

## 📊 Iris Dataset

The model is trained on the classic [Iris dataset](https://archive.ics.uci.edu/ml/datasets/iris) which contains:
- **3 classes**: setosa, versicolor, virginica
- **4 features**: sepal length, sepal width, petal length, petal width
- **150 samples**: 50 per class

This is one of the most famous datasets in machine learning and is perfect for demonstrating classification algorithms.

## 👤 Author

**Yan Logovskiy**

- Email: ylogovskiy@gmail.com
- GitHub: [@YanLogovskiy](https://github.com/yourusername)

