import time

from selenium import webdriver
from selenium.webdriver.common.by import By

driver=webdriver.Chrome()
driver.maximize_window()
driver.implicitly_wait(10)
driver.get("https://www.facebook.com/")

driver.find_element(By.ID,"email").send_keys("hello123456@gmail.com")
driver.find_element(By.ID,"pass").send_keys("hello123")
driver.find_element(By.NAME,"login").click()

time.sleep(5)