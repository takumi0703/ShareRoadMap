module CommentSupport
  def comment_create(_comment)
    fill_in 'comment_content', with: 'テストコメント'
    click_button '作成'
  end
end
RSpec.configure do |config|
  config.include CommentSupport
end
