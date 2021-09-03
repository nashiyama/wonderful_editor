# == Schema Information
#
# Table name: articles
#
#  id         :bigint           not null, primary key
#  body       :text
#  title      :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  user_id    :bigint           not null
#
# Indexes
#
#  index_articles_on_user_id  (user_id)
#
# Foreign Keys
#
#  fk_rails_...  (user_id => users.id)
#
require "rails_helper"

RSpec.describe Article, type: :model do
  context "必要な情報が全て揃っているとき" do
    let(:article) { build(:article) }
    it "記事が作られる" do
      expect(article).to be_valid
    end
  end

  context "title が入力されていない場合" do
    let(:article) { build(:article, title: nil) }
    it "記事の作成に失敗する" do
      expect(article).not_to be_valid
    end
  end
end
