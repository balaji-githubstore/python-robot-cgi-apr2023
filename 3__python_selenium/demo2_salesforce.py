import time

from selenium import webdriver
from selenium.webdriver.common.by import By
from selenium.webdriver.support.select import Select

driver=webdriver.Chrome()
driver.maximize_window()
driver.implicitly_wait(10)
driver.get("https://www.salesforce.com/in/form/signup/freetrial-sales/")
#complete below task quickly
#enter firstname as john
driver.find_element(By.NAME,"UserFirstName").send_keys("john")
#enter lastname as john
driver.find_element(By.XPATH,"//input[contains(@id,'UserLastName')]").send_keys("wick")
#select job title as IT manager  - I will do it
select_job_title=Select(driver.find_element(By.NAME,"UserTitle"))
select_job_title.select_by_visible_text("IT Manager")

#click on checkbox
driver.find_element(By.XPATH,"//div[@class='checkbox-ui']").click()

#submit
driver.find_element(By.NAME,"start my free trial").click()

time.sleep(5)