python -m venv Django_venv
Django_venv\Scripts\activate
curl https://bootstrap.pypa.io/get-pip.py -o get-pip.py
python get-pip.py
python -m pip install --upgrade pip
pip install --upgrade pip setuptools wheel
pip install -r requirements.txt