from flask import Flask, jsonify, request, json;
import numpy as np
import pandas as pd
import pickle

app = Flask(__name__)

#route for predecting whether the user has diabetes or not 
@app.route('/diabetes', methods=['POST'])
def predict_diabetes():
    #openeing and leading the model using pickle
    with open('Diabetes_model.pkl', 'rb') as file:
        md = pickle.load(file)

        #parsing the data as json and then storing the values(2d)
        report_values = [request.get_json()['values']] 
        print(report_values)
        #predicting the outcome
        outcome = md.predict(report_values)

        #returning the result in json form (from dictionary format)
        return jsonify({'outcome': outcome.tolist()[0]})
    
@app.route('/heartDieases/', methods=['POST'])
def predict_heartDieases():
    #openeing and leading the model using pickle
    with open('heart_disease.pkl', 'rb') as file:
        md = pickle.load(file)

        #parsing the data as json and then storing the values(2d)
        report_values = [request.get_json()['values']]

        #predicting the outcome 
        outcome = md.predict(report_values)

        #returning the result in json form (from dictionary format)
        return jsonify({'outcome': outcome.tolist()[0]})
    
@app.route('/parkinson/', methods=['POST'])
def predict_parkinson():
    #openeing and leading the model using pickle
    with open('parkinson_disease.pkl', 'rb') as file:
        md = pickle.load(file)

        #parsing the data as json and then storing the values(2d)
        report_values = [request.get_json()['values']]

        #predicting the outcome
        outcome = md.predict(report_values)

        #returning the result in json form (from ndarray format)
        return jsonify({'outcome': outcome.tolist()[0]})
if __name__ == '__main__':
    app.run(debug=True)