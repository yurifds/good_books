Rails.env.production? do
  Paperclip::Attachment.default_options[:url] = 'http://yuribooksimages.s3-website-us-west-2.amazonaws.com/'
  Paperclip::Attachment.default_options[:path] = '/:class/:attachment/:id_partition/:style/:filename'
end
