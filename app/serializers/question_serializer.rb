# Step 2 for Serializer- Run terminal command to generate this serializer
# rails g serializer question
class QuestionSerializer < ActiveModel::Serializer
  attributes(
    :id, 
    :title,
    :body, 
    :created_at,
    :updated_at,
    :view_count, 
    :randomstuff,
    :like_count)
  def randomstuff
    'You can add anything to your json response, This is an example'
  end
  def like_count
    #  object refers to the instane of the model being serialized. kind of 'this' in js and 'self' in ruby
    object.likes.count
  end

end
