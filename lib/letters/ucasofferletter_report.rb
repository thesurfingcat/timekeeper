class UcasofferletterReport < ApplicationReport
  def initialize(app,choice) 
    @app = Ucasapp.find(app)        
    @choice = Ucaschoice.find(choice) 
    @courseinstance = Courseinstance.find(:first, :conditions => {:ucas_code => @choice.courseCode, :entry_year => @choice.yearOfEntry, :entry_month => @choice.monthEntry, :point_of_entry => @choice.pointOfEntry, :location => @choice.campus, :ucas_direct_ind => 'U'}) 
    @agent = Ucasagent.find_by_ucasapp_id(@app.id)
    @course = Course.find(@courseinstance.course_id)  
    @startdate ='Not Set'
    @enddate = 'Not Set'
    @name = @app.title.to_s + " " + @app.firstname.to_s + " " + @app.surname.to_s
    if @courseinstance.int_fee == nil or @courseinstance.int_fee == "" or @courseinstance.int_fee == 0
      @fee = "To be confirmed."
    else      
      @fee = "£" + (@courseinstance.int_fee.to_i - @choice.int_scholarship_awarded.to_i).to_s
    end       
    if @courseinstance.int_start_date !=nil
      @startdate = @courseinstance.int_start_date.strftime('%d/%m/%Y')
    end  
    if @courseinstance.int_end_date !=nil
        @enddate = @courseinstance.int_end_date.strftime('%d/%m/%Y')
    end
    @data = [[@name,@course.coursetitle.to_s,@fee,@startdate,@enddate]]  
    @sigs = "#{RAILS_ROOT}/public/images/AHood.jpg"
    
    if @choice.int_deposit_amount_req == nil or @choice.int_deposit_amount_req == " " or @choice.int_deposit_amount_req == 0
      @govsponsor = ". Government sponsored students must provide evidence of sponsorship before a visa support letter will be issued. You can use this offer letter and your visa support letter to apply for your visa." 
      else 
      @govsponsor = " and also pay a deposit of £" + @choice.int_deposit_amount_req.to_s + " <bold>within 21 days.</bold> Once you have paid this deposit we will issue you with an unconditional offer letter and a visa support letter. You can use this offer letter and your visa support letter to apply for your visa."  
    end

    if @choice.int_deposit_amount_req == nil or @choice.int_deposit_amount_req == " " or @choice.int_deposit_amount_req == 0
      @govsponsorconditional = " . Government sponsored students must provide evidence of sponsorship before a visa support letter will be issued. Once you have informed us that you have met the conditions above we will issue you with an unconditional offer letter and a visa support letter. You can use your unconditional offer letter and your visa support letter to apply for your visa." 
      else 
      @govsponsorconditional = " and also pay a deposit of £" + @choice.int_deposit_amount_req.to_s + " <bold>within 21 days.</bold> Once you have informed us that you have met the conditions above we will issue you with an unconditional offer letter and a visa support letter. You can use your unconditional offer letter and your visa support letter to apply for your visa."  
    end

    if @courseinstance.int_start_date != nil and @courseinstance.int_end_date != nil
       @start_end_date = @courseinstance.int_start_date.strftime("#{@courseinstance.int_start_date.day.ordinalize} %B %Y") + "     <bold>Course End Date:</bold> " +  @courseinstance.int_end_date.strftime("#{@courseinstance.int_end_date.day.ordinalize} %B %Y")
    end 
  end
  
  def render_header
  end

  def render_body
    pdf.tags :bold => { :font_family => "#{RAILS_ROOT}/public/fonts/Arial Bold.ttf"  }  
    pdf.font "#{RAILS_ROOT}/public/fonts/Arial.ttf"
    
    pdf.font_size 10   
    pdf.move_down(50)
    pdf.text @name
    
    if @app.homeAddress1 == "-" or @app.homeAddress1 == nil or @app.homeAddress1 == ""
      pdf.text @app.address1.to_s
      pdf.text @app.address2.to_s
      pdf.text @app.address3.to_s
      pdf.text @app.address4.to_s
      pdf.text @app.postcode.to_s 
      pdf.text @app.country.to_s
    else
      pdf.text @app.homeAddress1.to_s
      pdf.text @app.homeAddress2.to_s
      pdf.text @app.homeAddress3.to_s
      pdf.text @app.homeAddress4.to_s
      pdf.text @app.homePostcode.to_s
      pdf.text @app.homeCountry.to_s 
    end
  
    pdf.move_down(10)
    pdf.text Time.now.strftime("#{Time.now.day.ordinalize} %B %Y")
    pdf.move_down(10) 
    pdf.text "Dear " + @app.firstname.to_s + ","      
    pdf.move_down(10) 
    pdf.text "Personal ID: " + @app.personalId.to_s
    pdf.move_down(10)         
  
    # Unconditional Letter
    if @choice.decision == 'U'
      pdf.text "I am pleased to confirm that The University of Glamorgan is able to make you an <bold>unconditional</bold> offer of a place onto the course as described below:" 
    else
      pdf.text "I am pleased to confirm that The University of Glamorgan is able to make you a <bold>conditional</bold> offer of a place onto the course as described below:"      
    end    
    
    pdf.move_down(10) 
    pdf.text "<bold>Course:</bold> " + @course.coursetitle.to_s
    pdf.text "<bold>Course Start Date:</bold> " + @start_end_date.to_s 
    
    if @choice.int_scholarship_awarded != nil
      pdf.text "<bold>Scholarship Awarded:</bold> "+ '£' + @choice.int_scholarship_awarded.to_s + "*"   
      pdf.text  "<bold>Fees Per Year (after scholarship):</bold>" + @fee + "*"
    else
      if @courseinstance.int_fee == nil or @courseinstance.int_fee == "" or @courseinstance.int_fee == 0
        pdf.text "<bold>Fees per Year: </bold>To be confirmed."
      else
        pdf.text "<bold>Fees per Year: </bold>£" + @courseinstance.int_fee.to_s + "*"
      end
    end 
    
    pdf.move_down(10)  
  
    if @choice.decision == 'C'
      pdf.text @choice.conditions.to_s  
      pdf.move_down(10)
    end 
  
    if @course.int_atas_clearance_reqd == "Yes"
       pdf.text "The course you have applied to study may require you to gain additional approval from the United Kingdom Government before you are able to apply for a visa to enter the country. For more information, please go to the following website <a href='http://www.fco.gov.uk/atas'>www.fco.gov.uk/atas</a> which will provide you with further information on ATAS and an application form. <bold>For your information the JACS code for your course is " + course.int_atas_code.to_s + "</bold>"
    end
    
    pdf.move_down(10) 
    
    if @choice.decision == "U"
      pdf.text "To secure your place you must now accept this offer by emailing <u>interadmit@glam.ac.uk</u>" +  @govsponsor
    else
      pdf.text "To secure your place you must now accept this offer by emailing <u>interadmit@glam.ac.uk</u>" +  @govsponsorconditional
    end        
    
   pdf.move_down(10) 
   pdf.text"You should expect to pay approximately £600 per month towards living expenses (which will include your accommodation). Information about accommodation costing and an accommodation application form are available from <a href='http://www.glam.ac.uk/accommodation/'>www.glam.ac.uk/accompdf.modation</a>."
   pdf. move_down(10)
   pdf.text "Please visit our website at <a href='http://international.glam.ac.uk'>http://international.glam.ac.uk</a> for further details regarding living and studying at The University of Glamorgan."
   pdf.move_down(10)

   if (@agent != nil and @agent.name != nil)
     pdf.text "If you have any further queries regarding your offer please contact our local representative " + Agentcode.find(@agent.name).description + " or us in the Enquiries and Admissions Unit."  
   else
     pdf.text "If you have any further queries regarding your offer please contact us in the Enquiries and Admissions Unit." 
   end 
        
   pdf.move_down(10)  
   pdf.text "Yours sincerely" 
   pdf.move_down(10)
   pdf.image @sigs, :scale => 0.7
   pdf.move_down(10)
   pdf.text "<bold>Andrew Hood</bold>"
   pdf.text "<bold>Admissions Manager</bold>"
   pdf.move_down(5)    
   pdf.text "*Terms and conditions apply. Please visit <a href='http://international.glam.ac.uk/TermsandConditions/'>http://international.glam.ac.uk/TermsandConditions/</a>"  
                                                                                      
   pdf.start_new_page 
   #Second Page of PDF
   pdf.move_down(50) 
  
   pdf.text "<bold>Proforma Invoice</bold>", :align => :center
   pdf.move_down(10)
   pdf.text "Personal ID: " + @app.personalId.to_s  
   pdf.move_down(10)
      
   pdf.table @data,
   :headers => ["Student Name", "Course","Amount to pay","Course start date","Course end date"],
   :vertical_padding => 5,
   :horizontal_padding => 3,
   :border_color => '#00000',
   :column_widths => {0 => 85, 1 => 170, 2 => 80, 3 => 85, 4 => 85},
   :font_size => 10
  
   pdf.move_down(10)

   pdf.text "The amount you will need to pay depends on the course on which you will be enrolling."     
   pdf.text "Please see details below:"                  
   pdf.move_down(20)      
   pdf.text "International Foundation Program:        100% of fees payable"  
   pdf.move_down(10)           
   pdf.text "English Language Course:                    100% of fees payable" 
   pdf.move_down(10)               
   pdf.text "Pre-Masters Program:                           100% of fees payable" 
   pdf.move_down(10)           
   pdf.text "Undergraduate Degree:                         50% of fees payable"   
   pdf.move_down(10)   
   pdf.text "Postgraduate Degree:                            50% of fees payable" 
   pdf.move_down(20)
   pdf.text "Any remaining fees must be paid in equal instalments*"   
   pdf.move_down(20)
   pdf.text "This payment covers tuition fees only. You will be invoiced separately for any accommodation you require."
   pdf.move_down(20)
   pdf.text "We suggest that payments be made by Bankers Draft payable to the University of Glamorgan or via bank transfer to:"
   pdf.move_down(20)  
   
   #  bounding_box([150,270], :width => 200, :height => 100) do
   pdf.text "                                                  BANK: HSBC"
   pdf.text "                                                  ADDRESS: Taff Street, Pontypridd, UK"
   pdf.text "                                                  SORTING CODE: 40-37-08"
   pdf.text "                                                  ACCOUNT NUMBER: 71197371"         
   pdf.text "                                                  SWIFT/ BIC: MIDL GB21 49L"   
   pdf.text "                                                  IBAN: GB43 MIDL 403708 71197371" 
   # end

   pdf.move_down(20) 
   pdf.text "Please ensure that your FULL NAME AND PERSONAL ID are clearly stated on any correspondence with us including your payment documents as this will help us identify your records and payments. Failure to do this could result in a delay to us helping you."
   pdf.move_down(10)
   pdf.text "Once payment has been made please ensure that you send us evidence in order for us to keep our records updated."
   pdf.move_down(10)
   pdf.text "*Terms and conditions apply. Please visit <a href='http://international.glam.ac.uk/TermsandConditions/'>http://international.glam.ac.uk/TermsandConditions/</a>"
  end
end