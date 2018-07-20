class MachinesController < ApplicationController

  def show
    @machine = Machine.find(params[:id])
  end

end
