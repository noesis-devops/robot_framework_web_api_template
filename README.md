# Robot Framework

## Configuration

Clone the repository:

```Shell
git clone <LINK>
```

Install all the dependencies:

```Shell
pip install -r .\requirements.txt 
```

## Run Test Cases Locally

### WEB Tests

To run the rest locally you need to access the "setup_keyword.resource" file, and user "LOCALLY" block of code.

To execute run.cmd file
```Shell
$ start .\run.cmd
```

To run tests folder
```Shell
python -m robot --outputdir .\results  .\tests 
```

To run scenarios by tag
```Shell
python -m robot --outputdir .\results -i <TAG> .\tests 
```

Execution with listeners
```Shell
robot -d .\results\ --listener .\listener\listener.py .\tests\e2e\test_1.robot
```

Parallel Execution
```Shell
pabot --testlevelsplit --processes 2  --outputdir .\results  .\tests
```

### API Tests

To run tests folder
```Shell
python -m robot --outputdir .\api_results  .\tests_api\ 
```

## Import Results in Jira/XRay

This framework allows you to upload the execution report and evidences to Jira/Xray. 

For this, you need to run the following file to import "output.xml" file:
```Shell
python .\utils\importResults.py <JIRA_TEST_PLAN_E2E>
```
The <JIRA_TEST_PLAN_E2E> key represent the test plan that was created for this execution. (e.x: ESOW-169)


## Integration of ROBOT FRAMEWORK with GRAFANA Dashboards

### Pre-Requisites

1. MySQLClient

Install the MySQLClient from the following repo:

<https://github.com/PyMySQL/mysqlclient?tab=readme-ov-file>

- Also, you need to install MariaDB Connector: <https://mariadb.com/downloads/connectors/>
  
  Note: Add the following paths to the environment variables:![alt text](image.png)

Finally, run the command:

```Shell
SET MYSQL_CONFIG="C:\Program Files\MariaDB\MariaDB Connector C 64-bit\bin\mysql_config.exe"

python setup.py build_ext --library-dirs="C:\Program Files\MariaDB\MariaDB Connector C 64-bit\lib" --include-dirs="C:\Program Files\MariaDB\MariaDB Connector C 64-bit\include"
```

2. Install DbBot-SQLAlchemy (from our repository):
<https://github.com/noesis-devops/DbBot-SQLAlchemy>

```Shell
python setup.py install
```

### Execution

After test execution, you just need to import the output.xml file with the following command:

```Shell
python -m dbbot.run -b mysql://<username>:<password>@<url>:<ip>/<database> -k .\output_xml_path\output.xml
```

## Helpful Links

- https://robotframework.org/robotframework/latest/RobotFrameworkUserGuide.html
- https://docs.robotframework.org/docs/parallel
- https://cognitiveqe.com/robot-framework-grafana-dashboard/