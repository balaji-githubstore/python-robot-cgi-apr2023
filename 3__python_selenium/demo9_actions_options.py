import time

from selenium import webdriver
from selenium.webdriver.common.by import By
from selenium.webdriver.support import expected_conditions
from selenium.webdriver.support.select import Select
from selenium.webdriver.support.wait import WebDriverWait

opt=webdriver.ChromeOptions()
opt.add_argument("start-maximized")
opt.add_argument("--disable-notifications")
opt.add_argument("--headless")
driver=webdriver.Chrome(options=opt)
# driver.maximize_window()
driver.implicitly_wait(10)
driver.get("https://www.redbus.com/")


# presnet and visible
driver.find_element(By.ID,"src").send_keys("koyam")

actions=webdriver.ActionChains(driver)
actions.pause(1).send_keys(webdriver.Keys.ENTER).perform()

driver.find_element(By.ID,"dest").send_keys("madi")

actions=webdriver.ActionChains(driver)
actions.pause(1).send_keys(webdriver.Keys.ENTER).perform()

print(driver.title)
time.sleep(5)