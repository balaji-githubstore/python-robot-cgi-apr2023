import time

import pytest
from selenium import webdriver
from selenium.webdriver.common.by import By
from assertpy import assert_that


@pytest.fixture(scope="function", autouse=True)
def setup():
    print("before test method")
    yield
    print("after test method")


def test_invalid_file_upload():
    driver = webdriver.Chrome()
    driver.maximize_window()
    driver.implicitly_wait(10)
    driver.get("https://www.ilovepdf.com/pdf_to_word")
    driver.find_element(By.XPATH, "//input[@type='file']").send_keys(r"C:\Mine\iFuture.txt")
    actual_error = driver.find_element(By.XPATH, "//div[@class='toast toast-error']").text
    # print(actual_error)
    # assert "Upload error" in actual_error
    assert_that(actual_error).contains("Upload error")
    driver.quit()


def test_valid_file_upload():
    driver = webdriver.Chrome()
    driver.maximize_window()
    driver.implicitly_wait(10)
    driver.get("https://www.ilovepdf.com/pdf_to_word")
    driver.find_element(By.XPATH, "//input[@type='file']").send_keys(r"C:\Mine\Balaji-Profile_2023_1.pdf")
    actual_file_name = driver.find_element(By.XPATH, "//span[@class='file__info__name']").text
    assert_that(actual_file_name).contains("Balaji")
    assert_that(actual_file_name).contains("pdf")
    time.sleep(10)
