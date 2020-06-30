class Employee < ApplicationRecord
  self.inheritance_column = :designation

  validates :designation, presence: true

  scope :projectmanagers, -> { where(designation: 'ProjectManager') }
  scope :teamleaders, -> { where(designation: 'TeamLeader') }
  scope :developers, -> { where(designation: 'Developer') }
  scope :testers, -> { where(designation: 'Tester') }

  def self.responsibilities
		raise 'Abstract Method'
	end

  def self.designations
    %w(ProjectManager TeamLeader Developer Tester)
  end
end