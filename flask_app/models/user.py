import os
from flask import flash
from flask_app.config.mysqlconnection import connectToMySQL
import re
from flask_app.models.representative import Representative
from flask_app.models.resource import Resource
EMAIL_REGEX = re.compile(r'^[a-zA-Z0-9.+_-]+@[a-zA-Z0-9._-]+\.[a-zA-Z]+$')


class User:
    db = os.getenv('DATABASE_NAME')

    def __init__(self, data):
        self.id = data['id']
        self.first_name = data['first_name']
        self.last_name = data['last_name']
        self.email = data['email']
        self.created_at = data['created_at']
        self.updated_at = data['updated_at']
        self.wants_updates = data['wants_updates']

    @classmethod
    def create_user(cls, data):
        query = 'INSERT INTO users (first_name, last_name, email, wants_updates) VALUES (%(first_name)s, %(last_name)s, %(email)s, %(wants_updates)s);'
        return connectToMySQL(cls.db).query_db(query, data)

    @classmethod
    def get_one(cls, data):
        query = "SELECT * FROM users WHERE id = %(id)s;"
        results = connectToMySQL(cls.db).query_db(query, data)
        if len(results) < 1:
            return False
        return cls(results[0])

    @classmethod
    def get_by_email(cls, data):
        query = "SELECT * FROM users WHERE email = %(email)s;"
        results = connectToMySQL(cls.db).query_db(query, data)
        if len(results) > 0:
            return cls(results[0])
        return False

    @classmethod
    def update_preference(cls, data):
        query= "UPDATE users SET wants_updates= %(wants_updates)s WHERE id = %(id)s;"
        return connectToMySQL(cls.db).query_db(query, data)

    @staticmethod
    def validate_user(user):
        is_valid = True
        query = 'SELECT * FROM users WHERE email = %(email)s;'
        results = connectToMySQL(User.db).query_db(query, user)
        if not EMAIL_REGEX.match(user['email']):
            flash("Invalid Email format")
            is_valid = False
        if len(user['first_name']) < 2:
            flash("First name needs at least 2 characters")
            is_valid = False
        if len(user['last_name']) < 2:
            flash("Last name needs at least 2 characters")
            is_valid = False
        return is_valid
