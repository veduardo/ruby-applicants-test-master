class ModelsController < ApplicationController
  include FetcherHelper

  def index
    if params[:webmotors_make_id] != "0"
      make = Make.where(webmotors_id: params[:webmotors_make_id])[0]

      # Fetches the makes
      models_json = fetch("modelos")

      debugger

      # Itera no resultado e grava os modelos que ainda não estão persistidas
      models_json.each do |json|
        if Model.where(name: json["Nome"], make_id: make.id).size == 0
          Model.create(make_id: make.id, name: json["Nome"])
        end
      end
    else
      redirect_to :back
    end
  end
end
