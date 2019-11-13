require 'test_helper'

class ApplicatioControllerTest < ActionDispatch::IntegrationTest

    test "test creation" do
        get cookie_created_path
        assert is_cookie_created?
        #assert tempplate 
    end

    test "test creation and deletion of cookies" do
        get cookie_created_path
        assert is_cookie_created?
        #assert template
        delete cookie_deleted_path
        assert_not is_cookie_created?
        #assert template
    end
end