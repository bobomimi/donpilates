Paperclip::Attachment.default_options[:url] = ':class/:s3_domain_url'
Paperclip::Attachment.default_options[:path] = '/:filename'
Paperclip::Attachment.default_options[:s3_host_name] = 's3-eu-west-1.amazonaws.com'
#/:class/:attachment/:id_partition/:style