import os, shutil
from pathlib import Path

class CleanProject:
    
    def __init__(self):
        self.ROOT_DIR = Path.cwd()

    # Remove Screenshot folder
    def removeFolder(self):
        screenshotpath = self.ROOT_DIR / 'results'
        if os.path.exists(screenshotpath):
            shutil.rmtree(screenshotpath)
        os.mkdir(screenshotpath) 
        
clear = CleanProject()
clear.removeFolder()