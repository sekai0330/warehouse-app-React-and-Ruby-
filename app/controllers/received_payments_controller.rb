class ReceivedPaymentsController < ApplicationController
  # protect_from_forgery 
  def index
    keyword = params[:keyword]
    offset = params[:offset]
    limit = params[:limit]
    
    instock_from_date = params[:instockFromDate].present? ? Date.strptime(params[:instockFromDate]) : nil
    instock_to_date = params[:instockToDate].present? ? Date.strptime(params[:instockToDate]) : nil

    process_from_date = params[:processFromDate].present? ? Date.strptime("#{params[:processFromDate]} 00:00:00") : nil
    process_to_date = params[:processToDate].present? ? Date.strptime("#{params[:processToDate]} 00:00:00") : nil

    shipper = params[:shipper].presence&.to_i


    received_payments = ReceivedPayment.includes(:shipper)
    count = received_payments.count

    if instock_from_date.present?
      received_payments = received_payments.where('received_on > ?',instock_from_date)
    end
    if instock_to_date.present?
      received_payments = received_payments.where('received_on < ?',instock_to_date)
  
    end
    if process_from_date.present?
      received_payments = received_payments.where('process_on > ?', process_from_date)
    
    end
    if process_to_date.present?
      received_payments = received_payments.where('process_on < ?',process_to_date)
    end

    if shipper.present?
      received_payments = received_payments.where('shipper_id < ?', shipper)
    end

    received_payments = received_payments.offset(offset).limit(limit)
   
    render :json => {
      data: ReceivedPaymentSerializer.new(received_payments).as_json,
      count: count
    } 
      # data: receivedPayments,
  end
  def create
    receivedPayment = ReceivedPayment.create(
      shipper_id:       params[:shipper_id],
      received_on:      params[:received_on],
      amount:           params[:amount],
      description:      params[:description],
      processing_on:    params[:processing_on],
      received:         0
    )

    if receivedPayment.save
      render json:  :accepted
    end
  end
  def update
    if ReceivedPayment.where(id: params[:id]).update_all(
      shipper_id:       params[:shipper_id],
      received_on:      params[:received_on],
      amount:           params[:amount],
      description:      params[:description],
      processing_on:    params[:processing_on],
      received:         1
      )

      render json:  :accepted
    end
  end
  def destroy
    puts "====================="
    ReceivedPayment.destroy(params[:id])
    
    render json:  :accepted
  end
end
