module StudySupport
  def study_create(_study)
    visit '/study/new'
    fill_in 'content', with: 'テスト'
    fill_in 'material', with: 'テスト'
    fill_in 'period', with: '002021-04-01'
    click_button '作成'
  end
end
RSpec.configure do |config|
  config.include StudySupport
end
