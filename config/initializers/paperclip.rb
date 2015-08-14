Rails.env.production? do
  Paperclip::Attachment.default_options[:s3_host_alias] = 's3-sa-east-1.amazonaws.com'
  Paperclip::Attachment.default_options[:path] = '/:class/:attachment/:id_partition/:style/:filename'
end
