# Use an official Python runtime as a parent image

FROM python:3.8-slim

# Set the working directory to /RuralLoadApprovalBackgroundVerificationProject
WORKDIR /RuralLoadApprovalBackgroundVerificationProject

# Copy only the necessary files into the container
COPY .github/workflows/.gitkeep .github/workflows/.gitkeep
COPY src/__init__.py src/__init__.py
COPY src/RuralLoanApprovalBackgroundVerification/__init__.py src/RuralLoanApprovalBackgroundVerification/__init__.py
COPY src/RuralLoanApprovalBackgroundVerification/components/__init__.py src/RuralLoanApprovalBackgroundVerification/components/__init__.py
COPY src/RuralLoanApprovalBackgroundVerification/components/data_ingestion.py src/RuralLoanApprovalBackgroundVerification/components/data_ingestion.py
COPY src/RuralLoanApprovalBackgroundVerification/components/data_transformation.py src/RuralLoanApprovalBackgroundVerification/components/data_transformation.py
COPY src/RuralLoanApprovalBackgroundVerification/components/model_trainer.py src/RuralLoanApprovalBackgroundVerification/components/model_trainer.py
COPY src/RuralLoanApprovalBackgroundVerification/components/model_evaluation.py src/RuralLoanApprovalBackgroundVerification/components/model_evaluation.py
COPY src/RuralLoanApprovalBackgroundVerification/pipelines/__init__.py src/RuralLoanApprovalBackgroundVerification/pipelines/__init__.py
COPY src/RuralLoanApprovalBackgroundVerification/pipelines/training_pipeline.py src/RuralLoanApprovalBackgroundVerification/pipelines/training_pipeline.py
COPY src/RuralLoanApprovalBackgroundVerification/pipelines/prediction_pipeline.py src/RuralLoanApprovalBackgroundVerification/pipelines/prediction_pipeline.py
COPY src/RuralLoanApprovalBackgroundVerification/logger.py src/RuralLoanApprovalBackgroundVerification/logger.py
COPY src/RuralLoanApprovalBackgroundVerification/exception.py src/RuralLoanApprovalBackgroundVerification/exception.py
COPY src/RuralLoanApprovalBackgroundVerification/utils/__init__.py src/RuralLoanApprovalBackgroundVerification/utils/__init__.py
COPY src/RuralLoanApprovalBackgroundVerification/utils/utils.py src/RuralLoanApprovalBackgroundVerification/utils/utils.py
COPY requirements.txt requirements.txt
# COPY setup.py setup.py
# COPY init_setup.sh init_setup.sh

# Copy the dataset to the /RuralLoadApprovalBackgroundVerificationProject/dataset directory in the container
COPY data/trainingData.csv src/RuralLoadApprovalBackgroundVerificationProject/dataset

# Install any needed packages specified in requirements.txt
RUN pip install --no-cache-dir -r requirements.txt

# Make port 80 available to the world outside this container
EXPOSE 80

# Define environment variable
ENV NAME PSK

# Run the training pipeline script with the provided dataset path when the container launches
CMD ["python", "src/RuralLoanApprovalBackgroundVerification/pipelines/training_pipeline.py", "--data", "/RuralLoadApprovalBackgroundVerificationProject/dataset/trainingData.csv"]
