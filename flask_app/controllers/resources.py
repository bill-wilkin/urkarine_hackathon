from operator import ne
from flask_app import app
from flask import render_template, redirect, session, request, flash

from flask_app.models.representative import Representative
from ..models import user, resource
from flask_app.models import user, resource

import requests
import os
from dotenv import load_dotenv
import json
load_dotenv()

# renders page for all rources


@app.route('/')
def redirect_main():
    return redirect('/resources')


@app.route('/resources')
def all_resources():

    return render_template("resources.html", all_resources = resource.Resource.get_all(), all_categories = resource.Resource.get_categories())

# renders page for adding a new resource


@app.route('/resources/new')
def new_resources():
    return render_template("new_resource.html")


# creates a new resource
@app.route("/resources/create", methods=["POST"])
def create_resource():
    # check to see if the user is in the database
    existing_users = user.User.get_by_email({'email':request.form['email']})
    if existing_users:
        new_user_id = existing_users.id
    else:
        new_user_id = user.User.create_user(request.form)
    if not user.User.validate_user(request.form):
      return redirect('/resource')

    data = request.form.to_dict()
    print(data)
    data['user_id'] = new_user_id
    resource.Resource.create_resource(data)
    
    user.User.update_preference({"wants_updates": request.form['wants_updates'], "id":new_user_id})

    return redirect("/resources")


# reneders edit page
@app.route('/resources/<resource_id>/edit')
def edit_resource(resource_id):

    return render_template("edit_resource.html", user=user.user.get_by_id({"id": session['user_id']}), resource=resource.resource.get_by_id({"id": resource_id}))


# updates resource
@app.route('/resources/update')
def update_resource(resource_id):

    user = user.user.get_by_id({"id": session['user_id']})
    resource = resource.resource.get_by_id({"id": resource_id})
    if user.id != resource.user.id:
        return redirect("/")

    resource.Resource.update({"id": resource_id})
    return redirect(f"resources/{resource_id}/edit")

# deletes a resource


@app.route('/resources/<resource_id>/destroy')
def destroy_resource(resource_id):
    user = user.user.get_by_id({"id": session['user_id']})
    resource = resource.resource.get_by_id({"id": resource_id})
    if user.id != resource.user.id or user.id != 1:
        return redirect("/")
    resource.Resource.destroy({"id": resource_id})
    return redirect(f"resources/")

@app.route('/filter/<string:category>')
def filter_cat(category):
   
    return render_template("resources.html", all_resources = resource.Resource.get_by_cat({"category": category}), all_categories = resource.Resource.get_categories())