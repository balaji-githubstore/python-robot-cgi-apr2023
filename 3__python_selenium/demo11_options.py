import time

from selenium import webdriver
from selenium.webdriver.common.by import By
from selenium.webdriver.support import expected_conditions
from selenium.webdriver.support.select import Select
from selenium.webdriver.support.wait import WebDriverWait

opt=webdriver.ChromeOptions()
opt.add_argument("start-maximized")
opt.add_argument("--disable-notifications")

opt.add_experimental_option("prefs",{"download.default_directory":r"C:\Mine\New folder"})

opt.add_experimental_option("mobileEmulation",{"deviceName":"Pixel 4"})
driver=webdriver.Chrome(options=opt)
# driver.maximize_window()
driver.implicitly_wait(10)
driver.get("https://www.selenium.dev/downloads/")

driver.find_element(By.PARTIAL_LINK_TEXT,"32").click()


time.sleep(10)
