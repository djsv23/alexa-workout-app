#!flask/bin/python
from flask import Flask, send_from_directory
from flask_ask import Ask, statement, question, session
import json
import requests
import time
import unidecode
import os
import logging
import sqlite3
from sqlite3 import Error


app = Flask(__name__)
ask = Ask(app, "/workout_tracker")

db_location = os.path.join(app.root_path, 'workout_app.db')

@app.route('/favicon.ico')
def favicon():
	return send_from_directory(os.path.join(app.root_path, 'static'), 'favicon.ico',mimetype='image/vnd.microsoft.icon')

@app.route('/')
def index():
	return "Hello, World"

@ask.intent("PostWorkoutIntent")
def log_workout(user, workoutType, duration):
	#do some stuff
	success_msg = 'Thank you for logging a zebra workout'

@ask.launch
def launched():
    logging.info('Launch request received from Alexa')
    print('Launch request received from Alexa')
    return statement('Welcome to the Zebra workout skill')

def create_connection(db_file):
	try:
		conn = sqlite3.connect(db_file)
		print(sqlite3.version)
	except Error as e:
		print(e)
	finally:
		conn.close()

if __name__ == '__main__':
	create_connection(db_location)
	app.run(debug=True, host='0.0.0.0', port='5000')
