class ArchiveController < ApplicationController
  def index
    @entries = Entry.find(:all)
  end

end
