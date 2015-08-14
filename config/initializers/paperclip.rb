Rails.env.production? do
  Paperclip::Attachment.default_options[:url] = 'goodbooksimages.s3.amazonaws.com'
  Paperclip::Attachment.default_options[:path] = '/:class/:attachment/:id_partition/:style/:filename'
end
