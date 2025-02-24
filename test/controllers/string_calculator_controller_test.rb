require "test_helper"

class StringCalculatorControllerTest < ActionDispatch::IntegrationTests
  test "should get index" do
    get "/"
    assert_response :success
  end

  test "should return 0 for empty input" do
    post "/add", params: { numbers: "" }
    assert_redirected_to "/result?result=0"
  end

  test "add returns the number for a single input" do
    post "/add", params: { numbers: "1" }
    assert_redirected_to "/result?result=1"
  end

  test "add returns the sum of two numbers" do
    post "/add", params: { numbers: "1,5" }
    assert_redirected_to "/result?result=6"
  end

  test "add handles new line delimiter" do
    post "/add", params: { numbers: "1\n2,3" }
    assert_redirected_to "/result?result=6"
  end

  test "add handles custom delimiter" do
    post "/add", params: { numbers: "//;\n1;2" }
    assert_redirected_to "/result?result=3"
  end

  test "add raises an exception for negative numbers" do
    post "/add", params: { numbers: "1,-2,3,-4" }
    uri = "/result?result=" + CGI.escape("Negative numbers not allowed: [-2, -4]")
    assert_redirected_to uri
  end

  test "should get result" do
    get "/result?result=1"
    assert_response :success
  end
end
