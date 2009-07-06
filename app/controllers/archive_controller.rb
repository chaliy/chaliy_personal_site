class ArchiveController < ApplicationController
  def list
    @entryCount = Entry.find(:all).length()
  end

end
