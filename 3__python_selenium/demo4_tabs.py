import time

from selenium import webdriver
from selenium.webdriver.common.by import By
from selenium.webdriver.support.select import Select

driver=webdriver.Chrome()
driver.maximize_window()
driver.implicitly_wait(10)
driver.get("https://www.online.citibank.co.in/")

driver.find_element(By.XPATH,"//a[@class='newclose']").click()
driver.find_element(By.XPATH,"//a[@class='newclose2']").click()
driver.find_element(By.PARTIAL_LINK_TEXT,"APPLY").click()
driver.find_element(By.PARTIAL_LINK_TEXT,"Login").click()

print(driver.window_handles)

for win in driver.window_handles:
    print(win)
    driver.switch_to.window(win)
    print(driver.title)
    if driver.title=="Citibank India":
        break
    print(100*"*")


print(driver.current_url)
driver.find_element(By.XPATH,"//*[contains(text(),'Forgot User')]").click()