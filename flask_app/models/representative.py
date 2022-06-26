from flask_app.config.mysqlconnection import connectToMySQL
from ..models import user
import os

class Representative:
    def __init__(self, data):
        self.name = data['name']
        if 'photoUrl' not in data:
            self.url_photo = None
        else:
            self.url_photo = data['photoUrl']
        self.phones = data['phones']
        self.party = data['party']
        self.address = data['address']
        self.urls = data['urls']
        
