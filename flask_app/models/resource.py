from flask_app.config.mysqlconnection import connectToMySQL
from ..models import user
import os

class Resource:
    db = os.getenv('DATABASE_NAME')
    def __init__(self, data):
        self.id = data['id']
        self.name = data['name']
        self.link = data['link']
        self.description = data['description']
        self.country = data['country']
        self.is_active = data['is_active']
        self.created_at = data['created_at']
        self.updated_at = data['updated_at']
        self.type = data['type']
        self.category = data['category']
        self.user = user.user.get_by_id(data['user_id'])

    
    @classmethod
    def get_all(cls):
        query = "SELECT * FROM resources;"
        results = connectToMySQL(cls.db).query_db()
        resources = []
        for row in results:
            resources.append(cls(row))
        return resources

    @classmethod
    def get_one_by_id(cls, data):
        query = "SELECT * FROM resources WHERE id = %(id)s;"
        results = connectToMySQL(cls.db).query_db(query, data)
        return cls(results[0])

    @classmethod
    def create_resource(cls, data):
        query = "INSERT INTO resources (name, description, link, country, is_active, type, category;"
        return connectToMySQL(cls.db).query_db(query, data)

    @classmethod
    def update(cls, data):
        query = "UPDATE resources SET name = %(name)s, description = %(description)s, link= %(link)s, country= %(country)s, is_active= %(is_active)s, type= %(type)s , category= %(category)s WHERE id = %(id)s;"
        return connectToMySQL(cls.db).query_db(query, data)

    @classmethod
    def destroy(cls, data):
        query = "DELETE FROM resources WHERE id = %(id)s"
        return connectToMySQL(cls.db).query_db(query, data)