Paperclip::Attachment.default_options.merge!(
    :path => ":rails_root/public/upload/:attachment/:id/:style/:basename.:extension",
    :url => "/upload/:attachment/:id/:style/:basename.:extension"
)
