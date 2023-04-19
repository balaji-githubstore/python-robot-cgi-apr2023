import pytest
from selenium import webdriver

#one per session
@pytest.fixture(scope="session", autouse=True)
def setup(request):
    print("before session")
    yield
    print("after session")


@pytest.fixture(scope="module", autouse=True)
def setup(request):
    print("before module")
    yield
    print("after module")


@pytest.fixture(scope="package")
def setup(request):
    print("before package")
    yield
    print("after package")


@pytest.fixture(scope="class")
def setup(request):
    # runs before each class
    driver = webdriver.Chrome()
    driver.maximize_window()
    driver.implicitly_wait(10)
    driver.get("https://www.ilovepdf.com/pdf_to_word")
    request.cls.driver = driver
    request.cls.my_name = "bala"
    yield
    # runs after each class
    driver.quit()
