from flask import Flask
from flask_wtf.csrf import CSRFProtect
from dotenv import load_dotenv
import os
load_dotenv()

app = Flask(__name__)

app.secret_key = os.getenv('SECRET_KEY')
csrf = CSRFProtect(app)
