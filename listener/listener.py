ROBOT_LISTENER_API_VERSION = 3

def end_test(data, result):
    if not result.passed:
        print("*********** ERROR: *************")
        print('Test "%s" failed: %s' % (result.name, result.message))
        # input('Press enter to continue.')
        print("*******************************")

def end_keyword(name, attrs):
        print(name)
        pass

# https://robotframework.org/robotframework/latest/RobotFrameworkUserGuide.html#listener-version-3