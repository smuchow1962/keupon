class MerchantAnalyticsController < ApplicationController
  include AuthenticatedSystemMerchant
 layout 'application_merchant'
  protect_from_forgery :only => [:destroy]
  before_filter :login_required

  def index
    
  end

  def sales_report
    if request.xml_http_request?
      respond_to do |format|
        format.html
        format.js {
          render :update do |page|
            page.replace_html 'date_display', "<h3>(#{params[:start_date]} - #{params[:end_date]})</h3>"
          end
        }
      end
    end
  end

  def customers_report
    
  end

  def deals_report
    if request.xml_http_request?
      respond_to do |format|
        format.html
        format.js {
          render :update do |page|
            page.replace_html 'report_title', "<h3>Deals Report (#{params[:start_date]} - #{params[:end_date]})</h3>"
          end
        }
      end
    end
  end

  def location_deal_sales_revenue
    if request.xml_http_request?
      respond_to do |format|
        format.html
        format.js {
          render :update do |page|
            page.replace_html 'location_deal_sales_revenue_report', :partial => "location_deal_sales_revenue"
          end
        }
      end
    end
  end
end
