python .\utils\cleanProject.py
python -m robot -d .\results  .\tests\e2e
python .\utils\importResults.py <JIRA_TEST_PLAN_E2E>
python -m robot -d .\api_results  .\tests\api
python .\utils\importResultsAPI.py <JIRA_TEST_PLAN_API>
cmd /k