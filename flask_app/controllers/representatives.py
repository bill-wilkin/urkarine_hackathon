from flask_app import app
from flask import render_template, redirect, session, request, flash

from flask_app.models.representative import Representative
from ..models import user, resource
import requests
import os
from dotenv import load_dotenv
import json
load_dotenv()
# proof of concept for contacting reps


@app.route('/search')
def index():
    return render_template("search.html")


@app.route("/representatives/search", methods=["POST"])
def rep_search():
    key = os.getenv("API_KEY")
    # TODO: once registration is up, uncomment 23 and 25
    # temp = session['user_id']
    session.clear()
    # session['user_id'] = temp
    response = requests.get(
        f"https://civicinfo.googleapis.com/civicinfo/v2/representatives?address={request.form['zip']}&levels=country&roles=legislatorLowerBody&roles=legislatorUpperBody&key={key}")
    print(response.status_code)
    if str(response.status_code)[0] == '4' or str(response.status_code)[0] == '5':
        return redirect("/search")
    officials = response.json()['officials']
    print(officials)
    if len(officials) < 3:
        session['sen_one'] = officials[0]
        session['sen_two'] = officials[1]
    
    if len(officials) == 3:
        session['sen_one'] = officials[0]
        session['sen_two'] = officials[1]
        session['house'] = officials[2]

    return redirect("/contact")


@app.route("/contact")
def contact_reps():
    
    sen_one = Representative(session['sen_one'])
    sen_two = Representative(session['sen_two'])
    all_officials = [sen_one, sen_two]
    if "house" in session:
        house = Representative(session['house'])
        all_officials.append(house)
    

    return render_template("contact.html", officials=all_officials)
