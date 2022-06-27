from flask import flash
from flask_app.config.mysqlconnection import connectToMySQL
import re
from flask_app.models.representative import Representative
from flask_app.models.resource import Resource
EMAIL_REGEX = re.compile(r'^[a-zA-Z0-9.+_-]+@[a-zA-Z0-9._-]+\.[a-zA-Z]+$')
import os

class User: 
  db = os.getenv('DATABASE_NAME')
  def __init__(self,data):
    self.id = data['id']
    self.username = data['username']
    self.email = data['email']
    self.created_at = data['created_at']
    self.updated_at = data['updated_at']
    self.wants_updates = data['wants_updates']
    
    @classmethod
    def save(cls,data):
      query = 'INSERT INTO user (username, email, wants_updates) VALUES (%(username)s, %(email)s, %(wants_updates)s);'
      return connectToMySQL(cls.db).query_db(query,data)

    @classmethod
    def get_one(cls, data):
      query = "SELECT * FROM user WHERE id = %(id)s;"
      results = connectToMySQL(cls.db).query_db(query, data)
      if len(results) < 1:
          return False
      return cls(results[0])
    
    @staticmethod
    def validate(user):
      is_valid = True
      query = 'SELECT * FROM user WHERE email = %(email)s;'
      results = connectToMySQL(User.db).query_db(query, user)
      if not EMAIL_REGEX.match(user['email']):
        flash("Invalid Email format")
        is_valid = False
      if len(user['username']) < 2:
        flash("Username needs at least 2 characters")
        is_valid = False
      return is_valid