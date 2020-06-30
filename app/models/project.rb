class Project < ActiveRecord::Base

    scope :status, -> (status) { where status: status }

    enum status: [:not_started, :in_progress, :on_hold, :complete]


    validates :name,
              length: { maximum: 225 },
              presence: true
    validates :status,
              presence: true,
              inclusion: {
                in: statuses.keys,
                message: "must be either " + statuses.keys.join(" or ")
              }
    validates :description,
              presence: true,
              length: { maximum: 3000 }
    


    belongs_to :department
    belongs_to :user

  end
