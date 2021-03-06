class UpdateSwiftypeDocumentJob < Struct.new(:post_id)
  def perform
    post = Post.find(post_id)
    engine = Swiftype::Engine.find('my-awesome-blog')
    type = engine.document_type('post')
    type.update_document(:external_id => post.id,
                         :fields => {:title => post.title,
                                     :body => post.body})
  end
end
