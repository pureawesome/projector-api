require 'test_helper'

class ProjectTest < ActiveSupport::TestCase
  should have_db_column(:name)
  should have_db_column(:description)
  should have_db_column(:start_date)
  should have_db_column(:projected_end_date)
  should have_db_column(:actual_end_date)
  should have_db_column(:budget)
  should have_db_column(:cost)
end
