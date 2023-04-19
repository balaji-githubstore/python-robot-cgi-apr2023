
from selenium import webdriver
from selenium.webdriver.common.by import By

driver=webdriver.Chrome()
driver.maximize_window()
driver.implicitly_wait(10)
driver.get("https://www.salesforce.com/in/form/signup/freetrial-sales/")
#enter firstname as john
#enter lastname as john
#select job title as IT manager
#click on checkbox
#submit