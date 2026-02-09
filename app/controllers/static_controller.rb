class StaticController < ApplicationController
  def index
    file = Rails.root.join("public", "index.html")

    if File.exist?(file)
      render file: file, layout: false, content_type: "text/html"
    else
      render plain: "Frontend not built. Run: cd frontend && ng build", status: :service_unavailable
    end
  end
end
