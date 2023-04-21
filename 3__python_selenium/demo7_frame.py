import time

from selenium import webdriver
from selenium.webdriver.common.by import By
from selenium.webdriver.support import expected_conditions
from selenium.webdriver.support.select import Select
from selenium.webdriver.support.wait import WebDriverWait

driver=webdriver.Chrome()
driver.maximize_window()
driver.implicitly_wait(10)
driver.get("https://netbanking.hdfcbank.com/netbanking/")

driver.switch_to.frame(driver.find_element(By.XPATH,"//frame[contains(@src,'RSNBLogin')]"))
driver.find_element(By.NAME,"fldLoginUserId").send_keys("test123")
driver.find_element(By.LINK_TEXT,"CONTINUE").click()
driver.switch_to.default_content()
