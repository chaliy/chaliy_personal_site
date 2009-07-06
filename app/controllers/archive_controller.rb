class ArchiveController < ApplicationController
  def list
    @entryCount = 1212 #Entry.find(:all).length()
  end

end
