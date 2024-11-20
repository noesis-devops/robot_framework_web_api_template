import os
import requests
import json
from dotenv import load_dotenv

load_dotenv()

class xrayComn:

    def __init__(self):
        self.xray_cloud_url = os.getenv('XRAY_HOST')
        self.client_id = os.getenv('XRAY_CLIENT_ID')
        self.client_secret = os.getenv('XRAY_CLIENT_SECRET')
        self.jira_url = os.getenv('JIRA_HOST')
        self.jira_user = os.getenv('JIRA_USER')
        self.jira_token = os.getenv('JIRA_TOKEN')
    
    # generate API token
    def xray_getToken(self):
        # endpoint doc for authenticating and obtaining token from Xray Cloud: 
        # https://docs.getxray.app/display/XRAYCLOUD/Authentication+-+REST+v2
        headers = {'Content-type': 'application/json', 'Accept': 'text/plain'}
        auth_data = {"client_id": self.client_id, "client_secret": self.client_secret}
        response = requests.post(f"{self.xray_cloud_url}/authenticate", data=json.dumps(auth_data), headers=headers, verify=False)
        auth_token = response.json()

        if response.status_code == 200:
            print('Authorization Granted!')
        else:
            print('Authorization Denied! Bad token request!')
        
        return auth_token
