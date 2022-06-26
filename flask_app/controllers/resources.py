from flask_app import app
from flask import render_template, redirect, session, request, flash

from flask_app.models.representative import Representative
from ..models import user, resource
import requests
import os 
from dotenv import load_dotenv
import json
load_dotenv()

# renders page for all rources
@app.route('/resources')
def all_resources():
    return render_template("<<Insert html title here>>")

# renders page for adding a new rource
@app.route('/resources/new')
def new_resources():
    if "user_id" not in session:
        return redirect("/")
    return render_template("<<Insert html title here>>")


# creates a new resource
@app.route("/resources/create", methods = ["POST"])
def create_resource():
    if "user_id" not in session:
        return redirect("/")
    # TODO: add validations
    resource.Resource.create_resource(request.form)

    return redirect("/resources")


# reneders edit page
@app.route('/resouces/<resource_id>/edit')
def edit_resource(resource_id):
    if "user_id" not in session:
        return redirect("/")
    return render_template("<<Insert html title here>>", user = user.user.get_by_id({"id":session['user_id']}), resource = resource.resource.get_by_id({"id":resource_id}))


# updates resource
@app.route('/resouces/<resource_id>/update')
def update_resource(resource_id):
    if "user_id" not in session:
        return redirect("/")
    user = user.user.get_by_id({"id":session['user_id']})
    resource = resource.resource.get_by_id({"id":resource_id})
    if user.id != resource.user.id:
        return redirect("/")

    resource.Resource.update({"id":resource_id})
    return redirect(f"resources/{resource_id}/edit")

# deletes a resource
@app.route('/resouces/<resource_id>/destroy')
def destroy_resource(resource_id):
    user = user.user.get_by_id({"id":session['user_id']})
    resource = resource.resource.get_by_id({"id":resource_id})
    if user.id != resource.user.id or user.id != 1:
        return redirect("/")
    resource.Resource.destroy({"id":resource_id})
    return redirect(f"resources/")


