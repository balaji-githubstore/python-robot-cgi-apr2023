from assertpy import assert_that
from behave import *
from selenium import webdriver
from selenium.webdriver.common.by import By


@given(u'I have browser with orange hrm application')
def step_impl(context):
    context.driver = webdriver.Chrome()
    context.driver.maximize_window()
    context.driver.implicitly_wait(10)
    context.driver.get("https://opensource-demo.orangehrmlive.com/")


@when(u'I enter username as "{username}"')
def step_impl(context, username):
    context.driver.find_element(By.NAME, "username").send_keys(username)


@when(u'I enter password as "{text}"')
def step_impl(context, text):
    context.driver.find_element(By.NAME, "password").send_keys(text)


@when(u'I click on login')
def step_impl(context):
    context.driver.find_element(By.XPATH, "//button[normalize-space()='Login']").click()


@then(u'I want to access dashboard page with header "{text}"')
def step_impl(context, text):
    actual_data = context.driver.find_element(By.XPATH, "//*[contains(normalize-space(),'Dashbo')]").text
    assert_that(actual_data).contains(text)


@then(u'I should not get access to dashboard page with error "{text}"')
def step_impl(context, text):
    actual_error = context.driver.find_element(By.XPATH, "//p[contains(normalize-space(),'Invalid')]").text
    assert_that(text).is_equal_to(actual_error)
