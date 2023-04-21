import time

from selenium import webdriver
from selenium.webdriver.common.by import By
from selenium.webdriver.support import expected_conditions
from selenium.webdriver.support.select import Select
from selenium.webdriver.support.wait import WebDriverWait


driver=webdriver.Chrome()
# driver.maximize_window()
driver.implicitly_wait(10)
driver.get("https://www.google.com")


actions=webdriver.ActionChains(driver)
actions.key_down(webdriver.Keys.SHIFT).send_keys("hello").key_up(webdriver.Keys.SHIFT)\
    .pause(1).send_keys(webdriver.Keys.ARROW_DOWN).send_keys(webdriver.Keys.ARROW_DOWN)\
    .send_keys(webdriver.Keys.ARROW_DOWN)\
    .send_keys(webdriver.Keys.ENTER).perform()


time.sleep(5)