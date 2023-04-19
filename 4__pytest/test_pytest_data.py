import pytest


class TestLogin1:
    @pytest.mark.parametrize("username,password", [
        ["john", "john123"],
        ["peter", "peter123"]
    ])
    def test_invalid_login(self, username, password):
        print("validating login " + username + password)

