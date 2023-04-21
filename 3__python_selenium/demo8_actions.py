import time

from selenium import webdriver
from selenium.webdriver.common.by import By
from selenium.webdriver.support import expected_conditions
from selenium.webdriver.support.select import Select
from selenium.webdriver.support.wait import WebDriverWait

driver=webdriver.Chrome()
driver.maximize_window()
driver.implicitly_wait(10)
driver.get("https://nasscom.in/about-us/contact-us")

actions=webdriver.ActionChains(driver)
actions.move_to_element(driver.find_element(By.XPATH,"//a[text()='Membership']")).perform()

# presnet and visible
driver.find_element(By.XPATH,"//a[text()='Members Listing']").click()