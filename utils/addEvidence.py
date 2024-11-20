from xrayComn import xrayComn
import os, glob,time
import requests
import json
import base64
from dotenv import load_dotenv
#archive zip
import shutil
from pathlib import Path
from requests.auth import HTTPBasicAuth

load_dotenv()

class addEvidence(xrayComn):
    
    def __init__(self):
        super().__init__()
        

    #Upload zip folder to Jira Issue
    def jira_import_zip_folder_as_attachment(self, screenshot_path, testExecId):
        # curl -D- -u admin:admin -X POST -H "X-Atlassian-Token: no-check" -F "file=@myfile.txt" http://myhost/rest/api/2/issue/TEST-123/attachments
        # https://docs.atlassian.com/software/jira/docs/api/REST/7.6.1/#api/2/issue/{issueIdOrKey}/attachments-addAttachment

        shutil.make_archive(screenshot_path, 'zip', screenshot_path)


        files=[('file',('screenshots.zip',open(f'{screenshot_path}.zip','rb'),'application/zip'))]
        headers = {'X-Atlassian-Token': 'no-check'}
        response = requests.post(f'{self.jira_url}/issue/{testExecId}/attachments', auth=HTTPBasicAuth(self.jira_user, self.jira_token), headers=headers, files=files)
        response.raise_for_status

        jsonResp = json.loads(response.content)
        print(jsonResp)
