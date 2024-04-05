from flask import Flask,render_template
from public import public
from admin import admin
from hospital import hospital
# from doctor import doctor

from api import api



app=Flask(__name__)
app.secret_key='alex'



@app.errorhandler(404)
def not_found(e):
  return render_template("404.html")

app.register_blueprint(public)
app.register_blueprint(admin,url_prefix='/admin')
app.register_blueprint(hospital,url_prefix='/hospital')

app.register_blueprint(api,url_prefix='/api')
app.run(debug=True,port=5885,host="0.0.0.0")
# app.run(debug=True,port=5017,host="192.168.33.57")