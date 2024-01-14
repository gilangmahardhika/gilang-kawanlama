require 'csv'
class Export < ApplicationRecord
  belongs_to :user

  STATUS = ["InProgress", "Finished"]

  ## Somehow Doens't work on RSpec
  before_validation :set_initial_status, on: :create

  validates_presence_of :status, :user_id
  validates_inclusion_of :status, in: STATUS

  ## Somehow it doesn't work
  # delegate :name, to: :user
  # delegate :email, to: :user

  # mount_uploader :file, ExportUploader
  after_create :create_file


  ## Somehow doesn't work on RSpec
  def set_initial_status
    self.status = "InProgress"
  end

  ## Hacking delegate
  [:name, :email].each do |item|
    define_method "user_#{item}" do
      user.send(item)
    end
  end

  def create_file
    CSV.open(Rails.root.join("app/exports/export_#{id}.csv"), "w") do |csv|
      csv << ["SKU", "Name", "Count"]
    end
  end

  def export_data
    source_file = Rails.root.join("app/exports/export_#{id}.csv")
    CSV.open(source_file, "a") do |csv|
      Product.find_each(batch_size: 1000).each do |p|
        csv << [p.sku, p.name, p.count]
      end
    end
  end
end
