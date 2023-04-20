import pytest
from selenium import webdriver
from assertpy import assert_that
from selenium.webdriver.common.by import By
from base.automation_wrapper import WebDriverListener


class TestLogin(WebDriverListener):
    def test_invalid_login(self):
        self.driver.find_element(By.NAME, "username").send_keys("john")
        self.driver.find_element(By.NAME, "password").send_keys("john123")
        self.driver.find_element(By.XPATH, "//button[normalize-space()='Login']").click()
        actual_error = self.driver.find_element(By.XPATH, "//p[contains(normalize-space(),'Invalid')]").text
        assert_that("Invalid credentials").is_equal_to(actual_error)


class TestLoginUI(WebDriverListener):
    def test_title(self):
        assert_that("OrangeHRM").is_equal_to(self.driver.title)

    def test_placeholder(self):
        actual_username_placeholder = self.driver.find_element(By.NAME, "username").get_attribute("placeholder")
        actual_password_placeholder = self.driver.find_element(By.NAME, "password").get_attribute("placeholder")
        assert_that("Username").is_equal_to(actual_username_placeholder)
        assert_that("Password").is_equal_to(actual_password_placeholder)

    def test_header(self):
        actual_header = self.driver.find_element(By.XPATH, "//h5").text
        assert_that(actual_header).contains("Login")
