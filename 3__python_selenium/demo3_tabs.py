import time

from selenium import webdriver
from selenium.webdriver.common.by import By
from selenium.webdriver.support.select import Select

driver=webdriver.Chrome()
driver.maximize_window()
driver.implicitly_wait(10)
driver.get("https://www.db4free.net/")

driver.find_element(By.PARTIAL_LINK_TEXT,"phpMyAd").click()

print(driver.window_handles)

#1st tab session id
print(driver.window_handles[0])

#2nd tab session id
print(driver.window_handles[1])

#switch to 2nd tab
driver.switch_to.window(driver.window_handles[1])

driver.find_element(By.ID,"input_username").send_keys("hello")