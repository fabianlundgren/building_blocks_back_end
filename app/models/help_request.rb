class HelpRequest < ApplicationRecord
  validates_presence_of :title, :message
  has_one :workorder
end
