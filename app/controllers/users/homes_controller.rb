class Users::HomesController < ApplicationController
  def top
    @items = Item.limit(5).order(" created_at DESC ")
  end

  def search
    keywaords_str = "#{params[:keyword]} #{params[:comp_keyword]}"
    # キーワード分割
    if keywaords_str.present?
      keywords = keywaords_str.split(/[[:blank:]]+/).select(&:present?)

      # 普通のキーワードとマイナスのキーワードを分ける
      negative_keywords, positive_keywords =
        keywords.partition { |keyword| keyword.start_with?("-") }
      
      @items = Item.all

      # 商品検索ワードの数だけand検索を行う
      positive_keywords.each do |keyword|
        @items = @items.where("name LIKE ?", "%#{keyword}%")
      end
  
      # マイナスキーワードの先頭から-を取り除く
      negative_keywords.each { |word| word.slice!(/^-/) }
  
      # マイナスキーワードでnot検索
      negative_keywords.each do |keyword|
        next if keyword.blank?
        @items = @items.where.not("component LIKE ?", "%#{keyword}%")
      end
      
      @components = Component

      # 検索ワードの数だけand検索を行う
      positive_keywords.each do |keyword|
        @components = @components.where("name LIKE ?", "%#{keyword}%")
      end

      # マイナスキーワードの先頭から-を取り除く
      negative_keywords.each { |word| word.slice!(/^-/) }
    
      # マイナスキーワードでnot検索
      negative_keywords.each do |keyword|
        next if keyword.blank?
        @components = @components.where.not("name LIKE ?", "%#{keyword}%")
      end
    else
      @items = Item.all
    end

  end
end