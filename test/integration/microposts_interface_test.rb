require 'test_helper'

class MicropostsInterfaceTest < ActionDispatch::IntegrationTest

  def setup
    @user = users(:one)
  end

  test "micropost interface" do
    log_in_as(@user)
    get root_path
    assert_select 'div.pagination'
    assert_select 'input[type=file]'
    # Invalid submission
    assert_no_difference 'Micropost.count' do
      post microposts_path, params:{ micropost: { content: "" } }
    end
    assert_select 'div#error_explanation'
    # Valid submission
    content = "این یک محتوای آزمایش است."
    picture = fixture_file_upload('test/fixtures/test_pic.png', 'image/png')
    assert_difference 'Micropost.count', 1 do
      post microposts_path, params:{ micropost: { content: content, picture: picture } } #
    end
    assert assigns(:micropost).picture?
    assert_redirected_to root_url
    follow_redirect!
    assert_match content, response.body
    # Delete a post.
    assert_select 'a', text: 'حذف'
    first_micropost = @user.microposts.paginate(page: 1).first
    assert_difference 'Micropost.count', -1 do
      delete micropost_path(first_micropost)
    end
    # Visit a different user.
    get user_path(users(:two))
    assert_select 'a', text: 'حذف', count: 0
  end

end
