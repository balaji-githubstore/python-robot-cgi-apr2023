import pytest
from selenium import webdriver
from selenium.webdriver.common.by import By
from assertpy import assert_that


class TestLogin:
    @pytest.fixture(scope="function", autouse=True)
    def setup(self):
        # runs before every test method
        self.driver = webdriver.Chrome()
        self.driver.maximize_window()
        self.driver.implicitly_wait(10)
        self.driver.get("https://demo.openemr.io/b/openemr")
        yield
        # runs after every test method
        self.driver.quit()

    # admin,pass,OpenEMR
    # accountant,accountant,OpenEMR
    # create list of list for above data and pass it in second argument
    @pytest.mark.parametrize("username,password,expected_title", [
        ["admin", "pass", "OpenEMR"],
        ["accountant", "accountant", "OpenEMR"],
        ["receptionist","receptionist","OpenEMR"]
    ])
    def test_valid_login(self, username, password, expected_title):
        self.driver.find_element(By.ID, "authUser").send_keys(username)
        self.driver.find_element(By.ID, "clearPass").send_keys(password)
        self.driver.find_element(By.CSS_SELECTOR, "#login-button").click()
        assert_that(expected_title).is_equal_to(self.driver.title)
