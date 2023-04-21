import time

from assertpy import assert_that
from behave import *
from selenium.webdriver.common.by import By


@when(u'I click on PIM Menu')
def step_impl(context):
    context.driver.find_element(By.XPATH, "//*[normalize-space()='PIM']").click()


@when(u'I click on Add Employee')
def step_impl(context):
    context.driver.find_element(By.XPATH, "//*[normalize-space()='Add Employee']").click()


@when(u'I fill the employee records')
def step_impl(context):
    context.driver.find_element(By.NAME, "firstName").send_keys(context.table[0]["first_name"])
    context.driver.find_element(By.NAME, "middleName").send_keys(context.table[0]["middle_name"])
    context.driver.find_element(By.NAME, "lastName").send_keys(context.table[0]["last_name"])


@when(u'I click on save')
def step_impl(context):
    context.driver.find_element(By.XPATH, "//button[contains(normalize-space(),'Save')]").click()


@then(u'I should get profile name as "{text}"')
def step_impl(context, text):
    actual_profile_name = context.driver.find_element(By.XPATH, f"//h6[contains(normalize-space(),'{text}')]").text
    assert_that(actual_profile_name).contains(text)
