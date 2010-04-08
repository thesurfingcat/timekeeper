class UcasvisaletterReport < ApplicationReport  
  def initialize(app,choice)
    @app = Ucasapp.find(app)        
    @choice = Ucaschoice.find(choice) 
    @courseinstance = Courseinstance.find(:first, :conditions => {:ucas_code => @choice.courseCode, :entry_year => @choice.yearOfEntry, :entry_month => @choice.monthEntry, :point_of_entry => @choice.pointOfEntry, :location => @choice.campus, :ucas_direct_ind => 'U'}) 
    @course = Course.find(@courseinstance.course_id)  
    @sigs = "#{RAILS_ROOT}/public/images/AHood.jpg"
    @nationality = Nationalitycode.find_by_code(@app.nationalityCode)
    @campus = Campuscode.find_by_code(@course.campus)
    
    if @nationality == nil or @nationality == ""
      @nationality = " "
    else 
      @nationality = @nationality.description
    end  
  end
  
  def render_header
  end

  def render_body
    pdf.font "#{RAILS_ROOT}/public/fonts/Arial.ttf" 
    pdf.tags :bold => { :font_family => "#{RAILS_ROOT}/public/fonts/Arial Bold.ttf"  }
    pdf.font_size 10  
    pdf.move_down(20)
    pdf.text "<bold>Visa Support Letter</bold>", :align => :center
    pdf.move_down(8)
    pdf.text "We would appreciate your assistance in granting the student named below a visa under the Tier 4 - General Student category to study at the University of Glamorgan."
  	pdf.move_down(5)
    pdf.text "<bold>CAS Number:</bold>"
    pdf.text "<bold>Date of issue:</bold>" 
    pdf.text "<bold>Personal ID:</bold>"
    pdf.text "<bold>Name:</bold>" 
    pdf.text "<bold>Address:</bold>" 
    pdf.text " "
    pdf.text " "
    pdf.text " "
    pdf.text " "
    pdf.text " "
    pdf.text " "
    pdf.text "<bold>Nationality:</bold>" 
    pdf.text "<bold>Passport Number:</bold>" 
    pdf.text " "
    pdf.text "<bold>Sponsor Licence Number:</bold>"
    pdf.text " "
    pdf.text "<bold>Unconditional Offer for:</bold>"
    pdf.text " "  
    pdf.text "<bold>Academic Level:</bold>"
    pdf.text "<bold>Start Date:</bold>"
    pdf.text "<bold>End Date:</bold>" 
    pdf.text "<bold>Mode of Study:</bold>" 
    pdf.text "<bold>Last Enrolment Date:</bold>"
    pdf.text "<bold>ATAS Required:</bold>"  
    pdf.text "<bold>Location of Study:</bold>" 
    pdf.text " "
    pdf.text " "
    pdf.text " "
    pdf.text " "
    pdf.text " "
    pdf.text "<bold>Course Fee:</bold>" 
    pdf.text "<bold>Course Fee Paid To Date:</bold>"
    pdf.text "<bold>Receipt Number:</bold>"  
    pdf.text "<bold>Living Cost:</bold>" 
    pdf.text "<bold>Accommodation Fee Paid To Date:</bold>" 
    pdf.text "<bold>Receipt Number:</bold>" 
    pdf.text " "
    pdf.text "<bold>How suitability was assessed:</bold>"
    pdf.text "<bold>Course Title:</bold>" 
    pdf.text "<bold>Course Type:</bold>" 
    pdf.text "<bold>Awarding body:</bold>" 
    pdf.text "<bold>English Course Title:</bold>" 
    pdf.text "<bold>Grade:</bold>"
    pdf.text "<bold>Non academic qualifications:</bold>"
    pdf.move_down(10)
    pdf.text "If any of the information above is unclear or if you require any additional information please feel free to contact us and we will be happy to help."
    pdf.move_down(5)
    pdf.text "Best regards"
    pdf.move_down(5)
    pdf.image @sigs, :scale => 0.7
    pdf.move_down(5)
    pdf.text "A Hood"
    pdf.text "Admissions Manager"
    pdf.text "Enquiries & Admissions Unit"

    pdf.bounding_box([200,640], :width => 300) do
      
	    if @choice.CAS_number == "" or @choice.CAS_number == nil
	      pdf.text "N/A"
	    else
        pdf.text @choice.CAS_number.to_s
	    end 
	 
      pdf.text Time.now.strftime('%d/%m/%Y')
      pdf.text @app.personalId
      pdf.text @app.firstname.to_s + ' ' + @app.surname

      if  @app.homeAddress1 == "-" or @app.homeAddress1 == nil or @app.homeAddress1 == ""
        pdf.text @app.address1.to_s
        
        if @app.address2 == nil or @app.address2 == ""
          pdf.text " "
        else 
          pdf.text @app.address2.to_s
        end

        if @app.address3 == nil or @app.address3 == ""
          pdf.text " "
        else 
          pdf.text @app.address3.to_s
        end

        if @app.address4 == nil or @app.address4 == ""
          pdf.text " "
        else 
          pdf.text @app.address4.to_s
        end
        
        if @app.postcode == nil or @app.postcode == ""
          pdf.text " "
        else 
          pdf.text @app.postcode.to_s
        end  
        
        if @app.country == nil or @app.country == ""
          pdf.text " "
        else 
          pdf.text @app.country.to_s
        end

      else

        if @app.homeAddress1 == nil or @app.homeAddress1 == ""
          pdf.text " "
        else 
          pdf.text @app.homeAddress1.to_s
        end  

        if @app.homeAddress2 == nil or @app.homeAddress2 == ""
          pdf.text " "
        else 
          pdf.text @app.homeAddress2.to_s
        end

        if @app.homeAddress3 == nil or @app.homeAddress3 == ""
          pdf.text " "
        else 
          pdf.text @app.homeAddress3.to_s
        end

        if @app.homeAddress4 == nil or @app.homeAddress4 == ""
          pdf.text " "
        else 
          pdf.text @app.homeAddress4.to_s
        end
        
        if @app.homePostcode == nil or @app.homePostcode == ""
          pdf.text " "
        else 
          pdf.text @app.homePostcode.to_s
        end 
        
        if @app.homeCountry == nil or @app.homeCountry == ""
          pdf.text " "
        else 
          pdf.text @app.homeCountry.to_s
        end  
           
      end # end of // @app.homeAddress1 == "-" or @app.homeAddress1 == nil or @app.homeAddress1 == "" 
      
      pdf.text " "
      pdf.text @nationality

      if @app.passport_no == nil or @app.passport_no ==""
        pdf.text "N/A"
      else 
        pdf.text @app.passport_no
      end

      pdf.text " "
      pdf.text "4KU1B9ND9"
      pdf.text " "
      pdf.text @course.coursetitle.to_s      
    end # End of Bounding Box  

    pdf.bounding_box([200,445], :width => 300) do

      if @choice.int_academic_level == nil or @choice.int_academic_level ==""
        pdf.text " "
      else
        pdf.text @choice.int_academic_level.to_s
      end
  
    	pdf.text @courseinstance.int_start_date.strftime('%d/%m/%Y')
    	pdf.text @courseinstance.int_end_date.strftime('%d/%m/%Y')

      if @courseinstance.mode_of_study == "FT"
        pdf.text "Full Time"
      end
      
      if @courseinstance.mode_of_study == "PT"
        pdf.text "Part Time"
      end
      
      if @courseinstance.mode_of_study == "SW"
        pdf.text "Sandwich"
      end

      if @courseinstance.international_extension_date == nil or @courseinstance.international_extension_date == ""
        pdf.text " "
      else 
        pdf.text @courseinstance.international_extension_date.strftime('%d/%m/%Y')
      end
    
      if @course.int_atas_clearance_reqd =="Yes"
        pdf.text "Yes " + @course.int_atas_code
      else
        pdf.text "No"
      end

      if @campus.description == nil or @campus.description ==""
        pdf.text " "
      else
        pdf.text @campus.description
      end
      
      if @campus.campus_address1 == nil or @campus.campus_address1 == ""
        pdf.text " "
      else    
        pdf.text @campus.campus_address1
      end
      
      if @campus.campus_address2 == nil or @campus.campus_address2 == ""
        pdf.text " "
      else    
        pdf.text @campus.campus_address2
      end
      
      if @campus.campus_address3 == nil or @campus.campus_address3 == ""
        pdf.text " "
      else    
        pdf.text @campus.campus_address3
      end
      
      if @campus.campus_postcode == nil or @campus.campus_postcode == ""
        pdf.text " "
      else    
        pdf.text @campus.campus_postcode
      end
      pdf.text " "
	    
	    if @courseinstance.int_fee == nil or @courseinstance.int_fee == ""
        pdf.text "To be confirmed."
      else
        pdf.text  "£" + @courseinstance.int_fee.to_s
      end
	     
    	if @choice.int_deposit_amount_rec == nil or @choice.int_deposit_amount_rec == ""
    	  pdf.text "£0"
      else 
        pdf.text "£" + @choice.int_deposit_amount_rec.to_s
      end

    	if @choice.int_RCTB_LRCT_ref_no == nil or @choice.int_RCTB_LRCT_ref_no == ""
    	  pdf.text "N/A"
      else
        pdf.text @choice.int_RCTB_LRCT_ref_no.to_s
      end
	
    	pdf.text "£600 per month"
	
    	if @choice.int_accommodation_fees_paid == nil or @choice.int_accommodation_fees_paid == ""
    	  pdf.text "N/A"
      else
    	  pdf.text "£" + @choice.int_accommodation_fees_paid.to_s
      end

    	if @choice.int_accommodation_receipt_ref == nil or @choice.int_accommodation_receipt_ref == ""
    	  pdf.text "N/A"
      else
        pdf.text @choice.int_accommodation_receipt_ref.to_s
      end
      pdf.text " "
      pdf.text " "
      if @choice.int_highest_qual_course_title == nil or @choice.int_highest_qual_course_title == ""
        pdf.text " "
      else
    	 pdf.text @choice.int_highest_qual_course_title.to_s
     end
 
     if @choice.int_highest_qual_course_type == nil or @choice.int_highest_qual_course_type == ""
       pdf.text " "
     else
    	 pdf.text @choice.int_highest_qual_course_type.to_s 
     end
 
     if @choice.int_highest_qual_awarding_body == nil or @choice.int_highest_qual_awarding_body == ""
       pdf.text " "
     else
    	 pdf.text @choice.int_highest_qual_awarding_body.to_s
     end
 
     if @choice.int_english_qual_course_title == nil or @choice.int_english_qual_course_title == ""
       pdf.text " "
    else
       pdf.text @choice.int_english_qual_course_title.to_s
     end
 
     if @choice.int_english_qual_course_grade == nil or @choice.int_english_qual_course_grade == ""
       pdf.text " "
     else
       pdf.text @choice.int_english_qual_course_grade.to_s
     end
 
     if @choice.int_non_academic_qual == nil or @choice.int_non_academic_qual == ""
       pdf.text " "
     else
       pdf.text @choice.int_non_academic_qual.to_s
     end
   end # End of Bounding Box
  
  end 
end