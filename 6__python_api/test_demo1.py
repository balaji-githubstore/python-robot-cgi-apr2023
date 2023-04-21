import requests
from assertpy import assert_that
import read_utils


class TestPetShop:
    END_POINT = "https://petstore.swagger.io/v2"

    def test_get_valid_pet_by_id(self):
        id = 5
        resource = f"/pet/{id}"
        response = requests.get(TestPetShop.END_POINT + resource)
        print(response)
        print(response.status_code)
        print(response.json())
        assert_that(200).is_equal_to(response.status_code)
        assert_that(id).is_equal_to(response.json()['id'])

    def test_add_valid_pet(self):
        resource = f"/pet"
        json_body = read_utils.get_json_from_file("../test_data/new_pet.json")

        h_dic = {"Content-Type": "application/json", "Connection": "keep-alive"}
        response = requests.post(TestPetShop.END_POINT + resource, headers=h_dic, json=json_body)
        print(response.status_code)
        print(response.json())
        assert_that(200).is_equal_to(response.status_code)
        assert_that(657).is_equal_to(response.json()['id'])

    def test_update_valid_pet(self):
        resource = f"/pet"
        json_body = read_utils.get_json_from_file("../test_data/update_pet.json")

        h_dic = {"Content-Type": "application/json", "Connection": "keep-alive"}
        response = requests.put(TestPetShop.END_POINT + resource, headers=h_dic, json=json_body)
        print(response.status_code)
        print(response.json())
        assert_that(200).is_equal_to(response.status_code)
        assert_that(656).is_equal_to(response.json()['id'])

    def test_delete_invalid_pet(self):
        id=568
        resource=f"/pet/{id}"
        h_dic = {"Content-Type": "application/json", "api_key": "78277QWE"}
        response=requests.delete(TestPetShop.END_POINT+resource,headers=h_dic)
        # print(response.json())
        assert_that(404).is_equal_to(response.status_code)
