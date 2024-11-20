from re import S
from xrayComn import xrayComn
import sys,argparse
import requests
import json
import datetime
from pathlib import Path


#Root directory path object
cwd = Path.cwd()
#Files path
reportPath = cwd / 'api_results/output.xml'
execInfoPath =  cwd / 'infoAPI.json'
# editable information to populate infoAPI.json
current_date = datetime.datetime.now()
dt_string = current_date.strftime("%d/%m/%Y %H:%M:%S")
testPlan = sys.argv[1]
# testPlan = 'ESOW-149'


class importResults(xrayComn):
    
    def __init__(self):
        super().__init__()

    #Upload pytest cucumber report to a new test execution. To create new Test Execution, the associated Test Plan has to be defined in infoAPI.json.
    def reportNewExec(self, reportPath, execInfoPath, token):
        # curl -H "Content-Type: multipart/form-data" -X POST -F info=@issueFields.json -F results=@results.json -H "Authorization: Bearer $token" 
        # https://xray.cloud.getxray.app/api/v2/import/execution/cucumber/multipart
        
        #Prepare info.json content
        with open('infoAPI.json','r') as oldJson:
            data = json.load(oldJson)
        #Change necessary information on infoAPI.json     
        data['fields']['summary'] =  f"Robot Framework API Test Execution on {dt_string}"
        data['fields']['description'] =  f"{testPlan}"
        data['xrayFields']['testPlanKey'] =  f"{testPlan}"
        
        with open('infoAPI.json', 'w') as newJson:
            json.dump(data, newJson)
        
        info_content = open(execInfoPath, "rb")
        report_content = open(reportPath, "rb")
        files = [('info', (str(execInfoPath), info_content, 'json')), ('results', (str(reportPath), report_content, 'json'))]
        headers = {'Authorization': f'Bearer {token}'}
        response = requests.post(f'{self.xray_cloud_url}/import/execution/robot/multipart', verify=False, headers=headers, files=files)
        response.raise_for_status
    
        jsonResp = json.loads(response.content)
        print(jsonResp)
        print(f"Execution Tag = {jsonResp['key']} \nExecution ID = {jsonResp['id']}")
        
        return jsonResp['id']
        
token = xrayComn()
cresults =  importResults()

authToken = token.xray_getToken()          
execID = cresults.reportNewExec(reportPath,execInfoPath,authToken)