echo [$(date)]: "START"
echo [$(date)]: "creating conda env with python 3.8 version" 
conda create -n env python==3.8 -y
echo [$(date)]: "activating the environment" 
conda activate env
echo [$(date)]: "installing the requirements" 
pip install -r requirements_dev.txt
echo [$(date)]: "END" 