import time

import pytest
from selenium import webdriver
from selenium.webdriver.common.by import By
from assertpy import assert_that

#example for @pytest.fixture(scope="function", autouse=True)
class TestUpload:
    @pytest.fixture(scope="function", autouse=True)
    def setup(self):
        #runs before every test method
        self.driver = webdriver.Chrome()
        self.driver.maximize_window()
        self.driver.implicitly_wait(10)
        self.driver.get("https://www.ilovepdf.com/pdf_to_word")
        yield
        #runs after every test method
        self.driver.quit()

    def test_invalid_file_upload(self):
        self.driver.find_element(By.XPATH, "//input[@type='file']").send_keys(r"C:\Mine\iFuture.txt")
        actual_error = self.driver.find_element(By.XPATH, "//div[@class='toast toast-error']").text
        assert_that(actual_error).contains("Upload error")

    def test_valid_file_upload(self):
        self.driver.find_element(By.XPATH, "//input[@type='file']").send_keys(r"C:\Mine\Balaji-Profile_2023_1.pdf")
        actual_file_name = self.driver.find_element(By.XPATH, "//span[@class='file__info__name']").text
        assert_that(actual_file_name).contains("Balaji")
        assert_that(actual_file_name).contains("pdf")
