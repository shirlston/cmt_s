class NpiRecordsController < ApplicationController
  def index
    @npi_records = NpiRecord.all.reload.order('ordinal_position DESC')
    if enter_search_params.present?
      search_number = enter_search_params[:number].to_i
      NpiRecord.new.find_by_number(search_number)
      redirect_to request.referrer
    end
  end

  def create
    def create
      @npi_record = NpiRecord.new.find_by_number(search_number)
      respond_to do |format|
        format.html { redirect_to npi_records_path, notice: 'Record successfully created.' }
      end
    end




    if enter_search_params.present?
      search_number = enter_search_params[:number].to_i
      NpiRecord.new.find_by_number(search_number)
      redirect_to request.referrer
    end
  end

  private

  def enter_search_params
    params.permit(:number)
  end
end
