# == Schema Information
#
# Table name: listing_shapes
#
#  id                     :integer          not null, primary key
#  community_id           :integer          not null
#  transaction_process_id :integer          not null
#  price_enabled          :boolean          not null
#  shipping_enabled       :boolean          not null
#  name                   :string(255)      not null
#  name_tr_key            :string(255)      not null
#  action_button_tr_key   :string(255)      not null
#  sort_priority          :integer          default(0), not null
#  created_at             :datetime         not null
#  updated_at             :datetime         not null
#  deleted                :boolean          default(FALSE)
#  availability           :string(32)       default("none")
#
# Indexes
#
#  index_listing_shapes_on_community_id  (community_id)
#  index_listing_shapes_on_name          (name)
#  multicol_index                        (community_id,deleted,sort_priority)
#

class ListingShape < ActiveRecord::Base

  has_and_belongs_to_many :categories, -> { order("sort_priority") }, join_table: "category_listing_shapes"
  has_many :listing_units
end
